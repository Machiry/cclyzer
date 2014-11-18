import argparse

from copper.analysis import Analysis
from copper.project import Project

def main():
    # Create CLI parser
    parser = argparse.ArgumentParser(description='Analyze LLVM bitcode.')
    parser.add_argument('-i', '--input-dir', metavar='DIRECTORY', required = True,
                        help='directory containing LLVM bitcode files to be analyzed')
    parser.add_argument('-o', '--output-dir', metavar='DIRECTORY', required = True,
                        help='output directory')

    args = parser.parse_args()       # parse arguments
    analysis = Analysis(args) # create analysis
    analysis.generate_facts()        # generate CSV facts
    analysis.create_database()       # create database

    symbol_lookup_proj = Project()
    symbol_lookup_proj.name = 'symbol-lookup'
    symbol_lookup_proj.deps = ['schema']

    analysis.load_project(symbol_lookup_proj)

    callgraph_proj = Project()
    callgraph_proj.name ='callgraph'
    callgraph_proj.deps = ['schema', 'symbol-lookup']

    analysis.load_project(callgraph_proj)

if __name__ == '__main__':
    main()
