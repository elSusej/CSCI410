#include "JackAnalyzer.hpp"


JackTokenizer::JackTokenizer(std::ifstream& inputFile) {
        // Read entire file into string
        std::string content((std::istreambuf_iterator<char>(inputFile)), std::istreambuf_iterator<char>());

        // rmv single line cmmnts
        content = std::regex_replace(content, std::regex("//.*"), "");

        // Strip Multi-line comments (/* ... */)
        // [^]* matches everything including newlines (greedy)
        // ? makes it "lazy" so it stops at the FIRST */ it finds
        content = std::regex_replace(content, std::regex("/\\*[^]*?\\*/"), "");

        std::string keywordRegex = "\\b(class|constructor|function|method|field|static|var|int|char|boolean|void|true|false|null|this|let|do|if|else|while|return)\\b";
        std::string symbolRegex = "([\\{\\}\\(\\)\\[\\]\\.,;\\+\\-\\*/&\\|<>=~])";
        std::string intRegex = "\\b(\\d+)\\b";
        std::string stringRegex = "\"([^\"\n]*)\"";
        std::string identifierRegex = "\\b([a-zA-Z_][a-zA-Z0-9_]*)\\b";

        std::regex jackRegex(keywordRegex + "|" + symbolRegex + "|" + intRegex + "|" + stringRegex + "|" + identifierRegex);

        auto tokensBegin = std::sregex_iterator(content.begin(), content.end(), jackRegex); //create iterator to go through all matches of jackRegex from beginning to end of content
        auto tokensEnd = std::sregex_iterator();

        for (std::sregex_iterator i = tokensBegin; i != tokensEnd; ++i) {
                std::smatch match = *i;
                Token t;

                if (match[1].matched) { 
                        t.value = match[1].str();
                        t.type = JackTokenType::KEYWORD;
                } else if (match[2].matched) {
                        std::string matchedString = match[2].str();
                        if (matchedString == "<" || matchedString == ">" || matchedString == "&" || matchedString == "\"") {
                                matchedString = xmlJackReplacements[matchedString];
                        } 
                        t.value = matchedString;
                        t.type = JackTokenType::SYMBOL;
                } else if (match[3].matched) {
                        t.value = match[3].str();
                        t.type = JackTokenType::INT_CONST;
                } else if (match[4].matched) {
                        t.value = match[4].str();
                        t.type = JackTokenType::STRING_CONST;
                } else if (match[5].matched) { 
                        t.value = match[5].str();
                        t.type = JackTokenType::IDENTIFIER;
                }
                tokens.push_back(t);
        }
}

bool JackTokenizer::hasMoreTokens() {
        return currentTokenIndex + 1 < tokens.size();
}
void JackTokenizer::advance() {
        if (hasMoreTokens()) {
                currentTokenIndex++;
        }
}
JackTokenType JackTokenizer::getCurrentTokenType(){
    return tokens[currentTokenIndex].type;
}
std::string JackTokenizer::getCurrentKeyword(){
        if (tokens[currentTokenIndex].type != JackTokenType::KEYWORD) {
                throw std::runtime_error("Current token is not a keyword");
        }
        return tokens[currentTokenIndex].value;
}
std::string JackTokenizer::getCurrentSymbol(){
        if (tokens[currentTokenIndex].type != JackTokenType::SYMBOL) {
                throw std::runtime_error("Current token is not a symbol");
        }
        return tokens[currentTokenIndex].value;
}
std::string JackTokenizer::getCurrentIdentifier(){
        if (tokens[currentTokenIndex].type != JackTokenType::IDENTIFIER) {
                throw std::runtime_error("Current token is not an identifier");
        }
        return tokens[currentTokenIndex].value;
}
int JackTokenizer::getCurrentInt(){
        if (tokens[currentTokenIndex].type != JackTokenType::INT_CONST) {
                throw std::runtime_error("Current token is not an integer constant");
        }
        return stoi(tokens[currentTokenIndex].value);
}
std::string JackTokenizer::getCurrentString(){
        if (tokens[currentTokenIndex].type != JackTokenType::STRING_CONST) {
                throw std::runtime_error("Current token is not a string constant");
        }
        return tokens[currentTokenIndex].value;
}