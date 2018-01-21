module calculator(
	input i_clk,
	input i_rst,
	input numberrdy,
	input changenumber,
	input i_start,
	input [3:0] operation,
	input [3:0] number,
	output [3:0] ans0,
	output [3:0] ans10,
	output [3:0] ans100,
	output [3:0] ans1000,
	output [3:0] num1_0,
	output [3:0] num1_1,
	output [3:0] num2_0,
	output [3:0] num2_1,
	output ansrdy
);
parameter IDLE= 3'b000;
parameter read1=3'b001;
parameter read2=3'b010;
parameter run=3'b011;

assign num1_0=num1_r[0];
assign num1_1=num1_r[1];
assign num2_0=num2_r[0];
assign num2_1=num2_r[1];

logic [3:0] num1_w [1:0];
logic [3:0] num1_r [1:0];
logic [3:0] num2_w [1:0];
logic [3:0] num2_r [1:0];
logic [13:0] ans_w;
logic [13:0] ans_r;
logic [3:0]state_r;
logic [1:0] counter_w;
logic [1:0] counter_r;
logic [3:0]state_w;

//rdy
logic fin_w;
logic fin_r;
assign ansrdy=fin_r;

//to bin
logic [6:0] num1_tenx8;
logic [6:0] num1_tenx2;
logic [6:0] num2_tenx8;
logic [6:0] num2_tenx2;
logic [7:0] num1_bin;
logic [7:0] num2_bin;
assign num1_tenx8=(num1_r[1]==4'b1111)?7'b0000000:num1_r[1]<<3;
assign num1_tenx2=(num1_r[1]==4'b1111)?7'b0000000:num1_r[1]<<1;
assign num2_tenx8=(num2_r[1]==4'b1111)?7'b0000000:num2_r[1]<<3;
assign num2_tenx2=(num2_r[1]==4'b1111)?7'b0000000:num2_r[1]<<1;
assign num1_bin=num1_tenx8+num1_tenx2+num1_r[0];
assign num2_bin=num2_tenx8+num2_tenx2+num2_r[0];

//to decimal

logic [3:0]ans_temp0;
logic [13:0]ans_temp_temp0[1:0];
logic [3:0]ans_temp10;
logic [13:0]ans_temp_temp10[2:0];
logic [3:0]ans_temp100;
logic [13:0]ans_temp_temp100[2:0];
logic [3:0]ans_temp1000;

assign ans_temp1000=ans_w/1000;
assign ans_temp_temp100[0]=ans_w/100;
assign ans_temp_temp100[1]=ans_temp1000<<3;
assign ans_temp_temp100[2]=ans_temp1000<<1;
assign ans_temp100=ans_temp_temp100[0]-ans_temp_temp100[1]-ans_temp_temp100[2];
assign ans_temp_temp10[0]=ans_w/10;
assign ans_temp_temp10[1]=ans_temp_temp100[0]<<3;
assign ans_temp_temp10[2]=ans_temp_temp100[0]<<1;
assign ans_temp10=ans_temp_temp10[0]-ans_temp_temp10[1]-ans_temp_temp10[2];
assign ans_temp_temp0[0]=ans_temp_temp10[0]<<3;
assign ans_temp_temp0[1]=ans_temp_temp10[0]<<1;
assign ans_temp0=ans_w-ans_temp_temp0[0]-ans_temp_temp0[1];

assign ans0=(ans_w==14'b11111111111111)?4'b1111:ans_temp0;
assign ans10=(ans_w==14'b11111111111111)?4'b1111:ans_temp10;
assign ans100=(ans_w==14'b11111111111111)?4'b1111:ans_temp100;
assign ans1000=(ans_w==14'b11111111111111)?4'b1111:ans_temp1000;

always_comb begin
	num1_w=num1_r;
	num2_w=num2_r;
	ans_w=ans_r;
	state_w=state_r;
	counter_w=counter_r;
	fin_w=fin_r;
	case(state_r)
		IDLE:begin
			if(numberrdy)begin
				num1_w[0]=number;
				counter_w=2'b01;
				state_w=read1;
			end
			else begin
				num1_w[0]=4'b1111;
				counter_w=counter_r;
				state_w=IDLE;
			end
			fin_w=1'b0;
			num1_w[1]=4'b1111;
			num2_w[0]<=4'b1111;
			num2_w[1]<=4'b1111;
			ans_w<=14'b11111111111111;
		end
		read1:begin
			if(!i_start)begin
				counter_w=2'b00;
				state_w=run;
			end
			else if(!changenumber)begin
				counter_w=2'b00;
				state_w=read2;
			end
			else begin
				state_w=read1;
				if(!numberrdy && counter_r==2'b01)begin
					counter_w=2'b10;
				end
				else if(numberrdy && counter_r==2'b10)begin
					num1_w[1]=num1_r[0];
					num1_w[0]=number;
					counter_w=2'b11;
				end
				
			end
		end
		read2:begin
			if(!i_start)begin
				state_w=run;
			end
			else begin
				state_w=read2;
				if(numberrdy && counter_r==2'b00)begin
					counter_w=2'b01;
					num2_w[0]=number;
				end
				else if (!numberrdy && counter_r==2'b01)begin
					counter_w=2'b10;
				end
				else if(numberrdy && counter_r==2'b10)begin
					num2_w[1]=num2_r[0];
					num2_w[0]=number;
					counter_w=2'b11;
				end
			end
		end
		run:begin
			state_w=run;
			fin_w=1'b1;
			if(operation[0])begin 
				ans_w=num1_bin+num2_bin;
			end
			else if(operation[1])begin
				ans_w=(num1_bin<num2_bin)?14'b00000000000000:num1_bin-num2_bin;
			end
			else if(operation[2])begin 
				ans_w=num1_bin*num2_bin;
			end
			else if(operation[3])begin
				ans_w=(num2_bin==8'b00000000)?14'b11111111111111:num1_bin/num2_bin;
			end
			else begin
				ans_w=14'b11111111111111;
			end
		end
		default:begin
			state_w=IDLE;
		end
	endcase
end
always_ff @(posedge i_clk) begin
	if(!i_rst)begin 
		num1_r[0]<=4'b1111;
		num1_r[1]<=4'b1111;
		num2_r[0]<=4'b1111;
		num2_r[1]<=4'b1111;
		counter_r<=2'b00;
		ans_r<=14'b11111111111111;
		state_r<=IDLE;
		fin_r<=1'b0;
	end
	else begin
		num1_r<=num1_w;
		num2_r<=num2_w;
		ans_r<=ans_w;
		counter_r<=counter_w;
		state_r<=state_w;
		fin_r<=fin_w;
	end
end
endmodule