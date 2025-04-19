module Traffic_Light(
input wire clk, rst,
input wire [3:0] timer,
output reg [2:0] light
);

parameter s_red = 2'b00;
parameter s_green = 2'b01;
parameter s_yellow = 2'b10;

reg [1:0] current_state, next_state;


always @(posedge clk or posedge rst) begin

if(rst) 
 current_state <= s_red;

else
current_state <= next_state;

end


always @(*) begin

case(current_state)
s_red :   
	if (timer == 0) 
	    next_state =  s_green;
	   
	else 
	    next_state = current_state;
	   
s_green :   
	if (timer == 0) 
	    next_state =  s_yellow;
	   
	else 
	    next_state = current_state;
	   
s_yellow :   
	if (timer == 0) 
	    next_state =  s_red;
	   
	else 
	    next_state = current_state;
	   
endcase
end


always @(*) begin
case(current_state)
s_red: light = 3'b100; 
s_green: light = 3'b111; 
s_yellow: light = 3'b001; 
endcase
end
endmodule
