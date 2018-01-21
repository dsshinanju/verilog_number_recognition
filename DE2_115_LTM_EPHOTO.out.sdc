## Generated SDC file "DE2_115_LTM_EPHOTO.out.sdc"

## Copyright (C) 1991-2011 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 10.1 Build 197 01/19/2011 Service Pack 1 SJ Full Version"

## DATE    "Thu Mar 03 13:58:57 2011"

##
## DEVICE  "EP4CE115F29C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {CLOCK_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK_50}]
create_clock -name {CLOCK2_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK2_50}]
create_clock -name {CLOCK3_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK3_50}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]} -source [get_pins {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 2 -master_clock {CLOCK_50} [get_pins {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}] 
create_generated_clock -name {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[1]} -source [get_pins {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 2 -phase -63.000 -master_clock {CLOCK_50} [get_pins {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[1]}] 
create_generated_clock -name {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]} -source [get_pins {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 2 -divide_by 3 -master_clock {CLOCK_50} [get_pins {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {CLOCK_50}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {CLOCK_50}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070 
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100 
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070 
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100 
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.070 
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.100 
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.070 
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.100 
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {CLOCK_50}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {CLOCK_50}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070 
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100 
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070 
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100 
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.070 
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.100 
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.070 
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.100 
set_clock_uncertainty -rise_from [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[0]}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {ltm_top_ins|u7|sdram_pll1|altpll_component|auto_generated|pll1|clk[2]}]  0.020 


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************

set_false_path -from [get_keepers {*rdptr_g*}] -to [get_keepers {*ws_dgrp|dffpipe_qe9:dffpipe19|dffe20a*}]
set_false_path -from [get_keepers {*delayed_wrptr_g*}] -to [get_keepers {*rs_dgwp|dffpipe_pe9:dffpipe16|dffe17a*}]


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

