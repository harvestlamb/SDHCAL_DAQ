`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Science and Technology of China
// Engineer: Junbin Zhang
// 
// Create Date: 11/14/2016 10:34:45 AM
// Design Name: SDHCAL_DAQ2V0
// Module Name: FPGA_TOP
// Project Name: 
// Target Devices: XC7A100TFGG484
// Tool Versions: Vivado 2016.3
// Description: top level of the whole project
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FPGA_TOP(
    input Clk_40M,
    input rst_n,
    //----MICROROC PIN
    output SELECT, //select = 1,slowcontrol register; select = 0,read register
    output SR_RSTB,//Selected Register Reset
    output SR_CK,  //Selected Register Clock
    output SR_IN,  //Selected Register Input
    //input  SR_OUT, //Selected Register Output,Asic's daisy chain slow control output
    //---power pulsing-----//
    output PWR_ON_D,
    output PWR_ON_A,
    output PWR_ON_DAC,
    output PWR_ON_ADC,
    //-------DAQ Control------//
    output START_ACQ,
    output RESET_B,
    input  CHIPSATB,
    output START_READOUT1,
    output START_READOUT2,
    input END_READOUT1,
    input END_READOUT2,
    //----RAM readout------//
    input DOUT1B, 
    input DOUT2B,
    input TRANSMITON1B,
    input TRANSMITON2B,
    //----hold gen---------//
    input OUT_TRIG0B,
    input OUT_TRIG1B,
    input OUT_TRIG2B,
    input EXT_TRIGB,//external pin
    output HOLD,
    //--Trig gen---------------//
    output TRIG_EXT,
    output RAZ_CHNP,
    output RAZ_CHNN,
    output VAL_EVTP,
    output VAL_EVTN,
    output RST_COUNTERB,
    //---clk gen--------//
    output CK_40P,
    output CK_40N,
    output CK_5P,
    output CK_5N,
    //------cy7c68013A interface---//
    input usb_clkout, //48M input
    output usb_ifclk, //ifclk  output pin
    input usb_flaga,
    input usb_flagb,
    input usb_flagc,
    output usb_slcs,
    output usb_sloe,
    output usb_slwr,
    output usb_slrd,
    output usb_pktend,
    output [1:0] usb_fifoaddr,
    inout [15:0] usb_fd,
    //-----ADG804 interface----//
    output [1:0] ADG804_Addr,  //multiplexer
    //-----ADG819 interface---//
    output ADG819_Addr,  //multiplexer
    //------Test Point-----//
    output [3:0] TP,
    //----LED indicator---//   
    output [5:0] LED
    );
//----Clock management instantiation----//
    wire Clk;
    wire Clk_5M;
    wire IFCLK;
    wire reset_n;
    wire CLKGOOD;
    Clk_Management Clk_Gen
    (
        .CLK_40M(Clk_40M),
        .usb_clkout(usb_clkout),
        .rst_n(rst_n),
        .Clk(Clk),        //40M global clock
        .Clk_5M(Clk_5M),  //5M slow clock
        .IFCLK(IFCLK),    //IFCLK domain 48M
        .usb_ifclk(usb_ifclk),
        .reset_n(reset_n),//golbal reset
        .CLKGOOD(CLKGOOD)  //clock good indicator
    );
    assign LED[4] = !CLKGOOD;
    assign LED[5] = 1'b1;
//-----usb_command_interpreter instantiation---//
    wire in_from_usb_Ctr_rd_en;
    wire [15:0] in_from_usb_ControlWord;
    wire out_to_usb_Acq_Start_Stop;
    wire out_to_rst_usb_data_fifo;
    //Microroc 
    wire Microroc_sc_or_read;//
    wire Microroc_param_load;//
    wire [2:0] Microroc_param_asic_num;//
    wire [9:0] Microroc_param_DAC0_Vth;//
    wire [9:0] Microroc_param_DAC1_Vth;//
    wire [9:0] Microroc_param_DAC2_Vth;//
    wire [63:0] Microroc_param_Ctest;//
    wire [63:0] Microroc_param_Read_reg;//
    wire Microroc_powerpulsing_en;//
    wire Microroc_sel_readout_chn;//
    wire [1:0] Microroc_Trig_Coincid;//
    wire [4:0] Microroc_Hold_Delay;//
    wire Microroc_rst_cntb;//
    //wire Microroc_raz_en;//
    wire Microroc_Internal_or_External_raz_chn;//new add 20170308
    wire [1:0] Microroc_Internal_RAZ_Mode;//new add 20170309
    wire [1:0] Microroc_External_RAZ_Mode;//new add 20170309
    wire [3:0] Microroc_External_RAZ_Delay_Time;//new add 20170309
    wire Microroc_trig_en;//
    //wire [1:0] Microroc_raz_mode;//
    wire [7:0] Microroc_param_header;
    wire [15:0] Microroc_AcqStart_time;
    wire [1:0] Microroc_sw_hg;
    wire [1:0] Microroc_sw_lg;
    wire [255:0] Microroc_4Bit_DAC;
    wire Microroc_HG_or_LG_shaper_output;
    wire Microroc_OTAQ_en;
    wire Microroc_RS_or_Discri;
    wire Microroc_NOR64_or_Disc;
    usb_command_interpreter usb_control
    (
      .IFCLK(IFCLK),
      .clk(Clk),
      .reset_n(reset_n),
      .in_from_usb_Ctr_rd_en(in_from_usb_Ctr_rd_en),
      .in_from_usb_ControlWord(in_from_usb_ControlWord),
      .out_to_usb_Acq_Start_Stop(out_to_usb_Acq_Start_Stop),
      .out_to_rst_usb_data_fifo(out_to_rst_usb_data_fifo),
      //microroc
      .Microroc_sc_or_read(Microroc_sc_or_read),
      .Microroc_param_load(Microroc_param_load),
      .Microroc_param_asic_num(Microroc_param_asic_num),
      .Microroc_param_DAC0_Vth(Microroc_param_DAC0_Vth),
      .Microroc_param_DAC1_Vth(Microroc_param_DAC1_Vth),
      .Microroc_param_DAC2_Vth(Microroc_param_DAC2_Vth),
      .Microroc_param_Ctest(Microroc_param_Ctest),
      .Microroc_param_Read_reg(Microroc_param_Read_reg),
      .Microroc_powerpulsing_en(Microroc_powerpulsing_en),
      .Microroc_sel_readout_chn(Microroc_sel_readout_chn),
      .Microroc_Trig_Coincid(Microroc_Trig_Coincid),
      .Microroc_Hold_Delay(Microroc_Hold_Delay),
      .Microroc_rst_cntb(Microroc_rst_cntb),
      //.Microroc_raz_en(Microroc_raz_en),      
      .Microroc_trig_en(Microroc_trig_en),
      //.Microroc_raz_mode(Microroc_raz_mode),
      .Microroc_param_header(Microroc_param_header),
      .Microroc_AcqStart_time(Microroc_AcqStart_time),
      .Microroc_sw_hg(Microroc_sw_hg),
      .Microroc_sw_lg(Microroc_sw_lg),
      .Microroc_4Bit_DAC(Microroc_4Bit_DAC),
      .Microroc_HG_or_LG_shaper_output(Microroc_HG_or_LG_shaper_output),
      .Microroc_OTAQ_en(Microroc_OTAQ_en),
      //.TP(TP[1:0]),
      .ADG804_Addr(ADG804_Addr), 
      .ADG819_Addr(ADG819_Addr),
      .TP(),
      //new add by wyu 20170308
      .Microroc_Internal_or_External_raz_chn(Microroc_Internal_or_External_raz_chn),
      .Microroc_Internal_RAZ_Mode(Microroc_Internal_RAZ_Mode),
      .Microroc_External_RAZ_Mode(Microroc_External_RAZ_Mode),
      .Microroc_External_RAZ_Delay_Time(Microroc_External_RAZ_Delay_Time),
      //.Microroc_Internal_raz_chn_en(Microroc_Internal_raz_chn_en),
      .Microroc_RS_or_Discri(Microroc_RS_or_Discri),
      .Microroc_NOR64_or_Disc(Microroc_NOR64_or_Disc),
      //new add 20170308 done
      .LED(LED[3:0])
    );    
    /*-----------USB2.0 instantiation------------*/
    wire [15:0] in_from_ext_fifo_dout;
    wire in_from_ext_fifo_empty;
    wire out_to_ext_fifo_rd_en;
    usb_synchronous_slavefifo usb_cy7c68013A
    (
      .IFCLK(IFCLK),
      .FLAGA(usb_flaga),
      .FLAGB(usb_flagb),
      .FLAGC(usb_flagc),
      .nSLCS(usb_slcs),
      .nSLOE(usb_sloe),
      .nSLRD(usb_slrd),
      .nSLWR(usb_slwr),
      .nPKTEND(usb_pktend),
      .FIFOADR(usb_fifoaddr),
      .FD_BUS(usb_fd),  
      .Acq_Start_Stop(out_to_usb_Acq_Start_Stop),
      .Ctr_rd_en(in_from_usb_Ctr_rd_en),              //fifo interface
      .ControlWord(in_from_usb_ControlWord),          //fifo interface
      .in_from_ext_fifo_dout(in_from_ext_fifo_dout),  //fifo interface
      .in_from_ext_fifo_empty(in_from_ext_fifo_empty),//fifo interface
      .out_to_ext_fifo_rd_en(out_to_ext_fifo_rd_en)   //fifo interface
    );
    //------Microroc_top instantiation--------------//
    wire usb_data_fifo_wr_en;
    wire usb_data_fifo_wr_full;
    wire [15:0] usb_data_fifo_wr_din;
    wire Config_Done;
    //Test Port
    wire Start_Readout_t;
    Microroc_top Microroc_u1
    (
      .Clk(Clk),
      .Clk_5M(Clk_5M),
      .reset_n(reset_n),
      //--------Microroc slow control registers interaface----------//
      .sc_or_read(Microroc_sc_or_read),      //slow control or read? 1 => read register
      .start_load(Microroc_param_load),      //start load parameters
      .asic_num(Microroc_param_asic_num),    //how many asics?
      //-----parameters-------//
      .En_dout(2'b11),               //enable dout1b and dout2b
      .En_transmiton(2'b11),         //enable transmiton1b and transmiton2b
      .En_chipsatb(1'b1),            //enable chipsatb
      .Sel_startreadout(Microroc_sel_readout_chn),       //select startreadout 1 or 2; 1-->1, 0-->2  //Controled by USB
      .Sel_endreadout(Microroc_sel_readout_chn),         //select endreadout 1 or 2;  1 -->1, 0-->2
      .Sel_raz(Microroc_Internal_RAZ_Mode),               //external raz_chn width '11' -->1us '10' -->250ns '01'-->500ns '00'-->75ns
                                                //Modefied by wyu 20170303,
                                                //the raz_chn width should be
                                                //set in the SC param
      .Ck_mux(1'b1),                 //bypass synchronous powerondigital
      .Sc_on(1'b0),                  //enable clocks LVDS Receriver power pulsing ------?
      .Raz_chn_ext_validation(~Microroc_Internal_or_External_raz_chn), // Modefied by wyu 20170308, this parameter should be set by usb
      .Raz_chn_int_validation(Microroc_Internal_or_External_raz_chn), // Modefied by wyu 20170308, this parameter should be set by usb
      .Trig_ext_validation(1'b1),    //enable external trigger signal
      .Disc_or_or(Microroc_NOR64_or_Disc),             //select channel trigger selected by read register(0) or Nor64 output(1)// Modefied by wyu 20170308, this parameter should be set by usb
      .En_trig_out(1'b1),            //Enable trigger out
      .Trigb(3'b111),                //trigger
      .DAC2_Vth(Microroc_param_DAC2_Vth),  //10-bit triple DAC voltage threshold
      .DAC1_Vth(Microroc_param_DAC1_Vth),  //10-bit triple DAC voltage threshold
      .DAC0_Vth(Microroc_param_DAC0_Vth),  //10-bit triple DAC voltage threshold
      .En_dac(1'b1),                 //enable dac
      .En_dac_pp(1'b1),              //enable dac for power pulsing
      .En_bg(1'b1),                  //enable bandgap
      .En_bg_pp(1'b1),               //enable bandgap for powerpulsing
      .header(Microroc_param_header),                //header
      .Chn_discri_mask({192{1'b1}}), //no channel discriminators mask
      .Rs_or_discri(Microroc_RS_or_Discri),           //select latched or directly output // Modefied by wyu 20170308, this parameter should be set by usb
      .En_discri1_pp(1'b1),          //enable disc1 powerpulsing if disc0 enabled  /enable
      .En_discri2_pp(1'b1),          //enable disc2 powerpulsing if disc0 enabled  /enable
      .En_discri0_pp(1'b1),          //enable disc0 powerpulsing  /enable
      .En_otaq_pp(1'b1),             //enable otaq for power pulsing
      .En_otaq(Microroc_OTAQ_en),                //enable selected charge outputs
      .En_dac4bit_pp(1'b1),          //enable 4-bit DAC for powerpulsing  /enable
      .Chn_adjust(Microroc_4Bit_DAC),           //4-bit DAC adjustment per channel-----?
      .Sw_hg(Microroc_sw_hg),                 //switch high gain shaper
      .Va_shlg_read(Microroc_HG_or_LG_shaper_output),           //valid low gain shaper for read 1-->on
      .En_widlar_pp(1'b1),           //enable widlar for power pulsing, --> off //I don't know what is widlar, modefy it for test
      .Sw_lg(Microroc_sw_lg),                 //swich low gain shaper
      .En_shlg_pp(1'b1),             //enable shaper low gain power pulsing  /enable
      .En_shhg_pp(1'b1),             //enable shaper high gain power pulsing  /enable
      .En_gbst(1'b1),                //enable gain boost
      .En_Preamp_pp(1'b1),           //enable preamplifier power pulsing /enable
      .Ctest(Microroc_param_Ctest),  //enable test capacitor from chn 0-63
      //--64bit read register-//
      .Read_reg(Microroc_param_Read_reg), //read register
      //-----Redundancy interface---------//
      .PowPulsing_En(Microroc_powerpulsing_en),//1 enable, 0 disable
      .Sel_Readout_chn(Microroc_sel_readout_chn),//1 chn1, 0 chn2
      //------start_acq------------//
      .Acq_start(out_to_usb_Acq_Start_Stop), //level or a pulse?
      .AcqStart_time(Microroc_AcqStart_time),//Acquisition time, get it from USB, the default value is 8
      //------Hold gen interface-----//
      .Trig_Coincid(Microroc_Trig_Coincid),//2bit
      .Hold_delay(Microroc_Hold_Delay),//5bit //hold delay,maxium 800ns
      //------fifo interface-----//
      .ext_fifo_full(usb_data_fifo_wr_full),
      .parallel_data(usb_data_fifo_wr_din),//16bit
      .parallel_data_en(usb_data_fifo_wr_en),
      //--------Trig_Gen interface---//
      .rst_cntb(Microroc_rst_cntb),
      .Raz_en(~Microroc_Internal_or_External_raz_chn),//modefied by wyu 20170309
      .Trig_en(Microroc_trig_en),
      .Raz_mode(Microroc_External_RAZ_Mode),//2bit//modefied by wyu 20170309
      .External_RAZ_Delay_Time(Microroc_External_RAZ_Delay_Time),//new added by wyu 20170309
      .Config_Done(Config_Done),
      /*---Slow control and ReadReg---*/
      .SELECT(SELECT), //select = 1,slowcontrol register; select = 0,read register
      .SR_RSTB(SR_RSTB),//Selected Register Reset
      .SR_CK(SR_CK),  //Selected Register Clock
      .SR_IN(SR_IN),  //Selected Register Input
      //.SR_OUT(SR_OUT), //Selected Register Output,Asic's daisy chain slow control output
      //---power pulsing-----//
      .PWR_ON_D(PWR_ON_D),
      .PWR_ON_A(PWR_ON_A),
      .PWR_ON_DAC(PWR_ON_DAC),
      .PWR_ON_ADC(PWR_ON_ADC),
      //-------DAQ Control------//
      .START_ACQ(START_ACQ),
      .RESET_B(RESET_B),
      .CHIPSATB(CHIPSATB),
      .START_READOUT1(START_READOUT1),
      .START_READOUT2(START_READOUT2),
      .END_READOUT1(END_READOUT1),
      .END_READOUT2(END_READOUT2),
      //----RAM readout------//
      .DOUT1B(DOUT1B), 
      .DOUT2B(DOUT2B),
      .TRANSMITON1B(TRANSMITON1B),
      .TRANSMITON2B(TRANSMITON2B),
      //----hold gen---------//
      .OUT_TRIG0B(OUT_TRIG0B),
      .OUT_TRIG1B(OUT_TRIG1B),
      .OUT_TRIG2B(OUT_TRIG2B),
      .EXT_TRIGB(EXT_TRIGB),//external pin
      .HOLD(HOLD),
      //--Trig gen---------------//
      .TRIG_EXT(TRIG_EXT),
      .RAZ_CHNP(RAZ_CHNP),
      .RAZ_CHNN(RAZ_CHNN),
      .VAL_EVTP(VAL_EVTP),
      .VAL_EVTN(VAL_EVTN),
      .RST_COUNTERB(RST_COUNTERB),
      //---clk gen--------//
      .CK_40P(CK_40P),
      .CK_40N(CK_40N),
      .CK_5P(CK_5P),
      .CK_5N(CK_5N),
      .Start_Readout_t(Start_Readout_t)
    );
    /*------------usb data fifo instantiation-------*/ 
    //per ASIC 1270 depth x 16bit, 4 ASIC 5080 depth
    usb_data_fifo usb_data_fifo_8192depth 
    (
      .rst(out_to_rst_usb_data_fifo || !reset_n), // input rst
      .wr_clk(Clk),  // input wr_clk -----new
      .wr_en(usb_data_fifo_wr_en),    // input wr_en  -----new
      .din(usb_data_fifo_wr_din),     // input [15 : 0] din  --new
      .full(usb_data_fifo_wr_full),   // output full     ----new

      .rd_clk(~IFCLK),                 // input rd_clk
      .rd_en(out_to_ext_fifo_rd_en),  // input rd_en
      .dout(in_from_ext_fifo_dout),   // output [15 : 0] dout
      .empty(in_from_ext_fifo_empty)  // output empty
    );
//assignmeng
assign TP[3] = START_ACQ;
assign TP[2] = Start_Readout_t;
assign TP[1] = TRANSMITON1B&TRANSMITON2B;
assign TP[0] = DOUT1B&DOUT2B;
//debug
/*
(*mark_debug = "true"*)wire START_ACQ_PIN;
(*mark_debug = "true"*)wire RESET_B_PIN;
(*mark_debug = "true"*)wire CHIPSATB_PIN;
(*mark_debug = "true"*)wire START_READOUT1_PIN;
(*mark_debug = "true"*)wire END_READOUT1_PIN;
(*mark_debug = "true"*)wire TRANSMITON1B_PIN;
(*mark_debug = "true"*)wire DOUT1B_PIN;
(*mark_debug = "true"*)wire PWR_ON_D_PIN;
(*mark_debug = "true"*)wire PWR_ON_A_PIN;
(*mark_debug = "true"*)wire PWR_ON_DAC_PIN;
assign START_ACQ_PIN = START_ACQ;
assign RESET_B_PIN = RESET_B;
assign CHIPSATB_PIN = CHIPSATB;
assign START_READOUT1_PIN = START_READOUT1;
assign END_READOUT1_PIN = END_READOUT1;
assign TRANSMITON1B_PIN = TRANSMITON1B;
assign DOUT1B_PIN = DOUT1B;
assign PWR_ON_D_PIN = PWR_ON_D;
assign PWR_ON_A_PIN = PWR_ON_A;
assign PWR_ON_DAC_PIN = PWR_ON_DAC;*/
endmodule
