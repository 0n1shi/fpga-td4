module prescaler (
    input   logic clock_in,
    output  logic clock_out
);
    logic [31:0] counter;

    always_ff @(posedge clock_in) begin
        if (counter == 32'd10_000_000 - 1) begin
            counter = 32'd0;
            clock_out = ~clock_out;
        end 
        else begin
            counter = counter + 32'd1;
        end
    end

endmodule
