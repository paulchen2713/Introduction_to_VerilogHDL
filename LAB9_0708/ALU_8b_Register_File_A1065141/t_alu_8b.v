// simple testbench for 8-bit ALU
`include "alu_8b.v"
module t_alu_8b;

reg[7:0] a, b;
reg c_in;
reg[79:0] osc;
reg[2:0] opcode;
integer j, k;
wire[8:0] alu_out;

parameter [2:0] add = 0;
parameter [2:0] subtract = 1;
parameter [2:0] subtract_a = 2;
parameter [2:0] or_ab = 3;
parameter [2:0] and_ab = 4;
parameter [2:0] not_ab = 5;
parameter [2:0] exor = 6;
parameter [2:0] exnor = 7;

// ocs can stores at most 10 letters, each letters takes 8-bit(1-byte) 
parameter [79:0] ocs_0 = "add";
parameter [79:0] ocs_1 = "subtract";
parameter [79:0] ocs_2 = "subtract_a"; // 10 char = 10 * 8-bit = 80-bit
parameter [79:0] ocs_3 = "or_ab";
parameter [79:0] ocs_4 = "and_ab";
parameter [79:0] ocs_5 = "not_ab";
parameter [79:0] ocs_6 = "exor";
parameter [79:0] ocs_7 = "exnor";

alu_8b uut(a, b, c_in, opcode, alu_out);

initial begin
    #10 a = 8'h55; // 0101_0101
    b = 8'haa;     // 1010_1010
    // c_in 0 or 1 
    for(j = 0; j <= 1 ; j = j + 1) begin
        // state 0~7 
        for(k = 0; k <= 7 ; k = k + 1) begin
            #10 c_in = j;
            case(k)
                0: opcode = add;
                1: opcode = subtract;
                2: opcode = subtract_a;
                3: opcode = or_ab;
                4: opcode = and_ab;
                5: opcode = not_ab;
                6: opcode = exor;
                7: opcode = exnor;
                // default:
            endcase    
        end
    end
end

always @(opcode) begin
    // according to current OPCODE to change OCS string
    case (opcode)
        add:        osc = ocs_0;
        subtract:   osc = ocs_1;
        subtract_a: osc = ocs_2;
        or_ab:      osc = ocs_3;
        and_ab:     osc = ocs_4;
        not_ab:     osc = ocs_5;
        exor:       osc = ocs_6;
        exnor:      osc = ocs_7; 
        // default: 
    endcase
end

// always@(opcode) 
// case(opcode)
//     add:        osc = ocs_0;
//     subtract:   osc = ocs_1;
//     subtract_a: osc = ocs_2;
//     or_ab:      osc = ocs_3;
//     and_ab:     osc = ocs_4;
//     not_ab:     osc = ocs_5;
//     exor:       osc = ocs_6;
//     exnor:      osc = ocs_7;
// endcase

// initial #1000 $finish;

initial begin
    #1000 $finish;
end
endmodule
