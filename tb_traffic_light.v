`timescale 1ns/1ps
module tb_traffic;

reg clk;
reg reset;
reg night_mode;
wire north, east, south, west;
wire [2:0] debug;

traffic_light_controller uut (
    .clk(clk),
    .reset(reset),
    .night_mode(night_mode),
    .north(north),
    .east(east),
    .south(south),
    .west(west),
    .debug(debug)
);


always #5 clk = ~clk;


initial begin
    $dumpfile("traffic.vcd");
    $dumpvars(0, tb_traffic);
end


initial begin
    clk = 0;
    reset = 1;
    night_mode = 0;

    #10 reset = 0;
    #300;

    
    night_mode = 1;
    #150;

    
    night_mode = 0;
    #300;

    $finish;
end

endmodule