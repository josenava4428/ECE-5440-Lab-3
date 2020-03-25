module Lab3_NAVARRO_J(clk, rst, player1Button, accessControlSwitch, accessButton, player2Button, player2Input,
tensDigit, onesDigit, greenLED1, redLED1, greenLED2, redLED2, randomNumber1, sum, player2InputDisplay, 
tensDigitDisplay, onesDigitDisplay);
	
	input clk, rst, player1Button, accessButton, player2Button;  
	input [3:0] accessControlSwitch, player2Input, tensDigit, onesDigit;

	output greenLED1, redLED1, greenLED2, redLED2;
	output [6:0] randomNumber1, sum, player2InputDisplay, tensDigitDisplay, onesDigitDisplay;

	wire buttonOutputAccess, buttonOutputPlayer2, loadPlayer1Pass, loadPlayer2Pass, noBorrowDown;
	wire enable, reconfigButton, pulseOut;
	wire [3:0] randomNum, onesDigitWire, tensDigitWire, player2InputWire, sumCalculated;

	//buttonShaper(clk, rst, buttonInput, buttonOutput);
	buttonShaper buttonShaperAccess(clk, rst, accessButton, buttonOutputAccess);
	buttonShaper buttonSahperPlayer2(clk, rst, player2Button, buttonOutputPlayer2);

	//accessController(clk, rst, loadPlayer1, loadPlayer2, passWord, passWordEnter, loadPlayer1Pass, loadPlayer2Pass, 
	//green, red, noBorrowDown, reconfigButton, enable);
	accessController accessController1(clk, rst, player1Button, buttonOutputPlayer2, accessControlSwitch, buttonOutputAccess,
	loadPlayer1Pass, loadPlayer2Pass, greenLED2, redLED2, noBorrowDown, reconfigButton, enable);

	//loadRegister(clk, rst, loadPlayer, playerInput, playerOutput);
	loadRegister loadRegisterPlayer2(clk, rst, loadPlayer2Pass, player2Input, player2InputWire);

	//oneSecondTimer(clk, rst, enable, pulseOut);
	oneSecondTimer oneSecondTimer1(clk, rst, enable, pulseOut);

	//trueRNG(clk, rst, buttonIn, randomNum);
	trueRNG randomNumberGenerator(clk, rst, loadPlayer1Pass, randomNum);

	//twoDigitTimer(clk, rst, oneSecTime, timeInput1Button, timeInput1, timeInput10, timeToDisplay1, 
	//timeToDisplay10, noBorrowDown1);
	twoDigitTimer twoDigitTimer1(clk, rst, pulseOut, reconfigButton, onesDigit, tensDigit, onesDigitWire, 
	tensDigitWire, noBorrowDown);

	//adder(num1, num2, sum);
	adder adderSumTotal(randomNum, player2InputWire, sumCalculated);

	//ledToggle(sum, red, green);
	ledToggle ledToggle1(sumCalculated, redLED1, greenLED1);

	//sevenSegDecoder(numIn, numOut);
	sevenSegDecoder randomNum1(randomNum, randomNumber1);
	sevenSegDecoder sum1(sumCalculated, sum);
	sevenSegDecoder player2(player2InputWire, player2InputDisplay);
	sevenSegDecoder onesDigit1(onesDigitWire, onesDigitDisplay);
	sevenSegDecoder tensDigit1(tensDigitWire, tensDigitDisplay);
	
endmodule 