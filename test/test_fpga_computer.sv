module test_fpga_computer;

logic clk, key, led;
logic [3:0] switch;
logic [6:0] hex0, hex1;

fpga_computer fpga_computer(
    .CLK(clk), 
    .KEY(key), 
    .SW(switch),
    .LEDR(led),
    .HEX0(hex0),
    .HEX1(hex1)
);

parameter OSC100M_PERIOD = 10000; // ps

initial begin
    clk = 1'b0;
    forever #(OSC100M_PERIOD / 2) clk <= ~clk;
end

endmodule