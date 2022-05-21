// simple Ripple Carry Adder, 4-bit Full Adder "fa4b.v"
// first include to the 1-bit FA building block
`include "fa1b.v" 
module fa4b(cin, a, b, s, cout);
  input  cin, a, b;
  output s, cout;
  // wire in vector type has to be declare
  wire [3:0] a, b, s; // a[3]a[2]a[1]a[0] --> 4-bit
  wire [3:1] c;       // c[3]c[2]c[1]     --> 3-bit
  
  // using non-basic logic gate need to assign tag name, like m3 .. m0
  fa1b m3(.cin(c[3]), .x(a[3]), .y(b[3]), .cout(cout), .s(s[3]));
  fa1b m2(.cin(c[2]), .x(a[2]), .y(b[2]), .cout(c[3]), .s(s[2]));
  fa1b m1(.cin(c[1]), .x(a[1]), .y(b[1]), .cout(c[2]), .s(s[1]));
  fa1b m0(.cin(cin), .x(a[0]), .y(b[0]), .cout(c[1]), .s(s[0]));
  
endmodule
