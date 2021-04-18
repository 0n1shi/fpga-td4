/**
 * @name: rom.sv
 * @desc: ROM which has 3 bit address bus and 8 bit data bus
 */

module rom (
    input   logic [3:0] address,    // 4 bit address bus
    output  logic [7:0] data        // 8 bit data bus
);
    logic [7:0] rom_data [16];
    initial $readmemh("asm.mem", rom_data);
    assign data = rom_data[address];
    // always_comb begin
    //     case (address)
    //         // increment "b" register from 0 to 16
    //         4'b0000: data = 8'b01110000; // mov b, 0
    //         4'b0001: data = 8'b10010000; // out b
    //         4'b0010: data = 8'b01010001; // add b, 1
    //         4'b0011: data = 8'b11110001; // jmp 1
    //         4'b0100: data = 8'b11110100; // jmp 4
    //         default: data = 8'b00000000; // nop
    //     endcase
    // end
endmodule
