module example(a, b, c, y);

// gate-level description
input a, b, c;
output y;

not(d, a);
and(e, a, d);
and(f, d, b);
and(g, b, c);
or(y, e, f, g);

/*
// data-flow description
// y = ab + a'b + bc = b
input a, b, c;
output y;

assign d = ~a;
assign e = a & b;
assign f = d & b;
assign g = b & c;
assign y = e | f | g;
// assign y = (a & b) | (~a & b) | (b & c);
*/
endmodule
