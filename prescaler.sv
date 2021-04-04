module prescaler (
    input   logic clock_in,
    output  logic clock_out
);
    logic [31:0] counter;

    always_ff @(posedge clock_in) begin
        if (counter == 32'd24_999_999) begin
            counter = 32'd0;
            clock_out = ~clock_out;
        end 
        else counter = counter + 32'd1;
    end

endmodule
