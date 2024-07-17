`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////

module tictactoe(
input clk25M, rst,
input [9:0] hs, vs,
output reg [2:0] red, green,
output reg [1:0] blue,

input up, down, right, left, mark
    );

reg drawing;
reg [1:0] markerPosX, markerPosY, winner;
reg turn;
reg [1:0] plays [11:0][11:0];
integer i, j;
integer h_interval = 40; // Interval for horizontal lines
integer v_interval = 53; // Interval for vertical lines

initial begin
	red <= 0;
	green <= 0;
	blue <= 0;
	drawing <= 0;
	markerPosX <= 1;
	markerPosY <= 1;
	turn <= 0;
	for (i = 0; i < 12; i = i + 1) begin
		for (j = 0; j < 12; j = j + 1) begin
			plays[i][j] <= 0;
		end
	end
	winner <= 0;
	
	
end

always @ (posedge clk25M) begin

	if (rst) begin
		red <= 0;
		green <= 0;
		blue <= 0;
		drawing <= 0;
		markerPosX <= 1;
		markerPosY <= 1;
		turn <= 0;
		for (i = 0; i < 12; i = i + 1) begin
			for (j = 0; j < 12; j = j + 1) begin
				plays[i][j] <= 0;
			end
		end
		winner <= 0;
		
	end
	else begin
	
	winner <= 0;
	
	
	
	if (winner == 0) begin
	
	//marker movement
	if (up && (markerPosY != 0)) markerPosY <= markerPosY - 1;
	if (down && (markerPosY != 11)) markerPosY <= markerPosY + 1;
	if (right && (markerPosX != 11)) markerPosX <= markerPosX + 1;
	if (left && (markerPosX != 0)) markerPosX <= markerPosX - 1;
	
	if (mark) begin
		if (plays[markerPosY][markerPosX] == 0) begin
			plays[markerPosY][markerPosX] <= turn + 1;
			turn <= ~turn;
		end
	end
	
	
	//plot the grid
	drawing <= 0;
	
	//Horizontal Lines
	for (integer i = 1; i < 11; i = i + 1) begin
		if ((vs >= i * h_interval) && (vs < (i + 1) * h_interval)) begin
			drawing <= 1;
			red <= 7;
			green <= 7;
			blue <= 7;
		end
		
		drawing <=0; 
		
		if ((hs >= j * v_interval) && (hs < (j + 1) * v_interval)) begin
			drawing <= 1;
			red <= 7;
			green <= 7;
			blue <= 7;
		end
      
		
		
	end
	
	
	drawing <= 0;
	
	
	
	// small circle to indicate selected position
	if (((hs - 195 - (markerPosX * 40)) * (hs - 195 - (markerPosX * 40)) + (vs - 140 - (markerPosY * 53)) * (vs - 140 - (markerPosY * 53))) < 20) begin
    drawing <= 1;
	 red <= 7;
	 green <= 7;
    blue <= 3;
	end
	
	// remaining black
	if (~drawing) begin
		red <= 0;
		green <= 0;
		blue <= 0;
	end
	
	end
	
	
	end
end

endmodule
