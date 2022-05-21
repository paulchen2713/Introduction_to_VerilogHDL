// simple pipeline demo of y = a*b + c
module pipe_v3(clk, rst, y, a, b, c);
    input clk, rst, a, b, c;
    output y;

    reg [8:0] abc, y;
    reg [7:0] qab, ab;
    reg [3:0] qa, qb, qc, qqc;
    wire [3:0] a, b, c;

    // assign #18 ab = a * b;
    // assign #12  abc = u + v;

    // combinantial component
    always@(qa or qb or qab or qqc)
    begin
        ab  = qa * qb;   // ab = a*b
        abc = qab + qqc; // abc = a*b + c
    end

    // pipeline register, sequential component
    always@(posedge clk or posedge rst)
    if (rst)
        begin
            qa  = 0;
            qb  = 0;
            qc  = 0;
            qqc = 0;
            qab = 0;
            y   = 0;
        end
    else
        begin
            qa  <= a;
            qb  <= b;
            qc  <= c;
            qab <= ab;
            qqc <= qc;
            y   <= abc;
        end
endmodule
