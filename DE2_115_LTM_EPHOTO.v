// --------------------------------------------------------------------
// Copyright (c) 2010 by Terasic Technologies Inc. 
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
// Major Functions:	DE2-115 LTM E-Photo
//
// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
//   Ver  :| Author            		:| Mod. Date :| Changes Made:
//   V1.0 :| Ben N. Huang			   :| 07/13/10  :| Initial Revision
//   V1.1 :| ben                    :| 11/03/14  :| Quartus 10.1 sp1
// --------------------------------------------------------------------

module DE2_115_LTM_EPHOTO(

	//////// CLOCK //////////
	CLOCK_50,
	CLOCK2_50,
	CLOCK3_50,

	//////// Sma //////////
	SMA_CLKIN,
	SMA_CLKOUT,

	//////// LED //////////
	LEDG,
	LEDR,

	//////// KEY //////////
	KEY,

	//////// EJTAG //////////
	EX_IO,

	//////// SW //////////
	SW,

	//////// SEG7 //////////
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,
	HEX6,
	HEX7,

	//////// LCD //////////
	LCD_BLON,
	LCD_DATA,
	LCD_EN,
	LCD_ON,
	LCD_RS,
	LCD_RW,

	//////// RS232 //////////
	UART_CTS,
	UART_RTS,
	UART_RXD,
	UART_TXD,

	//////// PS2 for Keyboard and Mouse //////////
	PS2_CLK,
	PS2_CLK2,
	PS2_DAT,
	PS2_DAT2,

	//////// SDCARD //////////
	SD_CLK,
	SD_CMD,
	SD_DAT,
	SD_WP_N,

	//////// VGA //////////
	VGA_B,
	VGA_BLANK_N,
	VGA_CLK,
	VGA_G,
	VGA_HS,
	VGA_R,
	VGA_SYNC_N,
	VGA_VS,

	//////// Audio //////////
	AUD_ADCDAT,
	AUD_ADCLRCK,
	AUD_BCLK,
	AUD_DACDAT,
	AUD_DACLRCK,
	AUD_XCK,

	//////// I2C for EEPROM //////////
	EEP_I2C_SCLK,
	EEP_I2C_SDAT,

	//////// I2C for Audio Tv-Decoder  //////////
	I2C_SCLK,
	I2C_SDAT,

	//////// Ethernet 0 //////////
	ENET0_GTX_CLK,
	ENET0_INT_N,
	ENET0_LINK100,
	ENET0_MDC,
	ENET0_MDIO,
	ENET0_RST_N,
	ENET0_RX_CLK,
	ENET0_RX_COL,
	ENET0_RX_CRS,
	ENET0_RX_DATA,
	ENET0_RX_DV,
	ENET0_RX_ER,
	ENET0_TX_CLK,
	ENET0_TX_DATA,
	ENET0_TX_EN,
	ENET0_TX_ER,
	ENETCLK_25,

	//////// Ethernet 1 //////////
	ENET1_GTX_CLK,
	ENET1_INT_N,
	ENET1_LINK100,
	ENET1_MDC,
	ENET1_MDIO,
	ENET1_RST_N,
	ENET1_RX_CLK,
	ENET1_RX_COL,
	ENET1_RX_CRS,
	ENET1_RX_DATA,
	ENET1_RX_DV,
	ENET1_RX_ER,
	ENET1_TX_CLK,
	ENET1_TX_DATA,
	ENET1_TX_EN,
	ENET1_TX_ER,

	//////// TV Decoder //////////
	TD_CLK27,
	TD_DATA,
	TD_HS,
	TD_RESET_N,
	TD_VS,

	//////// USB 2.0 OTG //////////
	OTG_ADDR,
	OTG_CS_N,
	OTG_DACK_N,
	OTG_DATA,
	OTG_DREQ,
	OTG_FSPEED,
	OTG_INT,
	OTG_LSPEED,
	OTG_RD_N,
	OTG_RST_N,
	OTG_WE_N,

	//////// IR Receiver //////////
	IRDA_RXD,

	//////// SDRAM //////////
	DRAM_ADDR,
	DRAM_BA,
	DRAM_CAS_N,
	DRAM_CKE,
	DRAM_CLK,
	DRAM_CS_N,
	DRAM_DQ,
	DRAM_DQM,
	DRAM_RAS_N,
	DRAM_WE_N,

	//////// SRAM //////////
	SRAM_ADDR,
	SRAM_CE_N,
	SRAM_DQ,
	SRAM_LB_N,
	SRAM_OE_N,
	SRAM_UB_N,
	SRAM_WE_N,

	//////// Flash //////////
	FL_ADDR,
	FL_CE_N,
	FL_DQ,
	FL_OE_N,
	FL_RST_N,
	FL_RY,
	FL_WE_N,
	FL_WP_N,

	//////// GPIO //////////
	LTM_ADC_BUSY,
	LTM_ADC_DCLK,
	LTM_ADC_DIN,
	LTM_ADC_DOUT,
	LTM_ADC_PENIRQ_n,
	LTM_B,
	LTM_DEN,
	LTM_G,
	LTM_GREST,
	LTM_HD,
	LTM_NCLK,
	LTM_R,
	LTM_SCEN,
	LTM_SDA,
	LTM_VD 
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input		          		CLOCK_50;
input		          		CLOCK2_50;
input		          		CLOCK3_50;

//////////// Sma //////////
input		          		SMA_CLKIN;
output		          	SMA_CLKOUT;

//////////// LED //////////
output		    [8:0]	LEDG;
output		    [17:0]	LEDR;

//////////// KEY //////////
input		       [3:0]	KEY;

//////////// EJTAG //////////
inout		       [6:0]	EX_IO;

//////////// SW //////////
input		      [17:0]	SW;

//////////// SEG7 //////////
output		     [6:0]		HEX0;
output		     [6:0]		HEX1;
output		     [6:0]		HEX2;
output		     [6:0]		HEX3;
output		     [6:0]		HEX4;
output		     [6:0]		HEX5;
output		     [6:0]		HEX6;
output		     [6:0]		HEX7;

//////////// LCD //////////
output		          		LCD_BLON;
inout		     		[7:0]		LCD_DATA;
output		          		LCD_EN;
output		          		LCD_ON;
output		          		LCD_RS;
output		          		LCD_RW;

//////////// RS232 //////////
output		          		UART_CTS;
input		          			UART_RTS;
input		          			UART_RXD;
output		          		UART_TXD;

//////////// PS2 for Keyboard and Mouse //////////
inout		          			PS2_CLK;
inout		          			PS2_CLK2;
inout		          			PS2_DAT;
inout		          			PS2_DAT2;

//////////// SDCARD //////////
output		          		SD_CLK;
inout		          			SD_CMD;
inout		     		[3:0]		SD_DAT;
input		          			SD_WP_N;

//////////// VGA //////////
output		     [7:0]		VGA_B;
output		          		VGA_BLANK_N;
output		          		VGA_CLK;
output		     [7:0]		VGA_G;
output		          		VGA_HS;
output		     [7:0]		VGA_R;
output		          		VGA_SYNC_N;
output		          		VGA_VS;

//////////// Audio //////////
input		          			AUD_ADCDAT;
inout		          			AUD_ADCLRCK;
inout		          			AUD_BCLK;
output		          		AUD_DACDAT;
inout		          			AUD_DACLRCK;
output		          		AUD_XCK;

//////////// I2C for EEPROM //////////
output		          		EEP_I2C_SCLK;
inout		          			EEP_I2C_SDAT;

//////////// I2C for Audio Tv-Decoder  //////////
output		          		I2C_SCLK;
inout		          			I2C_SDAT;

//////////// Ethernet 0 //////////
output		          		ENET0_GTX_CLK;
input		          			ENET0_INT_N;
input		          			ENET0_LINK100;
output		          		ENET0_MDC;
inout		          			ENET0_MDIO;
output		          		ENET0_RST_N;
input		          			ENET0_RX_CLK;
input		          			ENET0_RX_COL;
input		          			ENET0_RX_CRS;
input		     		[3:0]		ENET0_RX_DATA;
input		          			ENET0_RX_DV;
input		          			ENET0_RX_ER;
input		          			ENET0_TX_CLK;
output		     	[3:0]		ENET0_TX_DATA;
output		          		ENET0_TX_EN;
output		          		ENET0_TX_ER;
input		          			ENETCLK_25;

//////////// Ethernet 1 //////////
output		          		ENET1_GTX_CLK;
input		          			ENET1_INT_N;
input		          			ENET1_LINK100;
output		          		ENET1_MDC;
inout		          			ENET1_MDIO;
output		          		ENET1_RST_N;
input		          			ENET1_RX_CLK;
input		          			ENET1_RX_COL;
input		          			ENET1_RX_CRS;
input		     		[3:0]		ENET1_RX_DATA;
input		          			ENET1_RX_DV;
input		          			ENET1_RX_ER;
input		          			ENET1_TX_CLK;
output		     	[3:0]		ENET1_TX_DATA;
output		          		ENET1_TX_EN;
output		          		ENET1_TX_ER;

//////////// TV Decoder //////////
input		          		TD_CLK27;
input		     [7:0]		TD_DATA;
input		          		TD_HS;
output		          		TD_RESET_N;
input		          		TD_VS;

//////////// USB 2.0 OTG //////////
output		     [1:0]		OTG_ADDR;
output		          		OTG_CS_N;
output		     [1:0]		OTG_DACK_N;
inout		    [15:0]		OTG_DATA;
input		     [1:0]		OTG_DREQ;
inout		          		OTG_FSPEED;
input		     [1:0]		OTG_INT;
inout		          		OTG_LSPEED;
output		          		OTG_RD_N;
output		          		OTG_RST_N;
output		          		OTG_WE_N;

//////////// IR Receiver //////////
input		          		IRDA_RXD;

//////////// SDRAM //////////
output		    [12:0]		DRAM_ADDR;
output		     [1:0]		DRAM_BA;
output		          		DRAM_CAS_N;
output		          		DRAM_CKE;
output		          		DRAM_CLK;
output		          		DRAM_CS_N;
inout		    [31:0]		DRAM_DQ;
output		     [3:0]		DRAM_DQM;
output		          		DRAM_RAS_N;
output		          		DRAM_WE_N;

//////////// SRAM //////////
output		    [19:0]		SRAM_ADDR;
output		          		SRAM_CE_N;
inout		    [15:0]		SRAM_DQ;
output		          		SRAM_LB_N;
output		          		SRAM_OE_N;
output		          		SRAM_UB_N;
output		          		SRAM_WE_N;

//////////// Flash //////////
output		    [22:0]		FL_ADDR;
output		          		FL_CE_N;
inout		     [7:0]		FL_DQ;
output		          		FL_OE_N;
output		          		FL_RST_N;
input		          		FL_RY;
output		          		FL_WE_N;
output		          		FL_WP_N;

//////////// GPIO //////////
input		          		LTM_ADC_BUSY;
output		          		LTM_ADC_DCLK;
output		          		LTM_ADC_DIN;
input		          		LTM_ADC_DOUT;
input		          		LTM_ADC_PENIRQ_n;
output		     [7:0]		LTM_B;
output		          		LTM_DEN;
output		     [7:0]		LTM_G;
output		          		LTM_GREST;
output		          		LTM_HD;
output		          		LTM_NCLK;
output		     [7:0]		LTM_R;
output		          		LTM_SCEN;
inout		          		LTM_SDA;
output		          		LTM_VD;


//=======================================================
//  REG/WIRE declarations
//=======================================================

wire [11:0] index4096_x;
wire [11:0] index4096_y;
wire [3:0] index12_x;
wire [2:0] index8_y;
wire result_ready;
wire [3:0]s_x0;
wire [2:0]s_y0;
wire [3:0]e_x0;
wire [2:0]e_y0;
wire [3:0]s_x1;
wire [2:0]s_y1;
wire [3:0]e_x1;
wire [2:0]e_y1;
wire data_valid;
wire [3:0]RESULT;
wire [3:0]to_7decoder;
wire ready_2_show;
wire [7:0] arr_temp0;
wire [7:0] arr_temp1;
wire [7:0] arr_temp2;
wire [7:0] arr_temp3;
wire [7:0] arr_temp4;
wire [7:0] arr_temp5;
wire [7:0] arr_temp6;
wire [7:0] arr_temp7;
wire [7:0] arr_temp8;
wire [7:0] arr_temp9;
wire [7:0] arr_temp10;
wire [7:0] arr_temp11;
wire [3:0] ans_temp0;
wire [3:0] ans_temp10;
wire [3:0] ans_temp100;
wire [3:0] ans_temp1000;
wire ansrdy;
wire [3:0] num1[1:0];
wire [3:0] num2[1:0];
//=======================================================
//  Structural coding
//=======================================================
TUMOUR tumour(
	.i_clk(CLOCK_50),
	.i_rst(KEY[0]),
	.i_start(KEY[1]),
	.result_ready(result_ready),
	.result(RESULT),
	.old_x(index4096_x),
	.old_y(index4096_y),
	.new_x(index12_x),
	.new_y(index8_y),
	.startpointx0(s_x0),
	.startpointy0(s_y0),
	.startpointx1(s_x1),
	.startpointy1(s_y1),
	.endpointx0(e_x0),
	.endpointy0(e_y0),
	.endpointx1(e_x1),
	.endpointy1(e_y1),
	.arr0(arr_temp0),
	.arr1(arr_temp1),
	.arr2(arr_temp2),
	.arr3(arr_temp3),
	.arr4(arr_temp4),
	.arr5(arr_temp5),
	.arr6(arr_temp6),
	.arr7(arr_temp7),
	.arr8(arr_temp8),
	.arr9(arr_temp9),
	.arr10(arr_temp10),
	.arr11(arr_temp11),
	.pls_check(data_valid),
	.o_result(to_7decoder),
	.ready_to_show(ready_2_show)
);
/*SEVEN_TO_INT seven_to_int(
	.x_2(hijack3),
	.x_1(hijack2),
	.x_0(hijack1),
	.y_2(hijack6),
	.y_1(hijack5),
	.y_0(hijack4),
	.output_x(index4096_x),
	.output_y(index4096_y),
	.wierd_x(HEX2),
	.wierd_y(HEX6)
);*/

calculator(
	.i_clk(CLOCK_50),
	.i_rst(SW[4]),
	.numberrdy(result_ready),
	.changenumber(KEY[2]),
	.i_start(KEY[3]),
	.operation(SW[3:0]),
	.number(to_7decoder),
	.ans0(ans_temp0),
	.ans10(ans_temp10),
	.ans100(ans_temp100),
	.ans1000(ans_temp1000),
	.num1_0(num1[0]),
	.num1_1(num1[1]),
	.num2_0(num2[0]),
	.num2_1(num2[1]),
	.ansrdy(ansrdy)
);

INT_TO_SEVEN(
	.Show(ready_2_show),
	.input_x(index12_x),
	.input_y(index8_y),
	.fake_x_0(HEX0),
	.fake_x_1(HEX1),
	.fake_x_2(HEX4),
	.fake_x_3(HEX3),
	.fake_y_0(HEX2),
	.fake_y_1(HEX5),
	.fake_y_2(HEX6),
	.fake_y_3(HEX7),
	.ans0(ans_temp0),
	.ans10(ans_temp10),
	.ans100(ans_temp100),
	.ans1000(ans_temp1000),
	.ansrdy(ansrdy),
	.num1_0(num1[0]),
	.num1_1(num1[1]),
	.num2_0(num2[0]),
	.num2_1(num2[1]),
	.test_x(index4096_x),
	.test_y(index4096_y),
	.result(to_7decoder)
);
LTM_TOP ltm_top_ins(
       ///Global signals
       .CLOCK_50(CLOCK_50),
       .KEY(KEY[0]),
       ///LTM_GPIO port
       .LTM_ADC_BUSY(LTM_ADC_BUSY),
       .LTM_ADC_DCLK(LTM_ADC_DCLK),
       .LTM_ADC_DIN(LTM_ADC_DIN),
       .LTM_ADC_DOUT(LTM_ADC_DOUT),
       .LTM_ADC_PENIRQ_n(LTM_ADC_PENIRQ_n),
       .LTM_B(LTM_B),
       .LTM_DEN(LTM_DEN),
       .LTM_G(LTM_G),
       .LTM_GREST(LTM_GREST),
       .LTM_HD(LTM_HD),
       .LTM_NCLK(LTM_NCLK),
       .LTM_R(LTM_R),
       .LTM_SCEN(LTM_SCEN),
       .LTM_SDA(LTM_SDA),
       .LTM_VD(LTM_VD),
       ///7-segs
      /*.HEX0(hijack1),	
	   .HEX1(hijack2),
	   .HEX2(hijack3),
	   .HEX3(HEX3),
	   .HEX4(hijack4),
	   .HEX5(hijack5),
	   .HEX6(hijack6),
	   .HEX7(HEX7),*/
	   //sdram
	   .DRAM_ADDR(DRAM_ADDR),
	   .DRAM_BA(DRAM_BA),
	   .DRAM_CAS_N(DRAM_CAS_N),
	   .DRAM_CKE(DRAM_CKE),
	   .DRAM_CLK(DRAM_CLK),
	   .DRAM_CS_N(DRAM_CS_N),
	   .DRAM_DQ(DRAM_DQ),
	   .DRAM_DQM(DRAM_DQM),
	   .DRAM_RAS_N(DRAM_RAS_N),
	   .DRAM_WE_N(DRAM_WE_N),
	   //flash
	   .FL_ADDR(FL_ADDR),
	   .FL_CE_N(FL_CE_N),
	   .FL_DQ(FL_DQ),
	   .FL_OE_N(FL_OE_N),
	   .FL_RST_N(FL_RST_N),
	   .FL_RY(FL_RY),
	   .FL_WE_N(FL_WE_N),
	   .FL_WP_N(FL_WP_N),
		//to TUMOUR
		.hijack_x(index4096_y),
		.hijack_y(index4096_x),
		.arr0(arr_temp0),
		.arr1(arr_temp1),
		.arr2(arr_temp2),
		.arr3(arr_temp3),
		.arr4(arr_temp4),
		.arr5(arr_temp5),
		.arr6(arr_temp6),
		.arr7(arr_temp7),
		.arr8(arr_temp8),
		.arr9(arr_temp9),
		.arr10(arr_temp10),
		.arr11(arr_temp11)
       );
Recognition recognition(
//input
	.i_clk(CLOCK_50),
	.i_rst(KEY[0]),
	.new_x(index12_x),
	.new_y(index8_y),
	.read_data_valid(data_valid),
	.start_pointx0(s_x0),
	.start_pointy0(s_y0),
	.end_pointx0(e_x0),
	.end_pointy0(e_y0),
	.start_pointx1(s_x1),
	.start_pointy1(s_y1),
	.end_pointx1(e_x1),
	.end_pointy1(e_y1),
	.i_arr0(arr_temp0),
	.i_arr1(arr_temp1),
	.i_arr2(arr_temp2),
	.i_arr3(arr_temp3),
	.i_arr4(arr_temp4),
	.i_arr5(arr_temp5),
	.i_arr6(arr_temp6),
	.i_arr7(arr_temp7),
	.i_arr8(arr_temp8),
	.i_arr9(arr_temp9),
	.i_arr10(arr_temp10),
	.i_arr11(arr_temp11),
//output
	.ready(result_ready),
	.result(RESULT)
);

endmodule
