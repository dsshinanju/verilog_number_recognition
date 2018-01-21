module SEVEN_TO_INT(
	input [6:0] x_2,
	input [6:0] x_1,
	input [6:0] x_0,
	input [6:0] y_2,
	input [6:0] y_1,
	input [6:0] y_0,
	output[11:0] output_y,
	output[11:0] output_x
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
	logic [6:0] x0;
	logic [6:0] x1;
	logic [6:0] x2;
	logic [6:0] y0;
	logic [6:0] y1;
	logic [6:0] y2;
	logic[3:0] container_x_0;
	logic[3:0] container_x_1;
	logic[3:0] container_x_2;
	logic[3:0] container_y_0;
	logic[3:0] container_y_1;
	logic[3:0] container_y_2;
	assign output_x[3:0]=container_x_0;
	assign output_x[7:4]=container_x_1;
	assign output_x[11:8]=container_x_2;
	assign output_y[3:0]=container_y_0;
	assign output_y[7:4]=container_y_1;
	assign output_y[11:8]=container_y_2;
	assign x0=x_0;
	assign x1=x_0;
	assign x2=x_2;
	assign y0=y_0;
	assign y1=y_1;
	assign y2=y_2;
	always_comb begin
		case(x0)
			D0: begin container_x_0=4'h0; end
			D1: begin container_x_0=4'h1; end
			D2: begin container_x_0=4'h2; end
			D3: begin container_x_0=4'h3; end
			D4: begin container_x_0=4'h4; end
			D5: begin container_x_0=4'h5; end
			D6: begin container_x_0=4'h6; end
			D7: begin container_x_0=4'h7; end
			D8: begin container_x_0=4'h8; end
			D9: begin container_x_0=4'h9; end
			DA: begin container_x_0=4'ha; end
			DB: begin container_x_0=4'hb; end
			DC: begin container_x_0=4'hc; end
			DD: begin container_x_0=4'hd; end
			DE: begin container_x_0=4'he; end
			DF: begin container_x_0=4'hf; end
			default:begin container_x_0=4'h0; end
		endcase
	end
	always_comb begin
		case(x1)
			D0: begin container_x_1=4'h0; end
			D1: begin container_x_1=4'h1 ;end
			D2: begin container_x_1=4'h2; end
			D3: begin container_x_1=4'h3; end
			D4: begin container_x_1=4'h4; end
			D5: begin container_x_1=4'h5; end
			D6: begin container_x_1=4'h6; end
			D7: begin container_x_1=4'h7; end
			D8: begin container_x_1=4'h8; end
			D9: begin container_x_1=4'h9; end
			DA: begin container_x_1=4'ha; end
			DB: begin container_x_1=4'hb; end
			DC: begin container_x_1=4'hc; end
			DD: begin container_x_1=4'hd; end
			DE: begin container_x_1=4'he; end
			DF: begin container_x_1=4'hf; end
			default: begin container_x_1=4'h0; end
		endcase
	end
	always_comb begin
		case(x2)
			D0: begin container_x_2=4'h0; end
			D1: begin container_x_2=4'h1; end
			D2: begin container_x_2=4'h2; end
			D3: begin container_x_2=4'h3; end
			D4: begin container_x_2=4'h4; end
			D5: begin container_x_2=4'h5; end
			D6: begin container_x_2=4'h6; end
			D7: begin container_x_2=4'h7; end
			D8: begin container_x_2=4'h8; end
			D9: begin container_x_2=4'h9; end
			DA: begin container_x_2=4'ha; end
			DB: begin container_x_2=4'hb; end
			DC: begin container_x_2=4'hc; end
			DD: begin container_x_2=4'hd; end
			DE: begin container_x_2=4'he; end
			DF: begin container_x_2=4'hf; end
			default: begin container_x_2=4'h0; end
		endcase
	end
	always_comb begin
		case(y0)
			D0: begin container_y_0=4'h0; end
			D1: begin container_y_0=4'h1; end
			D2: begin container_y_0=4'h2; end
			D3: begin container_y_0=4'h3; end
			D4: begin container_y_0=4'h4; end
			D5: begin container_y_0=4'h5; end
			D6: begin container_y_0=4'h6; end
			D7: begin container_y_0=4'h7; end
			D8: begin container_y_0=4'h8; end
			D9: begin container_y_0=4'h9; end
			DA: begin container_y_0=4'ha; end
			DB: begin container_y_0=4'hb; end
			DC: begin container_y_0=4'hc; end
			DD: begin container_y_0=4'hd; end
			DE: begin container_y_0=4'he; end
			DF: begin container_y_0=4'hf; end
			default: begin container_y_0=4'h0; end
		endcase
	end
	always_comb begin
		case(y1)
			D0: begin container_y_1=4'h0; end
			D1: begin container_y_1=4'h1; end
			D2: begin container_y_1=4'h2; end
			D3: begin container_y_1=4'h3; end
			D4: begin container_y_1=4'h4; end
			D5: begin container_y_1=4'h5; end
			D6: begin container_y_1=4'h6; end
			D7: begin container_y_1=4'h7; end
			D8: begin container_y_1=4'h8; end
			D9: begin container_y_1=4'h9; end
			DA: begin container_y_1=4'ha; end
			DB: begin container_y_1=4'hb; end
			DC: begin container_y_1=4'hc; end
			DD: begin container_y_1=4'hd; end
			DE: begin container_y_1=4'he; end
			DF: begin container_y_1=4'hf; end
			default: begin container_y_1=4'h0; end
		endcase
	end
	always_comb begin
		case(y2)
			D0: begin container_y_2=4'h0; end
			D1: begin container_y_2=4'h1; end
			D2: begin container_y_2=4'h2; end
			D3: begin container_y_2=4'h3; end
			D4: begin container_y_2=4'h4; end
			D5: begin container_y_2=4'h5; end
			D6: begin container_y_2=4'h6; end
			D7: begin container_y_2=4'h7; end
			D8: begin container_y_2=4'h8; end
			D9: begin container_y_2=4'h9; end
			DA: begin container_y_2=4'ha; end
			DB: begin container_y_2=4'hb; end
			DC: begin container_y_2=4'hc; end
			DD: begin container_y_2=4'hd; end
			DE: begin container_y_2=4'he; end
			DF: begin container_y_2=4'hf; end
			default: begin container_y_2=4'h0; end
		endcase
	end
endmodule
