# Traffic Light Controller (Verilog)

This project implements a traffic light controller using a Finite State Machine (FSM) in Verilog.

## Features
- 4-direction traffic control
- FSM-based design
- Night mode (blinking)
- Testbench simulation
- GTKWave waveform analysis

## Tools Used
- Verilog (Icarus Verilog)
- GTKWave
- VS Code

## How to Run
1. Compile:
   iverilog -o traffic tb_traffic.v traffic_light_controller.v

2. Run:
   vvp traffic

3. View waveform:
   gtkwave traffic.vcd