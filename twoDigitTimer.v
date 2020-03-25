module twoDigitTimer(clk, rst, oneSecTime, timeInput1Button, timeInput1, timeInput10, timeToDisplay1, timeToDisplay10, noBorrowDown1);

	input clk, rst, oneSecTime, timeInput1Button;
	input [3:0] timeInput1, timeInput10;
	output [3:0] timeToDisplay1, timeToDisplay10;
	output noBorrowDown1;

	wire borrowUp1, noBorrowDown10;
	wire dontCare;
	//digitTimer(clk, rst, confirmButtonNum, timeAmountInput, borrowUp, noBorrowUp, borrowDown, noBorrowDown, timeToDisplay);
	digitTimer digitTimer1(clk, rst, timeInput1Button, timeInput1, borrowUp1, noBorrowDown10, oneSecTime, noBorrowDown1, timeToDisplay1);
	digitTimer digitTimer10(clk, rst, timeInput1Button, timeInput10, dontCare, 1, borrowUp1, noBorrowDown10, timeToDisplay10);
endmodule 