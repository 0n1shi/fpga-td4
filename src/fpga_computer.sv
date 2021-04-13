/**
 * @name: fpga_computer.sv
 * @desc: top module
 */

module fpga_computer (
    input   logic           CLK,
    input   logic [0:0]     KEY,    // 1 push button
    input   logic [3:0]     SW,     // 4 slide switches
    output  logic [0:0]     LEDR,   // led
    output  logic [6:0]     HEX0,   // 1st 7 seg led
    output  logic [6:0]     HEX1    // 2nd 7 seg led
);
    // 1Hz clock
    logic clock;
    prescaler #(.RATIO(2)) prescaler(.clock_in(CLK), .clock_out(clock));

    assign LEDR = clock; // debug

    // push button to reset
    logic reset;
    assign reset = ~KEY;

    // I/O
    logic [3:0] switch; // slide switch for input
    assign switch = SW;
    logic [3:0] led; // 7 seg led for output
    seg7 hex0(.in(led % 10), .out(HEX0));
    seg7 hex1(.in(led / 10), .out(HEX1));

    mother_board mother_board(.clock, .reset, .switch, .led);
endmodule
