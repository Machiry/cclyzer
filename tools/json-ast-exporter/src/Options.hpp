#ifndef OPTIONS_HPP__
#define OPTIONS_HPP__

#include <boost/filesystem.hpp>
#include <string>

namespace cclyzer {
    namespace ast_exporter {
        class Options;
    }
}

class cclyzer::ast_exporter::Options
{
  public:
    using path = boost::filesystem::path;
    typedef std::vector<path> InputFileCollection;
    typedef InputFileCollection::const_iterator input_file_iterator;

    /* Constructor given command-line options */
    Options(int argc, char* argv[]);

    const path& output_dir() const {
        return outdir;
    }

    input_file_iterator input_file_begin() const {
        return inputFiles.begin();
    }

    input_file_iterator input_file_end() const {
        return inputFiles.end();
    }

  protected:
    /* Set input files */
    template<typename FileIt> void
    set_input_files(FileIt file_begin, FileIt file_end, bool shouldRecurse);

    /* Set output directory */
    void set_output_dir(path path, bool shouldForce);

  private:
    /* Parsing failure exit code */
    const static int ERROR_IN_COMMAND_LINE = 1;

    /* Output Directory for generated facts */
    boost::filesystem::path outdir;

    /* Source Input Files */
    std::vector<boost::filesystem::path> inputFiles;
};

#endif
