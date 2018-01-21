module TUMOUR(
	input i_clk,
	input i_rst,
	input i_start,
	input result_ready,
	input [3:0]result,
	input [11:0] old_x,
	input [11:0] old_y,
	output [3:0] new_x,
	output [2:0] new_y,
	output [3:0]startpointx0,
	output [2:0]startpointy0,
	output [3:0]startpointx1,
	output [2:0]startpointy1,
	output [3:0]endpointx0,
	output [2:0]endpointy0,
	output [3:0]endpointx1,
	output [2:0]endpointy1,
	output [3:0] o_result,
	output [7:0] arr0,
	output [7:0] arr1,
	output [7:0] arr2,
	output [7:0] arr3,
	output [7:0] arr4,
	output [7:0] arr5,
	output [7:0] arr6,
	output [7:0] arr7,
	output [7:0] arr8,
	output [7:0] arr9,
	output [7:0] arr10,
	output [7:0] arr11,
	output pls_check,
	output ready_to_show
);



//resize x,y index
logic [14:0] temp;
assign temp=old_x+old_x+old_x;
// also read in new_x into this module
logic [3:0] new_x_container;
assign new_y_container=old_y>>9;
logic [2:0] new_y_container;
assign new_x_container=temp>>10;





//array
logic [7:0] array_w [11:0];
logic [7:0] array_r [11:0];
parameter [7:0] all0 =8'b00000000;
//state
logic [3:0] state_w;
logic [3:0]state_r;
parameter IDLE = 4'h0;
parameter READ = 4'h1;
parameter CHECK = 4'h2;
parameter WAIT= 4'h3;
parameter SHOW= 4'h4;


// define default
logic nevertouch;
assign nevertouch=old_x+old_y;
//define first touch
logic [4:0] firsttouch;
assign firsttouch= startpoint_x_r[0]+startpoint_y_r[0];
//result
logic [3:0] result_temp;



//some traits
//lastpoint
logic [3:0] lastpoint_x_w[1:0];
logic [2:0] lastpoint_y_w[1:0];
logic [3:0] lastpoint_x_r[1:0];
logic [2:0] lastpoint_y_r[1:0];
//startpoint
logic [3:0] startpoint_x_w[1:0];
logic [2:0] startpoint_y_w[1:0];
logic [3:0] startpoint_x_r[1:0];
logic [2:0] startpoint_y_r[1:0];
//delta
logic[3:0] deltax;
logic[2:0] deltay;
logic[4:0] delta;
assign deltax=(new_x_container>lastpoint_x_r[0]) ? new_x_container-lastpoint_x_r[0]: lastpoint_x_r[0]-new_x_container;
assign deltay=(new_y_container>lastpoint_y_r[0]) ? new_y_container-lastpoint_y_r[0]: lastpoint_y_r[0]-new_y_container;
assign delta=deltax+deltay;

//output assign

assign new_y=old_y>>9;
assign new_x=temp>>10;
assign startpointx0=startpoint_x_r[0];
assign startpointx1=startpoint_x_r[1];
assign startpointy0=startpoint_y_r[0];
assign startpointy1=startpoint_y_r[1];
assign endpointx0=lastpoint_x_r[0];
assign endpointx1=lastpoint_x_r[1];
assign endpointy0=lastpoint_y_r[0];
assign endpointy1=lastpoint_y_r[1];
assign o_result=result;
assign arr0=array_r[0];
assign arr1=array_r[1];
assign arr2=array_r[2];
assign arr3=array_r[3];
assign arr4=array_r[4];
assign arr5=array_r[5];
assign arr6=array_r[6];
assign arr7=array_r[7];
assign arr8=array_r[8];
assign arr9=array_r[9];
assign arr10=array_r[10];
assign arr11=array_r[11];

//combination
always_comb begin
	array_w=array_r;
	lastpoint_x_w=lastpoint_x_r;
	lastpoint_y_w=lastpoint_y_r;
	startpoint_x_w=startpoint_x_r;
	startpoint_y_w=startpoint_y_r;
	pls_check=0;
	ready_to_show=0;
	case(state_r)
		CHECK: begin
			state_w=WAIT;
		end
		WAIT:begin
			pls_check=1;
			if(result_ready) begin 
				state_w=SHOW;
			end
			else state_w=WAIT;
		end
		SHOW:begin
			pls_check=1;
			state_w=SHOW;
			ready_to_show=1;
		end
		READ: begin
			if(nevertouch!=12'b000000000000)begin
				array_w[new_x_container][new_y_container]=1;
				if(firsttouch==5'b00000)begin
					startpoint_x_w[0]=new_x_container;
					startpoint_y_w[0]=new_y_container;
				end
				else if(deltax>5'b00001 || deltay>5'b00001)begin
					startpoint_x_w[0]=new_x_container;
					startpoint_y_w[0]=new_y_container;
					startpoint_x_w[1]=startpoint_x_r[0];
					startpoint_y_w[1]=startpoint_y_r[0];
					lastpoint_x_w[1]=lastpoint_x_r[0];
					lastpoint_y_w[1]=lastpoint_y_r[0];
				end
			end
			
			lastpoint_x_w[0]=new_x_container;
			lastpoint_y_w[0]=new_y_container;
			if(!i_start)begin
				state_w=CHECK;
			end
			else begin
				state_w=READ;
			end
		end
		IDLE: begin
			state_w=READ;
			result_temp<=4'b0001;
			array_w[0]<=all0;
			array_w[1]<=all0;
			array_w[2]<=all0;
			array_w[3]<=all0;
			array_w[4]<=all0;
			array_w[5]<=all0;
			array_w[6]<=all0;
			array_w[7]<=all0;
			array_w[8]<=all0;
			array_w[9]<=all0;
			array_w[10]<=all0;
			array_w[11]<=all0;
			lastpoint_x_w[0]<=4'b0000;
			lastpoint_y_w[0]<=3'b000;
			startpoint_x_w[0]<=4'b0000;
			startpoint_y_w[0]<=3'b000;
			lastpoint_x_w[1]<=4'b0000;
			lastpoint_y_w[1]<=3'b000;
			startpoint_x_w[1]<=4'b0000;
			startpoint_y_w[1]<=3'b000;
		end
		default: begin
			state_w=READ;
		end
	endcase
end
//sequence
always_ff @(posedge i_clk or negedge i_rst) begin
	if(!i_rst)begin
		state_r<=IDLE;
		array_r[0]<=all0;
		array_r[1]<=all0;
		array_r[2]<=all0;
		array_r[3]<=all0;
		array_r[4]<=all0;
		array_r[5]<=all0;
		array_r[6]<=all0;
		array_r[7]<=all0;
		array_r[8]<=all0;
		array_r[9]<=all0;
		array_r[10]<=all0;
		array_r[11]<=all0;
		lastpoint_x_r[0]<=4'b0000;
		lastpoint_y_r[0]<=3'b000;
		startpoint_x_r[0]<=4'b0000;
		startpoint_y_r[0]<=3'b000;
		lastpoint_x_r[1]<=4'b0000;
		lastpoint_y_r[1]<=3'b000;
		startpoint_x_r[1]<=4'b0000;
		startpoint_y_r[1]<=3'b000;
	end
	else begin
		state_r<=state_w;
		array_r<=array_w;
		lastpoint_x_r<=lastpoint_x_w;
		lastpoint_y_r<=lastpoint_y_w;
		startpoint_x_r<=startpoint_x_w;
		startpoint_y_r<=startpoint_y_w;
	end
end
endmodule