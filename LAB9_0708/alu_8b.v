// simple 8-bit ALU
module alu_8b(
    input [7:0] a, b, // 8-bit
    input c_in, 
    reg [2:0] opcode, // 3-bit
    // 8-bit originally, possibly 9-bit after computation
    output reg [8:0] alu_out
);

// parameterized, encodeed the state_code in readable text
parameter [2:0] add = 0;
parameter [2:0] subtract = 1;
parameter [2:0] subtract_a = 2;
parameter [2:0] or_ab = 3;
parameter [2:0] and_ab = 4;
parameter [2:0] not_ab = 5;
parameter [2:0] exor = 6;
parameter [2:0] exnor = 7;

always @(a, b, c_in, opcode) begin
    case (opcode)
        add:        alu_out = a + b + c_in;
        subtract:   alu_out = a + ~b + c_in;
        subtract_a: alu_out = b + ~a + ~c_in;
        or_ab:      alu_out = {1'b0, a | b};
        and_ab:     alu_out = {1'b0, a & b};
        not_ab:     alu_out = {1'b0, (~a) & b};
        exor:       alu_out = {1'b0, a ^ b};
        exnor:      alu_out = {1'b0, a ~^ b}; 
        // default: 
    endcase
end

// always@(a, b, c_in, opcode)
// case(opcode)
//     add:        alu_out = a + b + c_in;
//     subtract:   alu_out = a + ~b + c_in;
//     subtract_a: alu_out = b + ~a + ~c_in;
//     or_ab:      alu_out = {1'b0, a | b};
//     and_ab:     alu_out = {1'b0, a & b};
//     not_ab:     alu_out = {1'b0, (~a) & b};
//     exor:       alu_out = {1'b0, a ^ b};
//     exnor:      alu_out = {1'b0, a ~^ b};
// endcase
endmodule
