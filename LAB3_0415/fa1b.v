// simple 1-bit Full Adder "fa1b.v" 
module fa1b (cin, x, y, cout, s);
  
  input cin, x, y;
  output cout, s;
  reg cout, s; // variables in always need to be declared
  
  /*
  // gate level description
  and(m, cin, x);
  and(n, x, y);
  and(p, y, cin);
  or(cout, m, n, p);
  xor(s, cin, x, y);
  */
  
  /*
  // data-flow level description
  assign cout = (cout & x) | (x & y) | (y & cin); // &: And, |: Or
  assign s = cin ^ x ^ y; // ^: exclusive OR
  */
  
  // behavior level description
  always@(cin, x, y)
  {cout, s} = cin + x + y;
  
  // ???????QQ
endmodule
