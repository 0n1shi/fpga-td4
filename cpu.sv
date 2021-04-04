module cpu (
    input   logic   clock,
    input   logic   reset,
    output  logic   led
);
    logic current, next;

    always_ff @(posedge clock) begin
        if (reset) current <= 1'd0;
        else
            current <= next; 
    end

    always_comb begin
        led = current;
        next = ~current;
    end
endmodule