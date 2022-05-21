module dec2_4(a, b, y);
  // module dec2_4(a, b, y0, y1, y2, y3);
 	// simple 2 to 4 decoder circuit
 	
 	input a, b;
 	// each output is a 1 bit num of default wire type
 	// output y0, y1, y2, y3;
 	output y;    // use a 4 bits vector to express 4 bit outputs 
  wire [0:3]y; // declared a 4 bit wire
  
  // gate level design
  not(an, a);
  not(bn, b);
  /*
  and(y0, an, bn);
  and(y1, an, b);
  and(y2, a, bn);
  and(y3, a, b);
  */
  and(y[0], an, bn);
  and(y[1], an, b);
  and(y[2], a, bn);
  and(y[3], a, b);
  
endmodule