import re
import unittest
import subprocess
import glob
import os

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
        if not os.path.isfile(f'/autograder/grader/tests/{name}_test.v'):
            raise AssertionError(f'{name}_test.v not found!')

        builtin_modules = ['dff', 'muxlib', 'nand', 'fast_ram', 'computer', 'memory']
        res = subprocess.call(
            ['iverilog', '-o', f'/tmp/{name}_test.vvp', f'/autograder/grader/tests/{name}_test.v']
                + [f'-l/autograder/grader/tests/{m}.v' for m in builtin_modules]
                + [f'-l{p}' for p in glob.glob('/autograder/source/*.v')]
        )
        if res != 0:
            raise AssertionError('Unable to build verilog + test script to vvp!')

        wd = os.getcwd()
        os.chdir('tests')
        out = open(f'/tmp/{name}.out', 'w')
        res = subprocess.call(['vvp', f'/tmp/{name}_test.vvp'], stdout=out)
        if res != 0:
            raise AssertionError('Unable to execute vvp verilog test!')
        os.chdir(wd)

        res = subprocess.run(['diff', f'/tmp/{name}.out', f'/autograder/grader/tests/expected-outputs/{name}.cmp', '-swy', '--strip-trailing-cr'], capture_output=True, text=True)
        if res.returncode != 0:
            raise AssertionError(f'Module output does not mach the expected output!\n{res.stdout}')

class TestModules(TestBase): 
    @weight(20)
    @number(1)
    def test_memory(self):
        self.assertModulePasses('memory')

    @weight(55)
    @number(2)
    def test_cpu(self):
        self.assertModulePasses('cpu_external')

    @weight(20/3)
    @number(3)
    def test_computer_add(self):
        self.assertModulePasses('computer_add')

    @weight(20/3)
    @number(4)
    def test_computer_max(self):
        self.assertModulePasses('computer_max')

    @weight(20/3)
    @number(5)
    def test_computer_rect(self):
        self.assertModulePasses('computer_rect')
