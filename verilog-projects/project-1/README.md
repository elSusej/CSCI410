# Project 1: Gate Modeling

Develop your solution for each gate.
You can use NAND (`nand_gate`) or any gate you've already created (`student_<xyz>`).
Please don't use the verilog `assign` syntax, as the goal with this project is
to understand how to model each gate out of others.

Please don't use built-in versions of the gate you are modeling, the point of
the exercise is to get you thinking about how to model each gate out of others.
If you get stuck on a gate, try working it out on paper or coming to office hours.

You can complete the gates in any order you like, but I recommend the following:

1. NOT
2. AND
3. OR
4. XOR
5. 16-bit versions
6. MUX & DMUX
7. Multi-way MUX & DMUX

## Testing
There is a test script provided `./tests/test_script.sh`.
Executing it will match the truth tables of your gates with the expected truth tables.
These are the exact same tests that run on Gradescope.

The test cases rely on each gate being named `student_<xyz>`, so please don't rename your modules.

### Dependencies
I believe the only dependency is Icarus Verilog.
Arch: `sudo pacman -Syu iverilog`
Ubuntu: `sudo apt install iverilog`

### Windows
If you are on Windows, run the test script in WSL.

## Submitting
Upload all of your gates to Gradescope, either in a zip file or individually.

## Issues
If you have any issues with running the tests or the autograder, check Ed discussion,
and then send me an email at [grant_lemons_sw@mines.edu](mailto:grant_lemons_sw@mines.edu)
if there's nothing about said issue there. I'd rather not get flooded with emails haha.

## Verilog
Read the FPGA and Verilog Primer through the section on Loops.

### Using Modules
To use a module, instantiate one as follows:
```
<module_name> <instance_name> (<parameters>);
```

There are two ways to provide parameters: by position or by name.
To specify by position, ensure your inputs are in the same order the
parameters were defined.
To specify by name, you can use `.<parameter_name>(<input_name>)`.

Example:
```verilog
nand_gate g0 (wire1, wire2, outputwire); // By position
nand_gate g1 (.a(wire1), .b(wire2), .out(outputwire)); // By name
```
