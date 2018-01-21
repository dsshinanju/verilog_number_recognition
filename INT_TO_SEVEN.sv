module INT_TO_SEVEN(
	input Show,
	input [3:0] input_x,
	input [2:0] input_y,
	output logic [6:0] fake_x_0,
	output logic [6:0] fake_x_1,
	output logic [6:0] fake_x_2,
	output logic [6:0] fake_x_3,
	output logic [6:0] fake_y_0,
	output logic [6:0] fake_y_1,
	output logic [6:0] fake_y_2,
	output logic [6:0] fake_y_3,
	input [3:0] num1_0,
	input [3:0] num1_1,
	input [3:0] num2_0,
	input [3:0] num2_1,
	input [3:0] ans0,
	input [3:0] ans10,
	input [3:0] ans100,
	input [3:0] ans1000,
	input ansrdy,
	//for test
	input [11:0] test_x,
	input [11:0] test_y,
	input [3:0] result
);
	/* The layout of seven segment display, 1: dark
	 *    00
	 *   5  1
	 *    66
	 *   4  2
	 *    33
	 */
	parameter D0 = 7'b1000000;
	parameter D1 = 7'b1111001;
	parameter D2 = 7'b0100100;
	parameter D3 = 7'b0110000;
	parameter D4 = 7'b0011001;
	parameter D5 = 7'b0010010;
	parameter D6 = 7'b0000010;
	parameter D7 = 7'b1011000;
	parameter D8 = 7'b0000000;
	parameter D9 = 7'b0010000;
	parameter DA = 7'b0001000;
	parameter DB = 7'b0000011;
	parameter DC = 7'b1000110;
	parameter DD = 7'b0100001;
	parameter DE = 7'b0000110;
	parameter DF = 7'b0001110;
	//assign fake_x_2=7'b1111111;
	//assign fake_x_1=7'b1111111;
	//assign fake_y_2=7'b1111111;
	//assign fake_y_1=7'b1111111;
	/*for test
	logic [3:0] test_x1;
	logic [3:0] test_x2;
	logic [3:0] test_x3;
	logic [3:0] test_y1;
	logic [3:0] test_y2;
	logic [3:0] test_y3;
	assign test_x1=test_x[3:0];
	assign test_x2=test_x[7:4];
	assign test_x3=test_x[11:8];
	assign test_y1=test_y[3:0];
	assign test_y2=test_y[7:4];
	assign test_y3=test_y[11:8];
	*/
	always_comb begin
		case(num2_1)
			4'h0: begin fake_x_1 = D0;end
			4'h1: begin fake_x_1 = D1;end
			4'h2: begin fake_x_1 = D2;end
			4'h3: begin fake_x_1 = D3;end
			4'h4: begin fake_x_1 = D4;end
			4'h5: begin fake_x_1 = D5;end
			4'h6: begin fake_x_1 = D6;end
			4'h7: begin fake_x_1 = D7;end
			4'h8: begin fake_x_1 = D8;end
			4'h9: begin fake_x_1 = D9;end
			4'ha: begin fake_x_1 = DA;end
			4'hb: begin fake_x_1 = DB;end
			default: begin fake_x_1 = 7'b1111111;end
		endcase
	end
	
	always_comb begin
		if(ansrdy)begin
			case(ans0)
				4'h0: begin fake_x_2 = D0;end
				4'h1: begin fake_x_2 = D1;end
				4'h2: begin fake_x_2 = D2;end
				4'h3: begin fake_x_2 = D3;end
				4'h4: begin fake_x_2 = D4;end
				4'h5: begin fake_x_2 = D5;end
				4'h6: begin fake_x_2 = D6;end
				4'h7: begin fake_x_2 = D7;end
				4'h8: begin fake_x_2 = D8;end
				4'h9: begin fake_x_2 = D9;end
				4'ha: begin fake_x_2 = DA;end
				4'hb: begin fake_x_2 = DB;end
				4'hc: begin fake_x_2 = DC;end
				4'hd: begin fake_x_2 = DD;end
				4'he: begin fake_x_2 = DE;end
				//4'hf: begin fake_x_2 = DF;end
				default: begin fake_x_2 = 7'b1111111;end
			endcase
		end
		else begin
			fake_x_2 = 7'b1111111;
		end
	end
	
	always_comb begin
		if(ansrdy)begin
			case(ans10)
				4'h0: begin fake_y_1 = D0;end
				4'h1: begin fake_y_1 = D1;end
				4'h2: begin fake_y_1 = D2;end
				4'h3: begin fake_y_1 = D3;end
				4'h4: begin fake_y_1 = D4;end
				4'h5: begin fake_y_1 = D5;end
				4'h6: begin fake_y_1 = D6;end
				4'h7: begin fake_y_1 = D7;end
				4'h8: begin fake_y_1 = D8;end
				4'h9: begin fake_y_1 = D9;end
				4'ha: begin fake_y_1 = DA;end
				4'hb: begin fake_y_1 = DB;end
				4'hc: begin fake_y_1 = DC;end
				4'hd: begin fake_y_1 = DD;end
				//4'he: begin fake_y_1 = DE;end
				4'hf: begin fake_y_1 = DF;end
				default: begin fake_y_1 = 7'b1111111;end
			endcase
		end
		else begin
			fake_y_1 = 7'b1111111;
		end
	end
	
	always_comb begin
		if(ansrdy)begin
			case(ans100)
				4'h0: begin fake_y_2 = D0;end
				4'h1: begin fake_y_2 = D1;end
				4'h2: begin fake_y_2 = D2;end
				4'h3: begin fake_y_2 = D3;end
				4'h4: begin fake_y_2 = D4;end
				4'h5: begin fake_y_2 = D5;end
				4'h6: begin fake_y_2 = D6;end
				4'h7: begin fake_y_2 = D7;end
				4'h8: begin fake_y_2 = D8;end
				4'h9: begin fake_y_2 = D9;end
				4'ha: begin fake_y_2 = DA;end
				4'hb: begin fake_y_2 = DB;end
				4'hc: begin fake_y_2 = DC;end
				4'hd: begin fake_y_2 = DD;end
				4'he: begin fake_y_2 = DE;end
				//4'hf: begin fake_y_2 = DF;end
				default: begin fake_y_2 = 7'b1111111;end
			endcase
		end
		else begin
			fake_y_2 = 7'b1111111;
		end
	end
	
	always_comb begin
		if(ansrdy)begin
			case(ans1000)
				4'h0: begin fake_y_3 = D0;end
				4'h1: begin fake_y_3 = D1;end
				4'h2: begin fake_y_3 = D2;end
				4'h3: begin fake_y_3 = D3;end
				4'h4: begin fake_y_3 = D4;end
				4'h5: begin fake_y_3 = D5;end
				4'h6: begin fake_y_3 = D6;end
				4'h7: begin fake_y_3 = D7;end
				4'h8: begin fake_y_3 = D8;end
				4'h9: begin fake_y_3 = D9;end
				4'ha: begin fake_y_3 = DA;end
				4'hb: begin fake_y_3 = DB;end
				4'hc: begin fake_y_3 = DC;end
				4'hd: begin fake_y_3 = DD;end
				4'he: begin fake_y_3 = DE;end
				//4'hf: begin fake_y_3 = DF;end
				default: begin fake_y_3 = 7'b1111111;end
			endcase
		end
		else begin
			fake_y_3 = 7'b1010101;
		end
	end
	
	always_comb begin
		case(num2_0)
			4'h0: begin fake_x_0 = D0;end
			4'h1: begin fake_x_0 = D1;end
			4'h2: begin fake_x_0 = D2;end
			4'h3: begin fake_x_0 = D3;end
			4'h4: begin fake_x_0 = D4;end
			4'h5: begin fake_x_0 = D5;end
			4'h6: begin fake_x_0 = D6;end
			4'h7: begin fake_x_0 = D7;end
			4'h8: begin fake_x_0 = D8;end
			4'h9: begin fake_x_0 = D9;end
			4'ha: begin fake_x_0 = DA;end
			4'hb: begin fake_x_0 = DB;end
			default: begin fake_x_0 = 7'b1111111;end
		endcase
	end
	always_comb begin
		case(num1_0)
			4'h0: begin fake_y_0 = D0;end
			4'h1: begin fake_y_0 = D1;end
			4'h2: begin fake_y_0 = D2;end
			4'h3: begin fake_y_0 = D3;end
			4'h4: begin fake_y_0 = D4;end
			4'h5: begin fake_y_0 = D5;end
			4'h6: begin fake_y_0 = D6;end
			4'h7: begin fake_y_0 = D7;end
			4'h8: begin fake_y_0 = D8;end
			4'h9: begin fake_y_0 = D9;end
			4'ha: begin fake_y_0 = DA;end
			4'hb: begin fake_y_0 = DB;end
			default: begin fake_y_0 = 7'b1111111;end
		endcase
	end
	always_comb begin
		case(num1_1)
			4'h0: begin fake_x_3 = D0;end
			4'h1: begin fake_x_3 = D1;end
			4'h2: begin fake_x_3 = D2;end
			4'h3: begin fake_x_3 = D3;end
			4'h4: begin fake_x_3 = D4;end
			4'h5: begin fake_x_3 = D5;end
			4'h6: begin fake_x_3 = D6;end
			4'h7: begin fake_x_3 = D7;end
			4'h8: begin fake_x_3 = D8;end
			4'h9: begin fake_x_3 = D9;end
			4'ha: begin fake_x_3 = DA;end
			4'hb: begin fake_x_3 = DB;end
			default: begin fake_x_3 = 7'b1111111;end
		endcase
	end
	/*always_comb begin
		case(test_x1)
			4'h0: begin fake_x_0 = D0;end
			4'h1: begin fake_x_0 = D1;end
			4'h2: begin fake_x_0 = D2;end
			4'h3: begin fake_x_0 = D3;end
			4'h4: begin fake_x_0 = D4;end
			4'h5: begin fake_x_0 = D5;end
			4'h6: begin fake_x_0 = D6;end
			4'h7: begin fake_x_0 = D7;end
			4'h8: begin fake_x_0 = D8;end
			4'h9: begin fake_x_0 = D9;end
			4'ha: begin fake_x_0 = DA;end
			4'hb: begin fake_x_0 = DB;end
			default: begin fake_x_0 = 7'b1111111;end
		endcase
	end
	always_comb begin
		case(test_x2)
			4'h0: begin fake_x_1 = D0;end
			4'h1: begin fake_x_1 = D1;end
			4'h2: begin fake_x_1 = D2;end
			4'h3: begin fake_x_1 = D3;end
			4'h4: begin fake_x_1 = D4;end
			4'h5: begin fake_x_1 = D5;end
			4'h6: begin fake_x_1 = D6;end
			4'h7: begin fake_x_1 = D7;end
			4'h8: begin fake_x_1 = D8;end
			4'h9: begin fake_x_1 = D9;end
			4'ha: begin fake_x_1 = DA;end
			4'hb: begin fake_x_1 = DB;end
			default: begin fake_x_1 = 7'b1111111;end
		endcase
	end
	always_comb begin
		case(test_x3)
			4'h0: begin fake_x_2 = D0;end
			4'h1: begin fake_x_2 = D1;end
			4'h2: begin fake_x_2 = D2;end
			4'h3: begin fake_x_2 = D3;end
			4'h4: begin fake_x_2 = D4;end
			4'h5: begin fake_x_2 = D5;end
			4'h6: begin fake_x_2 = D6;end
			4'h7: begin fake_x_2 = D7;end
			4'h8: begin fake_x_2 = D8;end
			4'h9: begin fake_x_2 = D9;end
			4'ha: begin fake_x_2 = DA;end
			4'hb: begin fake_x_2 = DB;end
			default: begin fake_x_2 = 7'b1111111;end
		endcase
	end
	always_comb begin
		case(test_y1)
			4'h0: begin fake_y_0 = D0;end
			4'h1: begin fake_y_0 = D1;end
			4'h2: begin fake_y_0 = D2;end
			4'h3: begin fake_y_0 = D3;end
			4'h4: begin fake_y_0 = D4;end
			4'h5: begin fake_y_0 = D5;end
			4'h6: begin fake_y_0 = D6;end
			4'h7: begin fake_y_0 = D7;end
			4'h8: begin fake_y_0 = D8;end
			4'h9: begin fake_y_0 = D9;end
			4'ha: begin fake_y_0 = DA;end
			4'hb: begin fake_y_0 = DB;end
			default: begin fake_y_0 = 7'b1111111;end
		endcase
	end
	always_comb begin
		case(test_y2)
			4'h0: begin fake_y_1 = D0;end
			4'h1: begin fake_y_1 = D1;end
			4'h2: begin fake_y_1 = D2;end
			4'h3: begin fake_y_1 = D3;end
			4'h4: begin fake_y_1 = D4;end
			4'h5: begin fake_y_1 = D5;end
			4'h6: begin fake_y_1 = D6;end
			4'h7: begin fake_y_1 = D7;end
			4'h8: begin fake_y_1 = D8;end
			4'h9: begin fake_y_1 = D9;end
			4'ha: begin fake_y_1 = DA;end
			4'hb: begin fake_y_1 = DB;end
			default: begin fake_y_1 = 7'b1111111;end
		endcase
	end
	always_comb begin
		case(test_y3)
			4'h0: begin fake_y_2 = D0;end
			4'h1: begin fake_y_2 = D1;end
			4'h2: begin fake_y_2 = D2;end
			4'h3: begin fake_y_2 = D3;end
			4'h4: begin fake_y_2 = D4;end
			4'h5: begin fake_y_2 = D5;end
			4'h6: begin fake_y_2 = D6;end
			4'h7: begin fake_y_2 = D7;end
			4'h8: begin fake_y_2 = D8;end
			4'h9: begin fake_y_2 = D9;end
			4'ha: begin fake_y_2 = DA;end
			4'hb: begin fake_y_2 = DB;end
			default: begin fake_y_2 = 7'b1111111;end
		endcase
	end*/
endmodule
