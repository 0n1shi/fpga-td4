module prescaler (
    input clock_in,
    output reg clock_out
);
    reg [31:0] counter;

    always @(posedge clock_in) begin
        if (counter == 32'd49_999_999) begin
            counter = 32'd0;
            clock_out = ~clock_out;
        end else begin
            counter = counter + 32'd1;
        end
    end

endmodule
