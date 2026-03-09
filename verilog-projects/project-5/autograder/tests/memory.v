module computer_memory #(parameter A = 15) (
  input [((2**A)*16)-1:0] data,
  input reload,
  input [15:0] in,
  input load,
  input [A-1:0] address,
  output [15:0] out,
  output reg [((2**A)* 16)-1:0] mem_contents // used as an output so test scripts can see what's going on
);
  output reg [15:0] res;

  initial begin
    #1 mem_contents = data;
  end

  always begin
    #1 res = mem_contents[16*address +: 16];
    if (reload)
      mem_contents = data;
    else
      mem_contents[16*address +: 16] = load ? in : mem_contents[16*address +: 16];
  end
  assign out = res;
endmodule
