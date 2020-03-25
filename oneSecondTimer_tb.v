`timescale 10ns/100ps
module oneSecondTimer_tb();

	reg clk, rst, enable;
	wire pulseOut, pulseOut1, pulseOut2;
	
	oneMSTimer oneMSTimer1(clk, rst, enable, pulseOut2);	
	Timer100MS oneSecondTimer_DUT_2(clk, rst, enable, pulseOut);
	oneSecondTimer oneSecondTimer_DUT_1(clk, rst, enable, pulseOut1);

	always
		begin
			#10 clk = 1;
			#10 clk = 0;
		end

	initial
		begin
			rst = 0;
			@(posedge clk);
			@(posedge clk);
			rst = 1;
			enable = 0;
			@(posedge clk);
			@(posedge clk);
			enable = 1;
		end
endmodule
