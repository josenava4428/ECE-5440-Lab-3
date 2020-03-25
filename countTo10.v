module countTo10(clk, rst, enable, pulseIn, pulseOut);

	input clk, rst, enable, pulseIn;
	output reg pulseOut;
	reg [3:0] count;

	always @ (posedge clk)
		begin
			if(enable == 0)
				begin 

				end
			else
				begin
					if(rst == 0)
						begin
							count <= 0;
							pulseOut <= 0;
						end
					else 
						begin
							if( pulseIn == 1 && ((count == 9) | (count > 9))) //10
								begin
									count <= 0;
									pulseOut <= 1;	
								end
							else if (pulseIn == 1)
								begin
									count <= count + 1;
									pulseOut <= 0;
								end
							else
								begin
									pulseOut <= 0;
								end
						end
				end
		end
		
endmodule
