// testbench for 1-bit full addder "t_fa1b.v"
// first, include the circuit to be tested
`include "fa1b.v"
module t_fa1b;
  reg cin, x, y;
  integer k;
  
  // all ports have to be used, and assign in the same order as the original ckt
  // fa1b uut(cin, x, y, cout, s); 
  fa1b uut(.cin(cin), .x(x), .y(y), .cout(cout), .s(s)); // ."ori name"("var name")
  
  initial
  for(k = 0; k < 8; k = k + 1)
  begin
    {cin, x, y} = k;
    #10;
  end
  
  initial
  // represent the output %b as a 2-bit number(tuple)
  $monitor ("%b + %b + %b = %b", cin, x, y, {cout, s});
  
  initial
  #80 $finish; // $finish will actually terminate the process, $stop wil just stop momentarily
  
endmodule