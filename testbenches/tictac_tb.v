`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////

module tictac_tb;

	// Inputs
	reg clk25M;
	reg rst;
	reg [9:0] hs;
	reg [9:0] vs;
	reg up;
	reg down;
	reg right;
	reg left;
	reg mark;

	// Outputs
	wire [2:0] red;
	wire [2:0] green;
	wire [1:0] blue;

	// Instantiate the Unit Under Test (UUT)
	tictactoe uut (
		.clk25M(clk25M), 
		.rst(rst), 
		.hs(hs), 
		.vs(vs), 
		.red(red), 
		.green(green), 
		.blue(blue), 
		.up(up), 
		.down(down), 
		.right(right), 
		.left(left), 
		.mark(mark)
	);

	initial begin
		// Initialize Inputs
		clk25M = 0;
		rst = 0;
		hs = 0;
		vs = 0;
		up = 0;
		down = 0;
		right = 0;
		left = 0;
		mark = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

