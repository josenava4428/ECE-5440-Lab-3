//ECE 5440
//Author: Jose Navarro
//trueRNG
//This module returns a random number between 0 and 15 according to the counter
module trueRNG(clk, rst, buttonIn, randomNum);

	input clk, rst, buttonIn;
	output [3:0] randomNum;

	counter count1(clk, rst, buttonIn, randomNum);
endmodule
