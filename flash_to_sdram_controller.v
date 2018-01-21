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
// Major Functions:	Read image data form Flash then write into sdram
//
// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
//   Ver  :| Author            		:| Mod. Date :| Changes Made:
//   V1.0 :| Johnny Fan				:| 07/06/30  :| Initial Revision
// --------------------------------------------------------------------
module flash_to_sdram_controller(  
					iRST_n,
					iPHOTO_NUM,
					// Flash side
					iF_CLK,
					FL_DQ,			
					oFL_ADDR,		
					oFL_WE_N,		
					oFL_RST_n,		
					oFL_OE_N,		
					oFL_CE_N,		
					// Sdram side
					oSDRAM_WRITE_EN,
					oSDRAM_WRITE,
					oRED,	
					oGREEN,
					oBLUE,
					);
//============================================================================
// PARAMETER declarations
//============================================================================
parameter DISP_MODE = 800*480;
//===========================================================================
// PORT declarations
//===========================================================================
input 			iRST_n;					//  System reset
input	[3:0]	iPHOTO_NUM;				//  Picture status
input 			iF_CLK;					//  Flash read clcok
inout	[7:0]	FL_DQ;					//	FLASH Data bus 8 Bits
output	[22:0]	oFL_ADDR;				//	FLASH Address bus 23 Bits
output			oFL_WE_N;				//	FLASH Write Enable
output			oFL_RST_n;				//	FLASH Reset
output			oFL_OE_N;				//	FLASH Output Enable
output			oFL_CE_N;				//	FLASH Chip Enable
output  	  	oSDRAM_WRITE_EN;		//  SDRAM write enable control signal
output     		oSDRAM_WRITE;			//  SDRAM write signal
output 	[7:0] 	oRED;					//  Image red color data to sdram
output 	[7:0] 	oGREEN;					//  Image green color data to sdram
output 	[7:0] 	oBLUE;					//  Image blue color data to sdram	
//=============================================================================
// REG/WIRE declarations
//=============================================================================
reg 		  	oSDRAM_WRITE_EN;
reg        		oSDRAM_WRITE;
reg 	[1:0] 	flash_addr_cnt;
reg 	[7:0] 	fl_dq_delay1;
reg 	[7:0] 	fl_dq_delay2;
reg 	[7:0] 	fl_dq_delay3;
reg 	[18:0]	write_cnt ;		
reg		[7:0] 	oRED;	
reg		[7:0] 	oGREEN;
reg		[7:0] 	oBLUE;
reg     [22:0] 	flash_addr_o;
wire    [22:0] 	flash_addr_max;
wire    [22:0] 	flash_addr_min;
reg		[2:0] 	d1_photo_num;
reg		[2:0] 	d2_photo_num;
reg				photo_change;
reg				rgb_sync;
reg				mrgb_sync;
//=============================================================================
// Structural coding
//=============================================================================

assign 	oFL_WE_N  = 1;						
assign 	oFL_RST_n = 1;						
assign 	oFL_OE_N  = 0;						
assign 	oFL_CE_N  = 0;						
assign	oFL_ADDR  = flash_addr_o;
assign	flash_addr_max = 54 + 3*DISP_MODE * (d2_photo_num+1) ; //54(bmp file header)+ 3 x 800x480 (3 800x480 pictures) 
assign	flash_addr_min = 54 + 3*DISP_MODE * iPHOTO_NUM;

////////////////////////////////////////////////////


always@(posedge iF_CLK or negedge iRST_n)
	begin
		if (!iRST_n)
			begin
				d1_photo_num <= 0;
				d2_photo_num <= 0;
			end
		else
			begin		
				d1_photo_num <= iPHOTO_NUM;
                d2_photo_num <= d1_photo_num;
			end
    end           
// This is photo change detection
always@(posedge iF_CLK or negedge iRST_n)
	begin
		if (!iRST_n)
			photo_change <= 0;
		else if (d1_photo_num != iPHOTO_NUM)
			photo_change <= 1;	
		else
			photo_change <= 0;		
	end		
// If changing photo , flash_addr_min &   flash_addr_max  & flash_addr_owill chagne ,
// if flash_addr_o  < flash_addr_max , starting read flash data
always @(posedge iF_CLK or negedge iRST_n) 
	begin 
		if ( !iRST_n )	
			flash_addr_o <= flash_addr_min ;
		else if (photo_change)
			flash_addr_o <= flash_addr_min ;	
		else if ( flash_addr_o  <  flash_addr_max ) 
			flash_addr_o <= flash_addr_o + 1;
	end

/////////////////////// Sdram write enable control  ////////////////////////////
always@(posedge iF_CLK or negedge iRST_n)
	begin
		if (!iRST_n)	
			oSDRAM_WRITE_EN <= 0;
		else if ( (flash_addr_o  <  flash_addr_max-1)&&(write_cnt < DISP_MODE) )	
			begin
				oSDRAM_WRITE_EN <= 1;
			end
		else
			oSDRAM_WRITE_EN <= 0;		
	end			
/////////////////////// delay flash data  for aligning RGB data///////////////
always@(posedge iF_CLK or negedge iRST_n)
	begin
		if (!iRST_n)
			begin	
				fl_dq_delay1 <= 0;
				fl_dq_delay2 <= 0;
				fl_dq_delay3 <= 0;
			end	
		else
			begin
				fl_dq_delay1 <= FL_DQ;
				fl_dq_delay2 <= fl_dq_delay1;
				fl_dq_delay3 <= fl_dq_delay2;
			end	
	end			


always@(posedge iF_CLK or negedge iRST_n)
	begin
		if (!iRST_n)	
			flash_addr_cnt <= 0;
		else if ( flash_addr_o  <  flash_addr_max )
		begin
			if (flash_addr_cnt == 2)		
				flash_addr_cnt <= 0;
			else
				flash_addr_cnt <=flash_addr_cnt + 1;
		end			
		else
			flash_addr_cnt <= 0;
	end			

always@(posedge iF_CLK or negedge iRST_n)
	begin
		if (!iRST_n)
			begin
				write_cnt <= 0;
				mrgb_sync <= 0;
			end	
			else if (oSDRAM_WRITE_EN)
				begin
				if (flash_addr_cnt == 1)
				begin
					write_cnt <= write_cnt + 1;
					mrgb_sync <= 1;
				end
				else
					mrgb_sync <= 0;
			end

			else
			begin
				write_cnt <= 0;
				mrgb_sync <= 0;
			end	
	end


always@(posedge iF_CLK or negedge iRST_n)
	begin
		if (!iRST_n)
			rgb_sync <= 0;
		else
			rgb_sync <= mrgb_sync;	
	end

always@(posedge iF_CLK or negedge iRST_n)
	begin
		if (!iRST_n)
			begin
				oSDRAM_WRITE <= 0;	
				oRED <= 0; 
				oGREEN <= 0;
				oBLUE <= 0;
			end
		else if (rgb_sync)
			begin	
				oSDRAM_WRITE <= 1;
				oRED 	<= fl_dq_delay1; 
				oGREEN 	<= fl_dq_delay2;
				oBLUE 	<= fl_dq_delay3;				 
			end
		else
			begin	
				oSDRAM_WRITE <= 0;
				oRED 	<= 0; 
				oGREEN 	<= 0;
				oBLUE 	<= 0;				 
			end				
	end			


endmodule


