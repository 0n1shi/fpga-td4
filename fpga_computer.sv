module fpga_computer (
    input   logic           CLK,
    input   logic [0:0]     KEY,
    output  logic [0:0]     LEDR
);
    logic clock;
    prescaler prescaler(.clock_in(CLK), .clock_out(clock));

    assign LEDR = clock;
endmodule
