create_clock -period 25.000 -name Clk_40M -waveform {0.000 12.500} [get_ports Clk_40M]
set_input_delay -clock [get_clocks Clk_40M] -min -add_delay 12.000 [get_ports rst_n]
set_input_delay -clock [get_clocks Clk_40M] -max -add_delay 18.000 [get_ports rst_n]
# Write Bits stream constraints
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
#4bit SPI Flash constraints, that generate 4-bit bitstream
set_property BITSTREAM.GENERAL.COMPRESS true [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE Yes [current_design]
#Pin location constraints
set_property PACKAGE_PIN Y11 [get_ports Clk_40M]
set_property IOSTANDARD LVCMOS33 [get_ports Clk_40M]
set_property PACKAGE_PIN N13 [get_ports rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]
set_property IOSTANDARD LVCMOS25 [get_ports {LED[0]}]
set_property PACKAGE_PIN W7 [get_ports {LED[0]}]
set_property PACKAGE_PIN U6 [get_ports {LED[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED[1]}]
set_property PACKAGE_PIN V5 [get_ports {LED[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED[2]}]
set_property PACKAGE_PIN Y8 [get_ports {LED[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED[3]}]
set_property PACKAGE_PIN U7 [get_ports {LED[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED[4]}]
set_property PACKAGE_PIN Y9 [get_ports {LED[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED[5]}]


set_property PACKAGE_PIN K18 [get_ports CK_5P]
set_property IOSTANDARD LVDS_25 [get_ports CK_5P]
set_property IOSTANDARD LVDS_25 [get_ports CK_5N]
set_property PACKAGE_PIN K21 [get_ports CK_40P]
set_property IOSTANDARD LVDS_25 [get_ports CK_40N]
set_property IOSTANDARD LVDS_25 [get_ports CK_40P]
set_property PACKAGE_PIN H4 [get_ports usb_clkout]
set_property IOSTANDARD LVCMOS33 [get_ports usb_clkout]
set_property PACKAGE_PIN K3 [get_ports usb_ifclk]
set_property IOSTANDARD LVCMOS33 [get_ports usb_ifclk]
set_property PACKAGE_PIN F3 [get_ports {usb_fd[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[15]}]
set_property PACKAGE_PIN E3 [get_ports {usb_fd[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[14]}]
set_property PACKAGE_PIN C2 [get_ports {usb_fd[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[13]}]
set_property PACKAGE_PIN D2 [get_ports {usb_fd[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[12]}]
set_property PACKAGE_PIN D1 [get_ports {usb_fd[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[11]}]
set_property PACKAGE_PIN E2 [get_ports {usb_fd[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[10]}]
set_property PACKAGE_PIN E1 [get_ports {usb_fd[9]}]
set_property PACKAGE_PIN F1 [get_ports {usb_fd[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[8]}]
set_property PACKAGE_PIN M1 [get_ports {usb_fd[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[7]}]
set_property PACKAGE_PIN N2 [get_ports {usb_fd[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[6]}]
set_property PACKAGE_PIN P1 [get_ports {usb_fd[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[5]}]
set_property PACKAGE_PIN R1 [get_ports {usb_fd[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[4]}]
set_property PACKAGE_PIN P4 [get_ports {usb_fd[3]}]
set_property PACKAGE_PIN P2 [get_ports {usb_fd[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[2]}]
set_property PACKAGE_PIN M3 [get_ports {usb_fd[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[1]}]
set_property PACKAGE_PIN L3 [get_ports {usb_fd[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_fd[0]}]
set_property PACKAGE_PIN J2 [get_ports {usb_fifoaddr[1]}]
set_property PACKAGE_PIN J1 [get_ports {usb_fifoaddr[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_fifoaddr[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_fifoaddr[0]}]
set_property PACKAGE_PIN Y21 [get_ports CHIPSATB]
set_property IOSTANDARD LVCMOS33 [get_ports CHIPSATB]
set_property PACKAGE_PIN U18 [get_ports DOUT1B]
set_property IOSTANDARD LVCMOS33 [get_ports DOUT1B]
set_property PACKAGE_PIN W17 [get_ports DOUT2B]
set_property IOSTANDARD LVCMOS33 [get_ports DOUT2B]
set_property PACKAGE_PIN AB21 [get_ports END_READOUT1]
set_property IOSTANDARD LVCMOS33 [get_ports END_READOUT1]
set_property PACKAGE_PIN W11 [get_ports END_READOUT2]
set_property IOSTANDARD LVCMOS33 [get_ports END_READOUT2]
set_property PACKAGE_PIN AA21 [get_ports HOLD]
set_property IOSTANDARD LVCMOS33 [get_ports HOLD]
set_property IOSTANDARD LVCMOS33 [get_ports OUT_TRIG0B]
set_property PACKAGE_PIN T18 [get_ports OUT_TRIG0B]
set_property PACKAGE_PIN T20 [get_ports OUT_TRIG1B]
set_property IOSTANDARD LVCMOS33 [get_ports OUT_TRIG1B]
set_property PACKAGE_PIN W16 [get_ports OUT_TRIG2B]
set_property IOSTANDARD LVCMOS33 [get_ports OUT_TRIG2B]
set_property PACKAGE_PIN W22 [get_ports PWR_ON_A]
set_property IOSTANDARD LVCMOS33 [get_ports PWR_ON_A]
set_property PACKAGE_PIN U21 [get_ports PWR_ON_ADC]
set_property IOSTANDARD LVCMOS33 [get_ports PWR_ON_ADC]
set_property PACKAGE_PIN W21 [get_ports PWR_ON_D]
set_property IOSTANDARD LVCMOS33 [get_ports PWR_ON_D]
set_property PACKAGE_PIN U20 [get_ports PWR_ON_DAC]
set_property IOSTANDARD LVCMOS33 [get_ports PWR_ON_DAC]
set_property PACKAGE_PIN H17 [get_ports RAZ_CHNP]
set_property IOSTANDARD LVDS_25 [get_ports RAZ_CHNP]
set_property IOSTANDARD LVDS_25 [get_ports RAZ_CHNN]
set_property PACKAGE_PIN V20 [get_ports RESET_B]
set_property IOSTANDARD LVCMOS33 [get_ports RESET_B]
set_property PACKAGE_PIN Y19 [get_ports RST_COUNTERB]
set_property IOSTANDARD LVCMOS33 [get_ports RST_COUNTERB]
set_property PACKAGE_PIN V15 [get_ports SELECT]
set_property IOSTANDARD LVCMOS33 [get_ports SELECT]
set_property PACKAGE_PIN Y18 [get_ports SR_CK]
set_property IOSTANDARD LVCMOS33 [get_ports SR_CK]
set_property PACKAGE_PIN Y17 [get_ports SR_IN]
set_property IOSTANDARD LVCMOS33 [get_ports SR_IN]
set_property PACKAGE_PIN V14 [get_ports SR_RSTB]
set_property IOSTANDARD LVCMOS33 [get_ports SR_RSTB]
set_property PACKAGE_PIN Y22 [get_ports START_ACQ]
set_property IOSTANDARD LVCMOS33 [get_ports START_ACQ]
set_property PACKAGE_PIN W19 [get_ports START_READOUT1]
set_property IOSTANDARD LVCMOS33 [get_ports START_READOUT1]
set_property PACKAGE_PIN W14 [get_ports START_READOUT2]
set_property IOSTANDARD LVCMOS33 [get_ports START_READOUT2]
set_property PACKAGE_PIN V18 [get_ports TRANSMITON1B]
set_property IOSTANDARD LVCMOS33 [get_ports TRANSMITON1B]
set_property PACKAGE_PIN W20 [get_ports TRANSMITON2B]
set_property IOSTANDARD LVCMOS33 [get_ports TRANSMITON2B]
set_property PACKAGE_PIN W15 [get_ports TRIG_EXT]
set_property IOSTANDARD LVCMOS33 [get_ports TRIG_EXT]
set_property PACKAGE_PIN M2 [get_ports usb_flaga]
set_property IOSTANDARD LVCMOS33 [get_ports usb_flaga]
set_property PACKAGE_PIN L1 [get_ports usb_flagb]
set_property IOSTANDARD LVCMOS33 [get_ports usb_flagb]
set_property PACKAGE_PIN K1 [get_ports usb_flagc]
set_property IOSTANDARD LVCMOS33 [get_ports usb_flagc]
set_property PACKAGE_PIN G1 [get_ports usb_pktend]
set_property IOSTANDARD LVCMOS33 [get_ports usb_pktend]
set_property PACKAGE_PIN G2 [get_ports usb_slcs]
set_property IOSTANDARD LVCMOS33 [get_ports usb_slcs]
set_property PACKAGE_PIN K2 [get_ports usb_sloe]
set_property IOSTANDARD LVCMOS33 [get_ports usb_sloe]
set_property PACKAGE_PIN H3 [get_ports usb_slrd]
set_property IOSTANDARD LVCMOS33 [get_ports usb_slrd]
set_property PACKAGE_PIN H2 [get_ports usb_slwr]
set_property IOSTANDARD LVCMOS33 [get_ports usb_slwr]
set_property PACKAGE_PIN G15 [get_ports VAL_EVTP]
set_property IOSTANDARD LVDS_25 [get_ports VAL_EVTP]
set_property IOSTANDARD LVDS_25 [get_ports VAL_EVTN]
set_property IOSTANDARD LVCMOS33 [get_ports EXT_TRIGB]
set_property ASYNC_REG true [get_cells usb_cy7c68013A/Acq_Start_Stop_sync1_reg]
set_property ASYNC_REG true [get_cells usb_cy7c68013A/Acq_Start_Stop_sync2_reg]
create_clock -period 20.833 -name usb_clkout -waveform {0.000 10.417} [get_ports usb_clkout]
#set_input_delay -clock [get_clocks usb_clkout] -min -add_delay 10.000 [get_ports {usb_fd[*]}]
#set_input_delay -clock [get_clocks usb_clkout] -max -add_delay 15.000 [get_ports {usb_fd[*]}]
set_input_delay -clock [get_clocks Clk_40M] -min -add_delay 12.000 [get_ports CHIPSATB]
set_input_delay -clock [get_clocks Clk_40M] -max -add_delay 18.000 [get_ports CHIPSATB]
set_input_delay -clock [get_clocks Clk_40M] -min -add_delay 12.000 [get_ports DOUT1B]
set_input_delay -clock [get_clocks Clk_40M] -max -add_delay 18.000 [get_ports DOUT1B]
set_input_delay -clock [get_clocks Clk_40M] -min -add_delay 12.000 [get_ports DOUT2B]
set_input_delay -clock [get_clocks Clk_40M] -max -add_delay 18.000 [get_ports DOUT2B]
set_input_delay -clock [get_clocks Clk_40M] -min -add_delay 12.000 [get_ports END_READOUT1]
set_input_delay -clock [get_clocks Clk_40M] -max -add_delay 18.000 [get_ports END_READOUT1]
set_input_delay -clock [get_clocks Clk_40M] -min -add_delay 12.000 [get_ports END_READOUT2]
set_input_delay -clock [get_clocks Clk_40M] -max -add_delay 18.000 [get_ports END_READOUT2]
set_input_delay -clock [get_clocks Clk_40M] -min -add_delay 12.000 [get_ports EXT_TRIGB]
set_input_delay -clock [get_clocks Clk_40M] -max -add_delay 18.000 [get_ports EXT_TRIGB]
set_input_delay -clock [get_clocks Clk_40M] -min -add_delay 12.000 [get_ports OUT_TRIG0B]
set_input_delay -clock [get_clocks Clk_40M] -max -add_delay 18.000 [get_ports OUT_TRIG0B]
set_input_delay -clock [get_clocks Clk_40M] -min -add_delay 12.000 [get_ports OUT_TRIG1B]
set_input_delay -clock [get_clocks Clk_40M] -max -add_delay 18.000 [get_ports OUT_TRIG1B]
set_input_delay -clock [get_clocks Clk_40M] -min -add_delay 12.000 [get_ports OUT_TRIG2B]
set_input_delay -clock [get_clocks Clk_40M] -max -add_delay 18.000 [get_ports OUT_TRIG2B]
set_input_delay -clock [get_clocks Clk_40M] -min -add_delay 12.000 [get_ports TRANSMITON1B]
set_input_delay -clock [get_clocks Clk_40M] -max -add_delay 18.000 [get_ports TRANSMITON1B]
set_input_delay -clock [get_clocks Clk_40M] -min -add_delay 12.000 [get_ports TRANSMITON2B]
set_input_delay -clock [get_clocks Clk_40M] -max -add_delay 18.000 [get_ports TRANSMITON2B]
set_input_delay -clock [get_clocks usb_clkout] -min -add_delay 10.000 [get_ports usb_flaga]
set_input_delay -clock [get_clocks usb_clkout] -max -add_delay 15.000 [get_ports usb_flaga]
set_input_delay -clock [get_clocks usb_clkout] -min -add_delay 10.000 [get_ports usb_flagb]
set_input_delay -clock [get_clocks usb_clkout] -max -add_delay 15.000 [get_ports usb_flagb]
set_input_delay -clock [get_clocks usb_clkout] -min -add_delay 10.000 [get_ports usb_flagc]
set_input_delay -clock [get_clocks usb_clkout] -max -add_delay 15.000 [get_ports usb_flagc]
create_clock -period 200.000 -name VIRTUAL_pll_5 -waveform {0.000 100.000}
set_output_delay -clock [get_clocks Clk_40M] -min -add_delay 2.000 [get_ports {LED[*]}]
set_output_delay -clock [get_clocks Clk_40M] -max -add_delay 12.000 [get_ports {LED[*]}]
#set_output_delay -clock [get_clocks usb_clkout] -min -add_delay 2.000 [get_ports {usb_fd[*]}]
#set_output_delay -clock [get_clocks usb_clkout] -max -add_delay 10.000 [get_ports {usb_fd[*]}]
set_output_delay -clock [get_clocks Clk_40M] -min -add_delay 2.000 [get_ports HOLD]
set_output_delay -clock [get_clocks Clk_40M] -max -add_delay 12.000 [get_ports HOLD]
set_output_delay -clock [get_clocks Clk_40M] -min -add_delay 2.000 [get_ports PWR_ON_A]
set_output_delay -clock [get_clocks Clk_40M] -max -add_delay 12.000 [get_ports PWR_ON_A]
set_output_delay -clock [get_clocks Clk_40M] -min -add_delay 2.000 [get_ports PWR_ON_ADC]
set_output_delay -clock [get_clocks Clk_40M] -max -add_delay 12.000 [get_ports PWR_ON_ADC]
set_output_delay -clock [get_clocks Clk_40M] -min -add_delay 2.000 [get_ports PWR_ON_D]
set_output_delay -clock [get_clocks Clk_40M] -max -add_delay 12.000 [get_ports PWR_ON_D]
set_output_delay -clock [get_clocks Clk_40M] -min -add_delay 2.000 [get_ports PWR_ON_DAC]
set_output_delay -clock [get_clocks Clk_40M] -max -add_delay 12.000 [get_ports PWR_ON_DAC]
set_output_delay -clock [get_clocks Clk_40M] -min -add_delay 2.000 [get_ports RAZ_CHNN]
set_output_delay -clock [get_clocks Clk_40M] -max -add_delay 12.000 [get_ports RAZ_CHNN]
set_output_delay -clock [get_clocks Clk_40M] -min -add_delay 2.000 [get_ports RAZ_CHNP]
set_output_delay -clock [get_clocks Clk_40M] -max -add_delay 12.000 [get_ports RAZ_CHNP]
set_output_delay -clock [get_clocks Clk_40M] -min -add_delay 2.000 [get_ports RESET_B]
set_output_delay -clock [get_clocks Clk_40M] -max -add_delay 12.000 [get_ports RESET_B]
set_output_delay -clock [get_clocks Clk_40M] -min -add_delay 2.000 [get_ports RST_COUNTERB]
set_output_delay -clock [get_clocks Clk_40M] -max -add_delay 12.000 [get_ports RST_COUNTERB]
set_output_delay -clock [get_clocks Clk_40M] -min -add_delay 2.000 [get_ports SELECT]
set_output_delay -clock [get_clocks Clk_40M] -max -add_delay 12.000 [get_ports SELECT]
set_output_delay -clock [get_clocks VIRTUAL_pll_5] -min -add_delay 6.000 [get_ports SR_CK]
set_output_delay -clock [get_clocks VIRTUAL_pll_5] -max -add_delay 100.000 [get_ports SR_CK]
set_output_delay -clock [get_clocks VIRTUAL_pll_5] -min -add_delay 6.000 [get_ports SR_IN]
set_output_delay -clock [get_clocks VIRTUAL_pll_5] -max -add_delay 100.000 [get_ports SR_IN]
set_output_delay -clock [get_clocks VIRTUAL_pll_5] -min -add_delay 6.000 [get_ports SR_RSTB]
set_output_delay -clock [get_clocks VIRTUAL_pll_5] -max -add_delay 100.000 [get_ports SR_RSTB]
set_output_delay -clock [get_clocks Clk_40M] -min -add_delay 2.000 [get_ports START_ACQ]
set_output_delay -clock [get_clocks Clk_40M] -max -add_delay 12.000 [get_ports START_ACQ]
set_output_delay -clock [get_clocks Clk_40M] -min -add_delay 2.000 [get_ports START_READOUT1]
set_output_delay -clock [get_clocks Clk_40M] -max -add_delay 12.000 [get_ports START_READOUT1]
set_output_delay -clock [get_clocks Clk_40M] -min -add_delay 2.000 [get_ports START_READOUT2]
set_output_delay -clock [get_clocks Clk_40M] -max -add_delay 12.000 [get_ports START_READOUT2]
set_output_delay -clock [get_clocks Clk_40M] -min -add_delay 2.000 [get_ports TRIG_EXT]
set_output_delay -clock [get_clocks Clk_40M] -max -add_delay 12.000 [get_ports TRIG_EXT]
set_output_delay -clock [get_clocks usb_clkout] -min -add_delay 2.000 [get_ports usb_pktend]
set_output_delay -clock [get_clocks usb_clkout] -max -add_delay 10.000 [get_ports usb_pktend]
set_output_delay -clock [get_clocks usb_clkout] -min -add_delay 2.000 [get_ports usb_sloe]
set_output_delay -clock [get_clocks usb_clkout] -max -add_delay 10.000 [get_ports usb_sloe]
set_output_delay -clock [get_clocks usb_clkout] -min -add_delay 2.000 [get_ports usb_slrd]
set_output_delay -clock [get_clocks usb_clkout] -max -add_delay 10.000 [get_ports usb_slrd]
set_output_delay -clock [get_clocks usb_clkout] -min -add_delay 2.000 [get_ports usb_slwr]
set_output_delay -clock [get_clocks usb_clkout] -max -add_delay 10.000 [get_ports usb_slwr]
set_false_path -from [get_clocks usb_clkout] -to [get_clocks pll_40]
set_clock_groups -asynchronous -group [get_clocks pll_40] -group [get_clocks usb_clkout]


set_property PACKAGE_PIN Y16 [get_ports {TP[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {TP[3]}]
set_property PACKAGE_PIN H19 [get_ports {TP[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {TP[2]}]
set_property PACKAGE_PIN G20 [get_ports {TP[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {TP[1]}]
set_property PACKAGE_PIN H20 [get_ports {TP[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {TP[0]}]
set_property PACKAGE_PIN P14 [get_ports EXT_TRIGB]





set_property PACKAGE_PIN Y14 [get_ports {ADG804_Addr[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ADG804_Addr[1]}]
set_property PACKAGE_PIN AB22 [get_ports {ADG804_Addr[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ADG804_Addr[0]}]
set_property PACKAGE_PIN AB20 [get_ports ADG819_Addr]
set_property IOSTANDARD LVCMOS33 [get_ports ADG819_Addr]

set_property PACKAGE_PIN N14 [get_ports CLK_EXT]
set_property IOSTANDARD LVCMOS33 [get_ports CLK_EXT]



set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_debug[10]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_debug[4]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_debug[3]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_debug[6]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_debug[9]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_debug[1]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_debug[7]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_debug[0]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_debug[8]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_debug[11]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_debug[12]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_debug[15]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_debug[14]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_debug[13]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_debug[2]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_debug[5]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_fifo_din_debug[0]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_fifo_din_debug[4]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_fifo_din_debug[9]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_fifo_din_debug[10]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_fifo_din_debug[1]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_fifo_din_debug[13]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_fifo_din_debug[14]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_fifo_din_debug[12]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_fifo_din_debug[15]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_fifo_din_debug[11]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_fifo_din_debug[3]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_fifo_din_debug[8]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_fifo_din_debug[6]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_fifo_din_debug[5]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_fifo_din_debug[7]}]
set_property MARK_DEBUG false [get_nets {Microroc_Control/Microroc_SCurveTest/SCurve_Data_fifo_din_debug[2]}]
