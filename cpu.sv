module cpu (
    input   logic   clock,
    input   logic   reset,
    output  logic   address,
    input   logic   data,
    output  logic   led
);
    logic status, next_status;
    logic ip, next_ip;

    always_ff @(posedge clock) begin
        if (reset) begin
            status <= 1'd0;
            ip <= 1'b0;
        end
        else begin
            status <= next_status;
            ip <= next_ip;
        end
    end

    assign led = status;
    assign address = ip;

    always_comb begin
        case (data)
            1'b0: next_status = status;     // NOP
            1'b1: next_status = ~status;    // NOT
        endcase
        next_ip = ip + 1'b1;
    end
endmodule
