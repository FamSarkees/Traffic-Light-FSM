Traffic Light FSM – Verilog

# Overview

The system transitions through the following states:
Red → Green → Yellow → Red (loop)
The transition is triggered when the timer input reaches 0.

# State Encoding
parameter s_red    = 2'b00;
parameter s_green  = 2'b01;
parameter s_yellow = 2'b10;

# Output Encoding
State	Output light
Red	3'b100
Green	3'b111
Yellow	3'b001


# Simulation Tools used:
ModelSim / QuestaSim
Verilog 2001 syntax
