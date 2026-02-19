Name: Jesus Ledezma
References: Chat GPT (for verilog parametrization syntax) and Elements of Computing Systems Textbook (for clarification on pc functionality when it comes to which inputs have higher precedence)
Time Spent: ~4 hours
Notes: Figuring out how to properly design the ram modules was a little challenging. However, now I understand that basic structure is laid out as follows:
 -> instiate a dmux to correctly route the load input to the correct register (or ram module in the larger ram modules) using the amount of bits of the address that can be used to represent the # of modules (3 bits of the higher bits of the address for 8 registers/modules, 2 for 4)
 -> instantiate 8 (or 4) of the lower level registers/ram modules, with the remaining address bits used as the address (for the ram modules) and the outs routed through a large enough wire to then go into an 8 way mux
 -> use the instantiated mux to correctly choose between the 8 outputs, (using the upper bits of the address to choose the correct output)