module s2int(
	input [6:0] input7,
	output [3:0] int16
);
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
	parameter DA = 7'b0010000;
	parameter DB = 7'b1100000;
	parameter DC = 7'b0110001;
	parameter DD = 7'b1000010;
	parameter DE = 7'b0110000;
	parameter DF = 7'b0111000;
	always_comb begin
		case(input7)
			D0: begin int16=4'h0; end
			D1: begin int16=4'h1 ;end
			D2: begin int16=4'h2; end
			D3: begin int16=4'h3; end
			D4: begin int16=4'h4; end
			D5: begin int16=4'h5; end
			D6: begin int16=4'h6; end
			D7: begin int16=4'h7; end
			D8: begin int16=4'h8; end
			D9: begin int16=4'h9; end
			DA: begin int16=4'ha; end
			DB: begin int16=4'hb; end
			DC: begin int16=4'hc; end
			DD: begin int16=4'hd; end
			DE: begin int16=4'he; end
			DF: begin int16=4'hf; end
		endcase
		
	end
endmodule	