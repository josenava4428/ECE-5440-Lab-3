//ECE 5440
//Author: Jose Navarro
//counter
//This module counts according to clock cycles
module counter(clk, rst, buttonIn, countOutput);
	
	input clk, rst, buttonIn;
	output reg [3:0] countOutput;
	reg [3:0] count;

	assign buttonCount = ~buttonIn;

	always @ (posedge clk)
		begin
			if(rst == 0)
				begin
					count <= 0;
				end
			else if((count == 15) | (count > 15))
				begin
					count <= 0;		
				end
			else
				begin
					if( buttonCount == 1)
						begin
							count <= count + 1;
						end
					else
						begin
							countOutput <= count;
						end
				end
		end
endmodule
