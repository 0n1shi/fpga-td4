module fpga_computer (
    input   logic           CLK,
    input   logic [0:0]     KEY,
    output  logic [0:0]     LEDR
);
    logic clock;
    prescaler prescaler(.clock_in(CLK), .clock_out(clock));

    logic reset;
    assign reset  = ~KEY;

    logic led;
    assign LEDR = led;

    cpu cpu(.clock, .reset, .led);
endmodule
