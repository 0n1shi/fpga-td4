module prescaler (
    input   logic clock_in,
    output  logic clock_out
);
    logic [31:0] counter, next_counter;

    logic next_edge;
    assign next_edge = (counter == (32'd100_000_000 / 2 - 1));

    assign next_counter = next_edge ? 'd0 : counter + 'd1;
    always_ff @(posedge clock_in) counter <= next_counter;

    logic next_clock_out;
    assign next_clock_out = next_edge ? ~clock_out : clock_out;
    always_ff @(posedge clock_in) clock_out <= next_clock_out;
endmodule
