/**
 * @name: prescaler.sv
 * @desc: convert 100MHz clock to 1Hz clock
 */

module prescaler #(parameter RATIO = 2) (
    input   logic clock_in,
    output  logic clock_out = 1'd0
);
    // count up with original clock
    logic [31:0] counter        = 32'd0;
    logic [31:0] next_counter;
    always_ff @(posedge clock_in) counter <= next_counter;
    
    // reset count every 50M clocks
    logic next_edge;
    assign next_edge    = (counter == (RATIO / 2 - 1)); 
    assign next_counter = next_edge ? 'd0 : counter + 'd1;

    logic next_clock_out;
    assign next_clock_out   = next_edge ? ~clock_out : clock_out;
    always_ff @(posedge clock_in) clock_out <= next_clock_out;
endmodule
