module fpga_computer (
    input CLOCK,
    input [0:0] KEY,
    output [0:0] LEDR
);
    wire clock;
    prescaler prescaler(.clock_in(CLOCK), .clock_out(clock));

    assign LEDR = clock;
endmodule
