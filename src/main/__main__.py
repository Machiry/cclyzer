"""This module is the main entry point for command-line execution."""

import argparse
import contextlib
import copper
import logging
import os
from logging.handlers import RotatingFileHandler, SysLogHandler
from utils import contextlib2
from utils.timer import Timer
from utils.contextlib2 import stdout_redirected


def main():
    """The main function that will be called by command-line execution
    of the tool.

    """
    with setup_logging():
        # Create CLI parser
        parser = argparse.ArgumentParser(description='Analyze LLVM bitcode.')
        parser.add_argument('-i', '--input-dir', metavar='DIRECTORY', required=True,
                            help='directory containing LLVM bitcode files to be analyzed')
        parser.add_argument('-o', '--output-dir', metavar='DIRECTORY', required=True,
                            help='output directory')
        parser.add_argument('-q', '--no-config-file', dest='read_config', action='store_false')
        parser.set_defaults(read_config=True)

        # Initialize analysis
        opts = parser.parse_args()
        config = copper.AnalysisConfig(opts)
        analysis = copper.Analysis(config)

        # Try loading yaml
        try:
            import yaml
        except ImportError:
            logging.getLogger().warning('Cannot load yaml')
            opts.read_config = False

        # Customized analysis
        if opts.read_config:
            from copper.config import CustomAnalysis
            analysis = CustomAnalysis(config)

        # Dynamically decorate each analysis step
        for step in analysis.pipeline:
            # Time step plus redirect stdout to /dev/null
            step.apply = task_timing(step.message)(
                stdout_redirected()(
                    step.apply
                )
            )

        # Run analysis while timing each step, plus total time
        with task_timing('total time'):
            analysis.run()

        # Print statistics
        print "\n\n[Statistics]\n"
        print analysis.stats


@contextlib2.contextmanager
def task_timing(description):
    """This is a context manager that prints the elapsed time of some
    computation. It can also be used as a decorator.

    """
    # Define closure that prints elapsed time
    def print_time(elapsed_time):
        print "    %-32s ... %6.2fs" % (description, elapsed_time)

    # Execute task with timer
    with Timer(print_time):
        yield


@contextlib.contextmanager
def setup_logging(lvl=logging.INFO):
    """Configure logging.

    This creates a file handler to the application cache and a syslog
    handler. It also sets up log formatting and level.

    """

    # Get runtime environment and settings
    env = copper.runtime.Environment()
    settings = copper.settings

    # Get root logger and set its logging level
    root_logger = logging.getLogger()
    root_logger.setLevel(lvl)

    # Add rotating file handler
    file_log = os.path.join(env.user_cache_dir, "%s.log" % settings.APP_NAME)
    file_formatter = logging.Formatter("%(asctime)s %(levelname)5.5s - [%(name)s] %(message)s")
    file_handler = RotatingFileHandler(file_log, maxBytes=(2 ** 20), backupCount=7)
    file_handler.setFormatter(file_formatter)
    root_logger.addHandler(file_handler)

    # Add system log handler
    syslog_formatter = logging.Formatter("[{}] %(message)s".format(settings.APP_NAME))
    syslog_handler = SysLogHandler(address='/dev/log')
    syslog_handler.setFormatter(syslog_formatter)
    root_logger.addHandler(syslog_handler)

    # Start executing task
    try:
        root_logger.info('Started')
        yield
    finally:
        root_logger.info('Finished')


if __name__ == '__main__':
    main()