module seg7(
    input   logic [3:0] in,
    output  logic [6:0] out 
);
    always_comb begin
        case (in)
            4'h0:   out = 7'b1000000;
			4'h1:   out = 7'b1111001;
			4'h2:   out = 7'b0100100;
			4'h3:   out = 7'b0110000;
			4'h4:   out = 7'b0011001;
			4'h5:   out = 7'b0010010;
			4'h6:   out = 7'b0000010;
			4'h7:   out = 7'b1011000;
			4'h8:   out = 7'b0000000;
			4'h9:   out = 7'b0010000;
            default:out = 7'bxxxxxxx;
        endcase
    end
endmodule