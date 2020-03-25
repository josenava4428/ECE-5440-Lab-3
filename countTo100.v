module countTo100(clk, rst, enable, pulseIn, pulseOut);

	input clk, rst, enable, pulseIn;
	output reg pulseOut;
	reg [6:0] count;

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
							if(pulseIn == 1) // && ((count == 3) | (count > 3))) //100
								begin
										if((count == 99) | (count> 99))
											begin
												pulseOut = 1;
												count <= 0;
											end
										else
											begin
												pulseOut <= 0;
												count <= count + 1;	
											end	
								end
							else
								begin
									pulseOut <= 0;
								end
						end
				end
		end
		
endmodule
