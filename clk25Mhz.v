`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////

module clk25Mhz(
input clk,
output reg pulse
    );

reg [3:0] counter;

initial counter <= 0;
initial pulse <= 0;

always @ (posedge clk) begin
	counter <= counter + 1;
	if (counter == 1) begin
	pulse <= ~pulse;
	counter <= 0;
	end
end

endmodule

