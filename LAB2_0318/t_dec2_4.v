`include "dec2_4.v"
module t_dec2_4;
  // testbench for "dec2_4.v"
  
  // variables in for loop, initial & multi-bits wire have to be declared
  reg a, b;
  integer k;
  wire [0:3]y; // using a 4 bits wire for output
  
  // circuit to be tested
  // dec2_4 uut(a, b, y0, y1, y2, y3);
  dec2_4 uut(a, b, y);
  
  // using for loop to set the test signals as inputs
  initial
  for (k = 0; k < 4; k = k + 1)
  begin
    {a,b} = k; // {a, b} is like a tuple, store as a 2 bit number
    #10; // each input delay for  clock cycle
  end
  
  // observe the outputs
  initial