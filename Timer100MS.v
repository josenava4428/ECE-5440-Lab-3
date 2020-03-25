module Timer100MS(clk, rst, enable, pulseOut);

	input clk, rst, enable;
	output pulseOut;
	wire msPulse;

	oneMSTimer oneMSTimer_1(clk, rst, enable, msPulse);
	countTo100 countTo100_1(clk, rst, enable, msPulse, pulseOut);
endmodule 