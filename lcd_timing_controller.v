// --------------------------------------------------------------------
// Copyright (c) 2005 by Terasic Technologies Inc. 
// --------------------------------------------------------------------
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// --------------------------------------------------------------------
//           
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// --------------------------------------------------------------------
//
// Major Functions:	DE2 LTM module Timing control and output image data
//					form sdram 
//
// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
//   Ver  :| Author            		:| Mod. Date :| Changes Made:
//   V1.0 :| Johnny Fan				:| 07/06/30  :| Initial Revision
// --------------------------------------------------------------------
module lcd_timing_controller		(
						iCLK, 				// LCD display clock
						iRST_n, 			// systen reset
						// SDRAM SIDE 
						iREAD_DATA, 		// R and G  color data form sdram 	
						//iREAD_DATA2,		// B color data form sdram
						oREAD_SDRAM_EN,		// read sdram data control signal
						//array from top
						arr0,
						arr1,
						arr2,
						arr3,
						arr4,
						arr5,
						arr6,
						arr7,
						arr8,
						arr9,
						arr10,
						arr11,
						//LCD SIDE
						oHD,				// LCD Horizontal sync 
						oVD,				// LCD Vertical sync 	
						oDEN,				// LCD Data Enable
						oLCD_R,				// LCD Red color data 
						oLCD_G,             // LCD Green color data  
						oLCD_B,             // LCD Blue color data  
						);
//============================================================================
// PARAMETER declarations
//============================================================================
parameter H_LINE = 1056;
parameter V_LINE = 525;
parameter Hsync_Blank = 216;
parameter Hsync_Front_Porch = 40;
parameter Vertical_Back_Porch = 35;
parameter Vertical_Front_Porch = 10;
//===========================================================================
// PORT declarations
//===========================================================================
input			iCLK;   
input			iRST_n;
input	[31:0]	iREAD_DATA;
//input	[15:0]	iREAD_DATA2;
output			oREAD_SDRAM_EN;
output	[7:0]	oLCD_R;		
output  [7:0]	oLCD_G;
output  [7:0]	oLCD_B;
output			oHD;
output			oVD;
output			oDEN;
// array from top
input [7:0] arr0;
input [7:0] arr1;
input [7:0] arr2;
input [7:0] arr3;
input [7:0] arr4;
input [7:0] arr5;
input [7:0] arr6;
input [7:0] arr7;
input [7:0] arr8;
input [7:0] arr9;
input [7:0] arr10;
input [7:0] arr11;
//=============================================================================
// REG/WIRE declarations
//=============================================================================
reg		[10:0]  x_cnt;  
reg		[9:0]	y_cnt; 
wire	[7:0]	read_red;
wire	[7:0]	read_green;
wire	[7:0]	read_blue; 
wire			display_area;
wire			oREAD_SDRAM_EN;
reg				mhd;
reg				mvd;
reg				oHD;
reg				oVD;
reg				oDEN;
reg		[7:0]	oLCD_R;
reg		[7:0]	oLCD_G;	
reg		[7:0]	oLCD_B;		
wire  	[4:0] arr_x;
wire		[3:0] arr_y;
//=============================================================================
// Structural coding
//=============================================================================
//array
wire [7:0] array[11:0];
wire [10:0] x_minus;
wire [10:0] y_minus;
//wire [16:0] shift6;
//wire [14:0] shift4;
//wire [13:0] shift3;
//wire [12:0] shift2;
//wire [17:0] summationx;
assign array[0]=arr0;
assign array[1]=arr1;
assign array[2]=arr2;
assign array[3]=arr3;
assign array[4]=arr4;
assign array[5]=arr5;
assign array[6]=arr6;
assign array[7]=arr7;
assign array[8]=arr8;
assign array[9]=arr9;
assign array[10]=arr10;
assign array[11]=arr11;
/*
assign shift6 = x_cnt << 6;
assign shift4 = x_cnt << 4;
assign shift3 = x_cnt << 3;
assign shift2 = x_cnt << 2;
*/
assign x_minus = x_cnt - 215;
assign arr_x=x_minus/67;
assign y_minus = y_cnt - 35;
assign arr_y=y_minus/60;

// This signal control reading data form SDRAM , if high read color data form sdram  .
assign	oREAD_SDRAM_EN = (	(x_cnt>Hsync_Blank-2)&&
							(x_cnt<(H_LINE-Hsync_Front_Porch-1))&&
							(y_cnt>(Vertical_Back_Porch-1))&&
							(y_cnt<(V_LINE - Vertical_Front_Porch))
						 )?  1'b1 : 1'b0;
						
// This signal indicate the lcd display area .
assign	display_area = ((x_cnt>(Hsync_Blank-1)&& //>215
						(x_cnt<(H_LINE-Hsync_Front_Porch))&& //< 1016
						(y_cnt>(Vertical_Back_Porch-1))&& 
						(y_cnt<(V_LINE - Vertical_Front_Porch))
						))  ? 1'b1 : 1'b0;

assign	read_red 	= (display_area && array[arr_x][arr_y])? iREAD_DATA[31:24] : 8'b11111111;
assign	read_green 	= (display_area && array[arr_x][arr_y])? iREAD_DATA[23:16] : 8'b11111111;
assign	read_blue 	= (display_area && array[arr_x][arr_y])? iREAD_DATA[15:8] : 8'b11111111;

///////////////////////// x  y counter  and lcd hd generator //////////////////
always@(posedge iCLK or negedge iRST_n)
	begin
		if (!iRST_n)
		begin
			x_cnt <= 11'd0;	
			mhd  <= 1'd0;  	
		end	
		else if (x_cnt == (H_LINE-1))
		begin
			x_cnt <= 11'd0;
			mhd  <= 1'd0;
		end	   
		else
		begin
			x_cnt <= x_cnt + 11'd1;
			mhd  <= 1'd1;
		end	
	end

always@(posedge iCLK or negedge iRST_n)
	begin
		if (!iRST_n)
			y_cnt <= 10'd0;
		else if (x_cnt == (H_LINE-1))
		begin
			if (y_cnt == (V_LINE-1))
				y_cnt <= 10'd0;
			else
				y_cnt <= y_cnt + 10'd1;	
		end
	end
////////////////////////////// touch panel timing //////////////////

always@(posedge iCLK  or negedge iRST_n)
	begin
		if (!iRST_n)
			mvd  <= 1'b1;
		else if (y_cnt == 10'd0)
			mvd  <= 1'b0;
		else
			mvd  <= 1'b1;
	end			


always@(posedge iCLK or negedge iRST_n)
	begin
		if (!iRST_n)
			begin
				oHD	<= 1'd0;
				oVD	<= 1'd0;
				oDEN <= 1'd0;
				oLCD_R <= 8'd0;
				oLCD_G <= 8'd0;
				oLCD_B <= 8'd0;
			end
		else
			begin
				oHD	<= mhd;
				oVD	<= mvd;
				oDEN <= display_area;
				oLCD_R <= read_red;
				oLCD_G <= read_green;
				oLCD_B <= read_blue;
			end		
	end
						
endmodule











