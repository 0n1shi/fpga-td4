module rom (
    input   logic   address,
    output  logic   data
);
    always_comb begin
        case (address)
            1'b0: data = 1'b1; // NOT
            1'b1: data = 1'b0; // NOP
        endcase
    end
endmodule
