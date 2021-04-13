module test_fpga_computer;

logic       clk     = 1'd0;
logic [0:0] key     = 1'd1;
logic [0:0] led     = 1'd0;
logic [3:0] switch  = 4'd0;
logic [6:0] hex0    = 7'd0;
logic [6:0] hex1    = 7'd0;

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
    forever #(OSC100M_PERIOD / 2) clk <= ~clk;
end

endmodule