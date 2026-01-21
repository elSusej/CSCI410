#!/bin/bash

# Change directory to tests dir.
SCRIPT_DIR=$( dirname -- "${BASH_SOURCE[0]}" )
pushd ${SCRIPT_DIR} &> /dev/null

TESTS=("and" "and16" "dmux" "dmux4way" "dmux8way" "mux" "mux4way16" "mux8way16" "mux16" "not" "not16" "or" "or8way" "or16" "xor")
PASSED=()
FAILED=()

LIB_FILES=$(ls ../*.v | awk '{print "-l " $0}' | xargs)

# remove past outputs
rm /tmp/*_test.vvp /tmp/*_test.out -f

# run each test
for TEST in ${TESTS[@]};
do
    # skip if test file not present
    [[ ! -s ./${TEST}_test.v ]] && {
        echo "${TEST}_test.v not found"
        continue
    }

    iverilog -i -o /tmp/${TEST}_test.vvp ${TEST}_test.v ${LIB_FILES} -l ./nand.v || continue
    vvp /tmp/${TEST}_test.vvp 2> /dev/null 1> /tmp/${TEST}_test.out 2> /dev/null
    diff /tmp/${TEST}_test.out expected-outputs/${TEST}.cmp -qsw --strip-trailing-cr &> /dev/null && PASSED+=(${TEST}) || FAILED+=(${TEST})
done

# output results
for TEST in ${FAILED[@]};
do
    echo ${TEST^^} Failed
done
echo "-------------------"
for TEST in ${PASSED[@]};
do
    echo ${TEST^^} Passed
done

popd &> /dev/null
