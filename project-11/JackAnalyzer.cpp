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
                        fs::path outputFilePath = inputDir / (jackFileName + ".xml");  //output file is supposed to be in same dir as in files
                        ofstream xmlFile(outputFilePath); //hand off to compilation engine
                        CompilationEngine compilerPtOne(tokenizer, xmlFile);
                        xmlFile.close();
                        jackFile.close();
                }
        }

}

// Temporary Tokenizer Testing Code: Paste under tockenizer constructor call to test again (just do Array Test)
// while (tokenizer.hasMoreTokens()) {
                        //         switch (tokenizer.getCurrentTokenType()) {
                        //                 case JackTokenType::KEYWORD:
                        //                         cout << "<keyword> " << tokenizer.getCurrentKeyword() << " </keyword>" << endl;
                        //                         break;
                        //                 case JackTokenType::SYMBOL:
                        //                         cout << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << endl;
                        //                         break;
                        //                 case JackTokenType::IDENTIFIER:
                        //                         cout << "<identifier> " << tokenizer.getCurrentIdentifier() << " </identifier>" << endl;
                        //                         break;
                        //                 case JackTokenType::INT_CONST:
                        //                         cout << "<integerConstant> " << tokenizer.getCurrentInt() << " </integerConstant>" << endl;
                        //                         break;
                        //                 case JackTokenType::STRING_CONST:
                        //                         cout << "<stringConstant> " << tokenizer.getCurrentString() << " </stringConstant>" << endl;
                        //                         break;
                        //         }

                        //         tokenizer.advance();


                        // }


