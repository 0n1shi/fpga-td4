module mother_board (
    input   logic   clock,
    input   logic   reset,
    output  logic   led
);
    logic address;
    logic data;

    cpu cpu(.clock, .reset, .address, .data, .led);
    rom rom(.address, .data);
endmodule
