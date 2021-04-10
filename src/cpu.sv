/**
 * @name: cpu.sv
 * @desc: cpu has 4 bit address bus, 8 bit data bus, 4 bit switch input and 4 bit output.
 */

module cpu (
    input   logic       clock,
    input   logic       reset,

    output  logic [3:0] address,
    input   logic [7:0] data,

    input   logic [3:0] io_in,
    output  logic [3:0] io_out
);
    // registers
    logic [3:0] a,      next_a;     // 4 bit general register
    logic [3:0] b,      next_b;     // 4 bit general register
    logic       cf,     next_cf;    // carry flag
    logic [3:0] ip,     next_ip;    // instruction pointer
    logic [3:0] out,    next_out;   // I/O out

    // reset or update registers
    always_ff @(posedge clock) begin
        if (reset) begin
            a   <= '0;
            b   <= '0;
            cf  <= '0;
            ip  <= '0;
            out <= '0;
        end
        else begin
            a   <= next_a;
            b   <= next_b;
            cf  <= next_cf;
            ip  <= next_ip;
            out <= next_out;
        end
    end

    // handle instruction
    logic [3:0] opcode, imm;
    assign opcode   = data[7:4]; // upper 4 bit of data
    assign imm      = data[3:0]; // lower 4 bit of data
    assign address  = ip;
    assign io_out   = out;

    always_comb begin
        next_a      = a;            // next value
        next_b      = b;            // next value
        next_cf     = '0;           // reset
        next_ip     = ip + 4'd1;    // increment
        next_out    = out;          // keep I/O out state

        // opcode list
        unique case (opcode)
            4'b0000: {next_cf, next_a} = a + imm;   // add a, imm
            4'b0101: {next_cf, next_b} = b + imm;   // add b, imm
            4'b0011: next_a = imm;                  // mov a, imm
            4'b0111: next_b = imm;                  // mov b, imm
            4'b0001: next_a = b;                    // mov a, b
            4'b0100: next_b = a;                    // mov b, a
            4'b1111: next_ip = imm;                 // jmp imm
            4'b1110: next_ip = cf ? ip + '1 : imm;  // jnc imm
            4'b0010: next_a = switch;               // in a
            4'b0110: next_b = switch;               // in b
            4'b1001: next_out = b;                  // out b
            4'b1011: next_out = imm;                // out imm
        endcase
    end
endmodule
