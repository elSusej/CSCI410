import unittest

from gradescope_utils.autograder_utils.json_test_runner import JSONTestRunner

if __name__ == '__main__':
    suite = unittest.defaultTestLoader.discover(start_dir='src/tests', pattern='test*.py')

    try:
        with open('/autograder/results/results.json', 'w') as f:
            JSONTestRunner(stream=f, verbosity=2, buffer=True).run(suite)
    except:
        print("Not running in docker!")
        unittest.TextTestRunner().run(suite)
