`timescale 1ns/1ps

module tb_traffic;

reg clk;
reg reset;
reg night_mode;

wire north, east, south, west;
wire [2:0] debug;

// Instantiate
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

// Clock
always #5 clk = ~clk;

// Dump for GTKWave
initial begin
    $dumpfile("traffic.vcd");
    $dumpvars(0, tb_traffic);
end

// Simulation
initial begin
    clk = 0;
    reset = 1;
    night_mode = 0;

    #10 reset = 0;

    // Normal operation
    #300;

    // Night mode ON
    night_mode = 1;
    #150;

    // Back to normal
    night_mode = 0;
    #300;

    $finish;
end

endmodule