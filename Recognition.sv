module Recognition(
	input i_clk,
	input i_rst,
	input [3:0] new_x,
	input [2:0] new_y,
	input read_data_valid,
	input [3:0] start_pointx0,
	input [2:0] start_pointy0,
	input [3:0] end_pointx0,
	input [2:0] end_pointy0,
	input [3:0] start_pointx1,
	input [2:0] start_pointy1,
	input [3:0] end_pointx1,
	input [2:0] end_pointy1,
	input [7:0] i_arr0,
	input [7:0] i_arr1,
	input [7:0] i_arr2,
	input [7:0] i_arr3,
	input [7:0] i_arr4,
	input [7:0] i_arr5,
	input [7:0] i_arr6,
	input [7:0] i_arr7,
	input [7:0] i_arr8,
	input [7:0] i_arr9,
	input [7:0] i_arr10,
	input [7:0] i_arr11,
	output ready,
	output[3:0] result
);

logic [3:0] x_distance;
logic [2:0] y_distance;
logic [1:0] nb_point_w, nb_point_r;
logic ready_w;
logic [3:0] result_w, result_r;
logic [5:0] temp;
assign temp = start_pointx1 + start_pointy1 + end_pointx1 + end_pointy1;
assign result = result_r;



logic [3:0] x_templ;
assign x_templ=(start_pointx0>end_pointx0)?(start_pointx0 - end_pointx0):(end_pointx0-start_pointx0);
logic [3:0] x_tempr;
assign x_tempr=(start_pointx0>start_pointx1)?(start_pointx0 - start_pointx1):(start_pointx1-start_pointx0);
assign x_distance = (temp == 6'b000000)? x_templ : x_tempr;


logic [2:0] y_templ;
assign y_templ=(start_pointy0>end_pointy0)?(start_pointy0 - end_pointy0):(end_pointy0-start_pointy0);
logic [2:0] y_tempr;
assign y_tempr=(start_pointy0>start_pointy1)?(start_pointy0 - start_pointy1):(start_pointy1-start_pointy0);
assign y_distance = (temp == 6'b000000)? y_templ : y_tempr;

//array
logic [7:0] array[11:0];
assign array[0]=i_arr0;
assign array[1]=i_arr1;
assign array[2]=i_arr2;
assign array[3]=i_arr3;
assign array[4]=i_arr4;
assign array[5]=i_arr5;
assign array[6]=i_arr6;
assign array[7]=i_arr7;
assign array[8]=i_arr8;
assign array[9]=i_arr9;
assign array[10]=i_arr10;
assign array[11]=i_arr11;

logic [3:0]fat[11:0];
assign fat[0] = end_fat_r[0] - start_fat_r[0];
assign fat[1] = end_fat_r[1] - start_fat_r[1];
assign fat[2] = end_fat_r[2] - start_fat_r[2];
assign fat[3] = end_fat_r[3] - start_fat_r[3];
assign fat[4] = end_fat_r[4] - start_fat_r[4];
assign fat[5] = end_fat_r[5] - start_fat_r[5];
assign fat[6] = end_fat_r[6] - start_fat_r[6];
assign fat[7] = end_fat_r[7] - start_fat_r[7];
assign fat[8] = end_fat_r[8] - start_fat_r[8];
assign fat[9] = end_fat_r[9] - start_fat_r[9];
assign fat[10] = end_fat_r[10] - start_fat_r[10];
assign fat[11] = end_fat_r[11] - start_fat_r[11];


//state
logic [4:0] state_w,state_r;
parameter point_check=5'b00000;
parameter nb0=5'b00001;
parameter nb1=5'b00010;
parameter fat_thin = 5'b00011;
parameter fin=5'b11111;

//
logic [3:0] counter1_w, counter1_r;
logic [3:0] counter2_w, counter2_r;
logic [3:0] start_fat_w[11:0];
logic [3:0] start_fat_r[11:0];
logic [3:0] end_fat_w[11:0];
logic [3:0] end_fat_r[11:0];

always_comb begin
	counter1_w = counter1_r;
	counter2_w = counter2_r;
	nb_point_w = nb_point_r;
	start_fat_w = start_fat_r;
	end_fat_w = end_fat_r;
	
	if(read_data_valid)begin
		case(state_r)
			point_check:begin
				if(temp == 6'b000000)begin
					if(x_distance <= 4'b0010 && y_distance <= 3'b010)begin
						nb_point_w = 2'b00;//1
						state_w=nb0;
						result_w = 4'h0;
						ready_w = 0;
					end
					else begin
						nb_point_w = 2'b01;//2
						state_w=fat_thin;
						result_w = result_r;
						ready_w = 0;
					end
				end
				else begin
					if(x_distance <= 4'b0010 && y_distance <= 3'b010)begin
						nb_point_w = 2'b10;//3 
						state_w = fin;//nb2;
						result_w = (end_pointy1 < 3) ? 4'h5 : 4'h7;
						ready_w = 1;
					end
					else begin
						nb_point_w = 2'b11;//4
						state_w=fin;
						result_w = 4'h4;
						ready_w = 1;
					end
				end
			end
			nb0:begin			
				counter2_w =(array[counter1_r][3] < array[counter1_r + 1][3])?(counter2_r + 1):counter2_r;
				if(counter2_r >= 3)begin
					result_w = 4'h8;
					ready_w = 1;
					state_w = fin;
					counter1_w = 0;
				end
				else if(counter1_r > 9)begin
					result_w = 4'h0;
					ready_w = 1;
					state_w = fin;
					counter1_w = 0; 
				end
				else begin
					result_w = result_r;
					ready_w = 0;
					counter1_w = counter1_r + 1;
					state_w = nb0;
				end
			end
			nb1:begin
				if(fat[0]<=3&&fat[1]<=3&&fat[2]<=3&&fat[3]<=3&&fat[4]<=3&&fat[5]<=3&&fat[6]<=3&&fat[7]<=3&&fat[8]<=3&&fat[9]<=3&&fat[10]<=3&&fat[11]<=3)begin
					state_w = fin;
					result_w =4'h1;
					ready_w = 1;
				end
				else begin
					if(end_pointy0 <= 3)begin
						if(start_pointy0 <= 3)begin
							state_w = fin;
							result_w =4'h9;
							ready_w = 1;
						end
						else begin
							state_w = fin;
							result_w =4'h2;
							ready_w = 1;
						end
					end
					else begin
						state_w = fin;
						ready_w = 1;
						if(fat[0] != 0)begin	result_w = (fat[0] > 3)?4'h3:4'h6;end
						else if(fat[1] != 0)begin	result_w = (fat[1] > 3)?4'h3:4'h6;end
						else if(fat[2] != 0)begin	result_w = (fat[2] > 3)?4'h3:4'h6;end
						else if(fat[3] != 0)begin	result_w = (fat[3] > 3)?4'h3:4'h6;end
						else if(fat[4] != 0)begin	result_w = (fat[4] > 3)?4'h3:4'h6;end
						else if(fat[5] != 0)begin	result_w = (fat[5] > 3)?4'h3:4'h6;end
						else if(fat[6] != 0)begin	result_w = (fat[6] > 3)?4'h3:4'h6;end
						else if(fat[7] != 0)begin	result_w = (fat[7] > 3)?4'h3:4'h6;end
						else if(fat[8] != 0)begin	result_w = (fat[8] > 3)?4'h3:4'h6;end
						else if(fat[9] != 0)begin	result_w = (fat[9] > 3)?4'h3:4'h6;end
						else if(fat[10] != 0)begin	result_w = (fat[10] > 3)?4'h3:4'h6;end
						else if(fat[11] != 0)begin	result_w = (fat[11] > 3)?4'h3:4'h6;end
						else begin result_w = 4'hc;end
					end
				end
			end
			fat_thin:begin
				ready_w = 0;
				result_w = result_r;
			//left to right
				if(array[counter1_r][0] == 1)begin
					start_fat_w[counter1_r] = 4'b0000;
				end
				else if(array[counter1_r][1])begin start_fat_w[counter1_r] = 4'b0001;end
				else if(array[counter1_r][2])begin start_fat_w[counter1_r]= 4'b0010;end
				else if(array[counter1_r][3])begin start_fat_w[counter1_r] = 4'b0011;end
				else if(array[counter1_r][4])begin start_fat_w[counter1_r] = 4'b0100;end
				else if(array[counter1_r][5])begin start_fat_w[counter1_r] = 4'b0101;end
				else if(array[counter1_r][6])begin start_fat_w[counter1_r] = 4'b0110;end
				else if(array[counter1_r][7])begin start_fat_w[counter1_r] = 4'b0111;end
				else begin start_fat_w[counter1_r] = 4'b1000; end
			//right to left
				if(array[counter1_r][7] == 1)begin
					end_fat_w[counter1_r] = 4'b1000;
				end
				else if(array[counter1_r][6])begin end_fat_w[counter1_r] = 4'b0111;end
				else if(array[counter1_r][5])begin end_fat_w[counter1_r] = 4'b0110;end
				else if(array[counter1_r][4])begin end_fat_w[counter1_r] = 4'b0101;end
				else if(array[counter1_r][3])begin end_fat_w[counter1_r] = 4'b0100;end
				else if(array[counter1_r][2])begin end_fat_w[counter1_r] = 4'b0011;end
				else if(array[counter1_r][1])begin end_fat_w[counter1_r] = 4'b0010;end
				else if(array[counter1_r][0])begin end_fat_w[counter1_r] = 4'b0001;end
				else begin end_fat_w[counter1_r] = 4'b1000;end
				
				if(counter1_r == 4'b1011)begin
					state_w = nb1;
					counter1_w = 0;
				end
				else begin
					state_w = fat_thin;
					counter1_w = counter1_r + 1;
				end
			end
			fin:begin
				state_w=fin;
				result_w=result_r;
				ready_w=1;
				nb_point_w=nb_point_r;
			end
		endcase
	end
	else begin
		state_w=state_r;
		nb_point_w = 2'b00;
		result_w = 4'h2;
		ready_w = 0;
		counter1_w = 0;
		counter2_w = 0;
		start_fat_w[0] <= 4'b0000;
		start_fat_w[1] <= 4'b0000;
		start_fat_w[2] <= 4'b0000;
		start_fat_w[3] <= 4'b0000;
		start_fat_w[4] <= 4'b0000;
		start_fat_w[5] <= 4'b0000;
		start_fat_w[6] <= 4'b0000;
		start_fat_w[7] <= 4'b0000;
		start_fat_w[8] <= 4'b0000;
		start_fat_w[9] <= 4'b0000;
		start_fat_w[10] <= 4'b0000;
		start_fat_w[11] <= 4'b0000;
		end_fat_w[0] <= 4'b0000;
		end_fat_w[1] <= 4'b0000;
		end_fat_w[2] <= 4'b0000;
		end_fat_w[3] <= 4'b0000;
		end_fat_w[4] <= 4'b0000;
		end_fat_w[5] <= 4'b0000;
		end_fat_w[6] <= 4'b0000;
		end_fat_w[7] <= 4'b0000;
		end_fat_w[8] <= 4'b0000;
		end_fat_w[9] <= 4'b0000;
		end_fat_w[10] <= 4'b0000;
		end_fat_w[11] <= 4'b0000;
	end
end


always_ff@(posedge i_clk or negedge i_rst)begin
	if(!i_rst)begin
		nb_point_r <= 0;
		ready <= 0;
		result_r <= 0;
		state_r <= point_check;
		counter1_r <= 0;
		counter2_r <= 0;
		start_fat_r[0] <= 4'b0000;
		start_fat_r[1] <= 4'b0000;
		start_fat_r[2] <= 4'b0000;
		start_fat_r[3] <= 4'b0000;
		start_fat_r[4] <= 4'b0000;
		start_fat_r[5] <= 4'b0000;
		start_fat_r[6] <= 4'b0000;
		start_fat_r[7] <= 4'b0000;
		start_fat_r[8] <= 4'b0000;
		start_fat_r[9] <= 4'b0000;
		start_fat_r[10] <= 4'b0000;
		start_fat_r[11] <= 4'b0000;
		end_fat_r[0] <= 4'b0000;
		end_fat_r[1] <= 4'b0000;
		end_fat_r[2] <= 4'b0000;
		end_fat_r[3] <= 4'b0000;
		end_fat_r[4] <= 4'b0000;
		end_fat_r[5] <= 4'b0000;
		end_fat_r[6] <= 4'b0000;
		end_fat_r[7] <= 4'b0000;
		end_fat_r[8] <= 4'b0000;
		end_fat_r[9] <= 4'b0000;
		end_fat_r[10] <= 4'b0000;
		end_fat_r[11] <= 4'b0000;
	end
	else begin
		nb_point_r <= nb_point_w;
		ready <= ready_w;
		result_r <= result_w;
		state_r <= state_w;
		counter1_r <= counter1_w;
		counter2_r <= counter2_w;
		start_fat_r <= start_fat_w;
		end_fat_r <= end_fat_w;
	end
end
endmodule
