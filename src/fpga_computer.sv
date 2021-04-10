// top module
module fpga_computer (
    input   logic           CLK,
    input   logic [0:0]     KEY,    // 1 push button
    input   logic [3:0]     SW,     // 4 slide switches
    output  logic [3:0]     LEDR,   // 4 leds
    output  logic [6:0]     HEX0,   // 1st 7 seg led
    output  logic [6:0]     HEX1    // 2nd 7 seg led
);
    // I/Os
    logic clock;
    prescaler prescaler(.clock_in(CLK), .clock_out(clock));

    logic reset;
    assign reset  = ~KEY;

    logic [3:0] led;
    //assign LEDR = led;
    seg7 hex0(.in(led % 10), .out(HEX0));
    seg7 hex1(.in(led / 10), .out(HEX1));

    logic [3:0] switch;
    assign switch = SW;

    mother_board mother_board(.clock, .reset, .switch, .led);
endmodule
