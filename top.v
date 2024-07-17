`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module top(
input clk, rst,
output reg VGAHSync, VGAVSync, 
output [2:0] red, green, 
output [1:0] blue,
output clk25M,
output debug,

input up, down, right, left, mark
    );

reg [9:0] hs = 0;
reg [9:0] vs = 0;
wire upf, downf, rightf, leftf, markf;

initial begin
	VGAHSync <= 0;
	VGAVSync <= 0;
end


clk25Mhz clk1 (.clk(clk), .pulse(clk25M));

tictactoe game (.clk25M(clk25M), .rst(rst), .hs(hs), .vs(vs), .red(red), .green(green), .blue(blue),.up(upf), .down(downf), .right(rightf), .left(leftf), .mark(markf));

button b1 (.clk(clk25M), .in(up), .out(upf));
button b2 (.clk(clk25M), .in(down), .out(downf));
button b3 (.clk(clk25M), .in(right), .out(rightf));
button b4 (.clk(clk25M), .in(left), .out(leftf));
button b5 (.clk(clk25M), .in(mark), .out(markf));

always @ (posedge clk25M) begin

	if (rst) begin
		hs <= 0;
		vs <= 0;
	end
	else begin
	
	if (hs==799) begin
		hs <= 0;
		
		if (vs == 521)
			vs <= 0;
		else
			vs <= vs + 1;
	end
	else
		hs <= hs + 1;
	
	if ((hs >= 656) && (hs < 752))
		VGAHSync <= 0;
	else
		VGAHSync <= 1;
	
	if ((vs >= 490) && (vs < 492))
		VGAVSync <= 0;
	else
		VGAVSync <= 1;
		
	end
end


endmodule