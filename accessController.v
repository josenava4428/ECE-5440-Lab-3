//ECE 5440
//Author: Jose Navarro
//accessController
//This module creates a security barrier on the FPGA. Therefore only a user that knows
//the 4 digit pass code can play the game.
module accessController(clk, rst, loadPlayer1, loadPlayer2, passWord, passWordEnter, loadPlayer1Pass, loadPlayer2Pass, green, red, noBorrowDown, reconfigButton, enable);

	input clk, rst, loadPlayer1, loadPlayer2, passWordEnter, noBorrowDown;
	input [3:0] passWord;
	output loadPlayer1Pass, loadPlayer2Pass, green, red, reconfigButton, enable;
	reg loadPlayer1Pass, loadPlayer2Pass, green, red, reconfigButton, enable;
	reg passWordFlag;
	//reconfigButton might just be passWordEnter
	reg [3:0] state;
	parameter state0 = 4'b0000, state1 = 4'b0001;
	parameter state2 = 4'b0010, state3 = 4'b0011;
	parameter state4 = 4'b0100, state5 = 4'b0101;
	parameter state6 = 4'b0110, state7 = 4'b0111;
	parameter state8 = 4'b1000, state9 = 4'b1001;
	
	always @ (posedge clk)
		begin
			//passWordFlag = 1'b1;
			if(rst == 0)
				begin
					state <= state0;
					passWordFlag = 1'b1;
				end
			else
				begin
					case(state)
						state0:
							begin
								loadPlayer1Pass <= 1'b1; //might need to change to arrows
								loadPlayer2Pass <= 1'b0;
								green <= 1'b0;
								red <= 1'b1;
								passWordFlag = 1'b1;
								if(passWordEnter == 1'b1)
									begin
										if(passWord == 4'b0100)
											begin
												//good
											end
										else
											begin
												//not good forever, update flag
												passWordFlag = 1'b0;
											end
										//go to next state
										state <= state1;
									end
								else
									begin
										//stay in this state
										state <= state0;
									end
							end
						state1:
							begin
								loadPlayer1Pass <= 1'b1; //might need to change to arrows
								loadPlayer2Pass <= 1'b0;
								green <= 1'b0;
								red <= 1'b1;
								if(passWordEnter == 1'b1)
									begin
										if(passWord == 4'b0010)
											begin
												//good
											end
										else
											begin
												//not good forever
												passWordFlag = 1'b0;
											end
										state <= state2;
									end
								else
									begin
										//stay in this state
										state <= state1;
									end
							end
						state2:
							begin
								loadPlayer1Pass <= 1'b1; //might need to change to arrows
								loadPlayer2Pass <= 1'b0;
								green <= 1'b0;
								red <= 1'b1;
								if(passWordEnter == 1'b1)
									begin
										if(passWord == 4'b0000)
											begin
												//good
											end
										else
											begin
												//not good forever
												passWordFlag = 1'b0;
											end
										state <= state3;
									end
								else
									begin
										//stay in this state
										state <= state2;
									end
							end
						state3:
							begin
								loadPlayer1Pass <= 1'b1; //might need to change to arrows
								loadPlayer2Pass <= 1'b0;
								green <= 1'b0;
								red <= 1'b1;
								if(passWordEnter == 1'b1)
									begin
										if(passWord == 4'b0111)
											begin
												//good
											end
										else
											begin
												//not good forever
												passWordFlag = 1'b0;
											end
										state <= state4;
									end
								else
									begin
										//stay in this state
										state <= state3;
									end
							end
						state4:
							begin
								if(passWordFlag == 1'b0)
									begin
										state <= state0;			
									end
								else
									begin
										state <= state5;
									end
							end
						state5:
							begin
								red <= 1'b0;
								green <= 1'b1;
								state <= state6;
							end
						state6:
							begin
								if(passWordEnter == 1)
									begin
										reconfigButton <= 1;
										state <= state7;
									end
								else
									begin
										state <= state6;
									end
							end
						state7:
							begin
								reconfigButton <= 0;
								if(passWordEnter == 1)
									begin
										state <= state8;	
									end
								else
									begin
										state <= state7;
									end
							end
						state8:
							begin
								enable <= 1;
								loadPlayer1Pass <= loadPlayer1; //might need to change to arrows
								loadPlayer2Pass <= loadPlayer2;
								if(noBorrowDown == 1)
									begin
										state <= state9;
									end
								else
									begin
										state <= state8;
									end
							end
						state9:
							begin
								enable <= 0;
								//reconfigButton <= 0;
								loadPlayer1Pass <= 1'b1; //might need to change to arrows
								loadPlayer2Pass <= 1'b0;
								if(passWordEnter == 1)
									begin
										reconfigButton <= 1;
										state <= state7;
									end
								else
									begin
										state <= state9;
									end						
							end
						default:
							begin
								state <= state0;
								passWordFlag = 1'b1;
							end
					endcase
				end
		end
endmodule

