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
// Major Functions:	This function will detect the x and y coordinate form 
//                  the touch_spi , if the coordinates fit the picture changing
//					area , this funtionn will output the new displayed photo number
//                  to flash2sdram module   
//
// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
//   Ver  :| Author            		:| Mod. Date :| Changes Made:
//   V1.0 :| Johnny Fan				:| 07/06/30  :| Initial Revision
// --------------------------------------------------------------------
module touch_point_detector	(
					iCLK,
					iRST_n,
					iX_COORD,
					iY_COORD,
					iNEW_COORD,
					iSDRAM_WRITE_EN,
					oPHOTO_CNT,
					);
					
//============================================================================
// PARAMETER declarations
//============================================================================					
parameter	PHOTO_NUM = 3;  // total photo numbers 
parameter	NEXT_PIC_XBD1 = 12'h0;
parameter	NEXT_PIC_XBD2 = 12'h300;
parameter	NEXT_PIC_YBD1 = 12'he00;
parameter	NEXT_PIC_YBD2 = 12'hfff;
parameter	PRE_PIC_XBD1 = 12'hd00;
parameter	PRE_PIC_XBD2 = 12'hfff;
parameter	PRE_PIC_YBD1 = 12'h000;
parameter	PRE_PIC_YBD2 = 12'h200;                             
//===========================================================================
// PORT declarations
//===========================================================================                      
input			iCLK;				// system clock 50Mhz
input			iRST_n;				// system reset
input	[11:0]	iX_COORD;			// X coordinate form touch panel
input	[11:0]	iY_COORD;			// Y coordinate form touch panel
input			iNEW_COORD;			// new coordinates indicate
input			iSDRAM_WRITE_EN;	// sdram write enable
output	[2:0]	oPHOTO_CNT;			// displaed photo number
//=============================================================================
// REG/WIRE declarations
//=============================================================================
reg				mnew_coord;
wire			nextpic_en;
wire			prepic_en;
reg				nextpic_set;
reg				prepic_set;
reg		[2:0]	photo_cnt;
//=============================================================================
// Structural coding
//=============================================================================

// if incoming x and y coordinates fit next picture command area , nextpic_en goes high
assign	nextpic_en = ((iX_COORD > NEXT_PIC_XBD1) && (iX_COORD <  NEXT_PIC_XBD2)  &&
					  (iY_COORD > NEXT_PIC_YBD1) && (iY_COORD <  NEXT_PIC_YBD2))
					  ?1:0;
// if incoming x and y coordinates fit previous picture command area , nextpic_en goes high
assign	prepic_en = ((iX_COORD > PRE_PIC_XBD1) && (iX_COORD <  PRE_PIC_XBD2)  &&
					  (iY_COORD > PRE_PIC_YBD1) && (iY_COORD <  PRE_PIC_YBD2))
					  ?1:0;

always@(posedge iCLK or negedge iRST_n)
	begin
		if (!iRST_n)
			mnew_coord<= 0;
		else
			mnew_coord<= iNEW_COORD;	
	end
	
always@(posedge iCLK or negedge iRST_n)
	begin
		if (!iRST_n)					
			nextpic_set <= 0;
		else if (mnew_coord && nextpic_en &&(!iSDRAM_WRITE_EN))	
			nextpic_set <= 1;
		else
			nextpic_set <= 0;
	end				

always@(posedge iCLK or negedge iRST_n)
	begin
		if (!iRST_n)					
			prepic_set <= 0;
		else if (mnew_coord && prepic_en && (!iSDRAM_WRITE_EN))
			prepic_set <= 1;
		else
			prepic_set <= 0;
	end		

always@(posedge iCLK or negedge iRST_n)
	begin
		if (!iRST_n)
				photo_cnt <= 0;
		else
			begin
				if (nextpic_set)
					begin
						if(photo_cnt == (PHOTO_NUM-1))
							photo_cnt <= 0;
						else
							photo_cnt <= photo_cnt + 1;	
					end		
				if (prepic_set)
					begin
						if(photo_cnt == 0)
							photo_cnt <= (PHOTO_NUM-1);
						else
							photo_cnt <= photo_cnt - 1;	
					end								
			end
	end		
		
assign	oPHOTO_CNT = photo_cnt;


endmodule




								