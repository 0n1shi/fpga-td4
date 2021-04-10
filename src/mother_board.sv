/**
 * @name: mother_board.sv
 * @desc: mother board to connect cpu, memory and so on.
 */

module mother_board (
    input   logic       clock,
    input   logic       reset,
    input   logic [3:0] switch,
    output  logic [3:0] led
);
    logic [3:0] address;    // 4 bit address bus
    logic [7:0] data;       // 8 bit data bus

    cpu cpu(.clock, .reset, .address, .data, .io_in(switch), .io_out(led));
    rom rom(.address, .data);
endmodule
