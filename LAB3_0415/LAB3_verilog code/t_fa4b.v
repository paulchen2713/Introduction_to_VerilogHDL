// testbench for 4-bit full addder "t_fa4b.v"
// first, include the circuit "fa4b.v" to be tested
`include "fa4b.v"
module t_fa4b; 
  reg cin;
  reg [3:0] a, b;
  wire [3:0] s;
  integer k;
  
  // uut is the {tag name}, .{original name}({var name})
  fa4b uut(.cin(cin), .a(a), .b(b), .s(s), .cout(cout)); 
  
  initial
  for(k = 0; k < 512; k = k + 1)
  begin
    {cin, a, b} = k;
    #10;
  end
  
  initial
  // represent the output %b as a 2-bit number(tuple)
  $monitor ("%b + %d + %d = %d", cin, a, b, {cout, s});
  
  initial
  // $finish, will actually terminate the process
  // $stop,   wil just stop momentarily
  // when testing, needed to raise the testing time to at least 5120ns, 
  // because the default setting is 10ns only, too short for this case.
  #5120 $finish;
  
endmodule