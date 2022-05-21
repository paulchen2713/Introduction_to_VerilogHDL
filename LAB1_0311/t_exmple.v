include"example.v"
module t_example;

reg a, b, c;
example uut(a, b, c, y);

initial begin
    // injecting inputs for observtions
    a = 0;
    b = 0;
    c = 0;
    #10
    a = 0;
    b = 0;
    c = 1;
    #10
end

initial begin
    // checking outputs on screen
    $monitor("a = %b, b = %b, c = %b, y = %b", a, b, c, y);
end

initial begin
    // timing
    #80 $finish;
end

endmodule
