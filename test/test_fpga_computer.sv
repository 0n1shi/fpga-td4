module test_fpga_computer;

logic clk, led, key;

fpga_computer fpga_computer(.CLK(clk), .KEY(key), .LEDR(led));

parameter OSC100M_PERIOD = 10000; // ps

initial begin
    clk = 1'b0;
    forever #(OSC100M_PERIOD / 2) clk <= ~clk;
end