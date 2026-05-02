module traffic_light_controller (
    input clk,
    input reset,
    input night_mode,
    output reg north,
    output reg east,
    output reg south,
    output reg west,
    output [2:0] debug
);

reg [2:0] state;
reg [2:0] next_state;
reg [3:0] counter;


parameter S0=0, S1=1, S2=2, S3=3, S4=4, S5=5, S6=6, S7=7;

parameter GREEN_TIME = 3;

parameter RED_TIME   = 1;

assign debug = state;


always @(posedge clk or posedge reset) begin
    if (reset)
        state <= S0;
    else if (night_mode)
        state <= S0;
    else if (counter == 0)
        state <= next_state;
end


always @(posedge clk or posedge reset) begin
    if (reset)
        counter <= GREEN_TIME;
    else if (counter == 0) begin
        case(state)
            S0, S2, S4, S6: counter <= RED_TIME;
            default:        counter <= GREEN_TIME;
        endcase
    end
    else
        counter <= counter - 1;
end


always @(*) begin
    case(state)
        S0: next_state = S1;
        S1: next_state = S2;
        S2: next_state = S3;
        S3: next_state = S4;
        S4: next_state = S5;
        S5: next_state = S6;
        S6: next_state = S7;
        S7: next_state = S0;
        default: next_state = S0;
    endcase
end

always @(*) begin
    north = 0;
    east  = 0;
    south = 0;
    west  = 0;

    if (night_mode) begin
        north = counter[0];
        east  = counter[0];
        south = counter[0];
        west  = counter[0];
    end
    else begin
        case(state)
            S0: north = 1;
            S2: east  = 1;
            S4: south = 1;
            S6: west  = 1;
        endcase
    end
end

endmodule