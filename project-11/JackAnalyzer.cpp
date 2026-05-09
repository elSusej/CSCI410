#include "JackAnalyzer.hpp"

using namespace std;
namespace fs = filesystem;
int main(int argc, char** argv) {
        if(argc != 2) {
                cout <<"usage: JackAnalyzer <directory_path>" << endl;
                return -1;
        }
        
        fs::path inputDir(argv[1]);
        string folderName = inputDir.filename().string();

        for (const auto &entry : fs::directory_iterator(inputDir)) {
                if (entry.path().extension() == ".jack"){
                        ifstream jackFile(entry.path());
                        string jackFileName = entry.path().stem().string();  // Stem is the filename without extension - used for class name in XML output
                        JackTokenizer tokenizer(jackFile);
                        fs::path outputFilePath = inputDir / (jackFileName + ".vm");  //output file is supposed to be in same dir as in files
                        ofstream vmFile(outputFilePath); //hand off to compilation engine
                        CompilationEngine compilerPtTwo(tokenizer, vmFile);
                        vmFile.close();
                        jackFile.close();
                }
        }
}



