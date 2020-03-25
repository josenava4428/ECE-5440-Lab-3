module digitTimer(clk, rst, confirmButtonNum, timeAmountInput, borrowUp, noBorrowUp, 
borrowDown, noBorrowDown, timeToDisplay);

	input clk, rst, confirmButtonNum, noBorrowUp, borrowDown;
	output reg borrowUp, noBorrowDown;
	input [3:0] timeAmountInput;
	reg [3:0] timeAmount;
	output reg [3:0] timeToDisplay;
	
		always @ (posedge clk)
		begin
			if(rst == 0)
				begin
					//reset values
					timeToDisplay <= 0;
//					borrowUp <= 0;
//					noBorrowDown <= 0; 
					timeAmount <= 0;
				end
			else
				begin
					if(confirmButtonNum == 1)
						begin
							if(timeAmountInput > 9)
								begin 
									timeAmount <= 9;
								end
							else
								begin
									timeAmount <= timeAmountInput;
								end
							timeToDisplay <= timeAmount;
							if(timeAmount == 0)
								begin
									noBorrowDown <= 1;
								end
							else
								begin
									noBorrowDown <= 0;
								end
						end
					else
						begin
							timeToDisplay <= timeAmount;
							if( borrowDown == 1)
								begin
									if(timeAmount > 0)
										begin
											//check if game is over
											if(timeAmount == 1 && noBorrowUp == 1)
												begin
													borrowUp <= 1;
													timeToDisplay <= 0;
													timeAmount <= 0;
													noBorrowDown <= 1;
													//flag that game is over		
												end
											else
												begin
													timeAmount <= timeAmount - 1;
													timeToDisplay <= timeAmount;
													noBorrowDown <= 0;
													borrowUp <= 0; // this may need to change
												end
										end
									else if(timeAmount == 0)
											begin
												timeToDisplay <= 0; //might not be necessary
												if(noBorrowUp == 1)
													begin
														//there is nothing to borrow, higher num is 0
													end
												else if(noBorrowUp == 0)
													begin
														//there is something to borrow
														timeAmount <= 9;
														timeToDisplay <= timeAmount;
													end
												borrowUp <= 1;
												//noBorrowDown <= 1;
											end
								end
							else
								begin
									if(timeAmount==0)
										begin
											if(noBorrowUp==0)
												begin
													noBorrowDown<=0;
												end
											else
												begin
													borrowUp<=0;
													noBorrowDown<=1;
												end
										end
									else
										begin
											noBorrowDown<=0;
											borrowUp<=0;
										end
						
								end
						end
				end
		end
endmodule 