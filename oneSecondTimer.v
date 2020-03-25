module oneSecondTimer(clk, rst, enable, pulseOut);

	input clk, rst, enable;
	output pulseOut;
	wire ms100pulse;
	
	Timer100MS Timer100MS1(clk, rst, enable, ms100pulse);
	countTo10 countTo10_1(clk, rst, enable, ms100pulse, pulseOut);		

endmodule
