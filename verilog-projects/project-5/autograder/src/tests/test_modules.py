import re
import unittest
import subprocess
import glob
from os import path

from gradescope_utils.autograder_utils.decorators import weight, number

class TestBase(unittest.TestCase): 
    def assertFileContains(self, file, pattern):
        with open(file, 'r') as f:
            if not re.search(pattern=pattern, string=f.read()):
                raise AssertionError(f'Pattern {pattern} not found in {file}!')

    def assertFileNotContain(self, file, pattern):
        with open(file, 'r') as f:
            if re.search(pattern=pattern, string=f.read()):
                raise AssertionError(f'Pattern {pattern} not allowed in {file}!')

    def assertModulePasses(self, name):
        if not path.isfile(f'/autograder/source/{name}.v'):
            raise AssertionError(f'{name}.v not found!')
        if not path.isfile(f'/autograder/grader/tests/{name}_test.v'):
            raise AssertionError(f'{name}_test.v not found!')
        self.assertFileContains(f'/autograder/source/{name}.v', f'module student_{name}')

        res = subprocess.call(['iverilog', '-o', f'/tmp/{name}_test.vvp', f'/autograder/grader/tests/{name}_test.v'] + [f'-l{p}' for p in glob.glob('/autograder/source/*.v')])
        if res != 0:
            raise AssertionError('Unable to build verilog + test script to vvp!')

        out = open(f'/tmp/{name}.out', 'w')
        res = subprocess.call(['vvp', f'/tmp/{name}_test.vvp'], stdout=out)
        if res != 0:
            raise AssertionError('Unable to execute vvp verilog test!')

        res = subprocess.call(['diff', f'/tmp/{name}.out', f'/autograder/grader/tests/expected-outputs/{name}.cmp', '-qsw', '--strip-trailing-cr'])
        if res != 0:
            raise AssertionError('Module output does not mach the expected output!')

class TestModules(TestBase): 
    pass
