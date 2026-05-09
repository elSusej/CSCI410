#include "JackAnalyzer.hpp"


SymbolTable::SymbolTable() {
    counters[SymbolKind::STATIC] = 0;
    counters[SymbolKind::FIELD] = 0;
    counters[SymbolKind::ARG] = 0;
    counters[SymbolKind::VAR] = 0;
}

void SymbolTable::startSubroutine () {
        subroutineScope.clear();
        counters[SymbolKind::ARG] = 0;
        counters[SymbolKind::VAR] = 0;
}

void SymbolTable::define(const std::string& name, const std::string& type, SymbolKind kind) {

        SymbolEntry entry = {type, kind, counters[kind]}; //create symbol entry with current counter value for that kind
        if (kind == SymbolKind::STATIC || kind == SymbolKind::FIELD) {
                classScope[name] = entry; //add to class/global scope
        }
        else {
                subroutineScope[name] = entry; //add to subroutine/local scope
        }
        counters[kind]++; //increment counter for that kind
}

SymbolKind SymbolTable::kindOf(const std::string& name) {
        if (subroutineScope.find(name) != subroutineScope.end()) {
                return subroutineScope[name].kind;
        }
        else if (classScope.find(name) != classScope.end()) {
                return classScope[name].kind;
        }
        else {
                return SymbolKind::NONE;
        }

}

std::string SymbolTable::typeOf(const std::string& name) {
        if (subroutineScope.find(name) != subroutineScope.end()) {
                return subroutineScope[name].type;
        }
        else if (classScope.find(name) != classScope.end()) {
                return classScope[name].type;
        }
        else {
                return "\0"; //null char to indicate not found, since empty string could be valid type
        }
}

int SymbolTable::indexOf(const std::string& name) {
        if (subroutineScope.find(name) != subroutineScope.end()) {
                return subroutineScope[name].index;
        }
        else if (classScope.find(name) != classScope.end()) {
                return classScope[name].index;
        }
        else {
                return -1; //return -1 to indicate not found
        }
}
