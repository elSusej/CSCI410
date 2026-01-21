import re
import unittest
import subprocess
import glob

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
        subprocess.run(['iverilog', '-o', f'/tmp/{name}_test.vvp', f'/autograder/grader/tests/{name}_test.v', '/autograder/grader/tests/nand.v'] + [f'-l{p}' for p in glob.glob('/autograder/source/*.v')])

        out = open(f'/tmp/{name}.out', 'w')
        subprocess.run(['vvp', f'/tmp/{name}_test.vvp'], stdout=out)

        res = subprocess.call(['diff', f'/tmp/{name}.out', f'/autograder/grader/tests/expected-outputs/{name}.cmp', '-qsw', '--strip-trailing-cr'])
        if res != 0:
            raise AssertionError('Module output does not mach the expected output!')

class TestModules(TestBase): 
    @weight(95/15)
    @number(1)
    def test_and(self):
        self.assertModulePasses('and')

    @weight(95/15)
    @number(2)
    def test_or(self):
        self.assertModulePasses('or')

    @weight(95/15)
    @number(3)
    def test_xor(self):
        self.assertModulePasses('xor')

    @weight(95/15)
    @number(4)
    def test_not(self):
        self.assertModulePasses('not')

    @weight(95/15)
    @number(5)
    def test_mux(self):
        self.assertModulePasses('mux')

    @weight(95/15)
    @number(6)
    def test_dmux(self):
        self.assertModulePasses('dmux')

    @weight(95/15)
    @number(7)
    def test_and16(self):
        self.assertModulePasses('and16')

    @weight(95/15)
    @number(8)
    def test_or16(self):
        self.assertModulePasses('or16')

    @weight(95/15)
    @number(9)
    def test_not16(self):
        self.assertModulePasses('not16')

    @weight(95/15)
    @number(10)
    def test_mux16(self):
        self.assertModulePasses('mux16')

    @weight(95/15)
    @number(11)
    def test_mux4way16(self):
        self.assertModulePasses('mux4way16')

    @weight(95/15)
    @number(12)
    def test_mux8way16(self):
        self.assertModulePasses('mux8way16')

    @weight(95/15)
    @number(13)
    def test_dmux4way(self):
        self.assertModulePasses('dmux4way')

    @weight(95/15)
    @number(14)
    def test_dmux8way(self):
        self.assertModulePasses('dmux8way')

    @weight(95/15)
    @number(15)
    def test_or8way(self):
        self.assertModulePasses('or8way')
