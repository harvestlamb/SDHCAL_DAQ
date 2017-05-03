`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/21 16:57:59
// Design Name: 
// Module Name: SweepTest_Top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Controller_Top(
    input Clk,
    input reset_n,
    // Mode Select
    input [1:0] ModeSelect,
    input [1:0] DACSelect,
    // Microroc SC Parameter
    input [9:0] UsbMicroroc10BitDac0,
    input [9:0] UsbMicroroc10BitDac1,
    input [9:0] UsbMicroroc10BitDac2,
    output [9:0] OutMicroroc10BitDac0,
    output [9:0] OutMicroroc10BitDac1,
    output [9:0] OutMicroroc10BitDac2,
    input [191:0] UsbMicrorocChannelMask,
    output [191:0] OutMicrorocChannelMask,
    input [63:0] UsbMicrorocCTestChannel,
    output [63:0] OutMicrorocCTestChannel,
    input UsbMicrorocSCParameterLoad,
    output OutMicrorocSCParameterLoad,
    input UsbScOrReadreg,
    output MicrorocSCOrReadreg,
    input MicrorocConfigDone,
    // Microroc ACQ Control and Data
    output MicrorocAcqStartStop,
    input [15:0] MicrorocAcqData,
    input MicrorocAcqData_en,
    // USB Interface
    input nPKTEND,
    input UsbDataFifoFull,
    output [15:0] OutUsbExtFifoData,
    output OutUsbExtFifoData_en,
    output OutUsbStartStop,
    // Sweep Test Start Signal
    input NormalAcqStartStop,
    input SweepTestStartStop,
    // Sweep Test Done Signal
    output SweepTestDone,
    input DataTransmitDone,
    // The following ports is set for SweepACQ and SCurve Test
    input SweepStart,
    input StartDac,
    input EndDac,
    output SweepTestDone,
    input DataTransmitDone,
    // Sweep ACQ
    input [15:0] MaxPakageNumber,
    //SCurve Test
    input TrigEffiOrCountEffi,
    input [5:0] SingleTestChannel,
    input SingleOr64Chn,
    input CTestOrInput,
    input [15:0] CPT_MAX,
    input [15:0] CounterMax,
    output ForceExtRaz,
      // Pin
    input CLK_EXT,
    input out_trigger0b,
    input out_trigger1b,
    input out_trigger2b
    );
    // Switcher for ACQ, SweepACQ or SCurve Test
    wire [9:0] SCTest10BitDac;
    wire [9:0] SweepAcq10BitDac;
    // Channel Mask
    wire [191:0] SCTestChannelMask;
    // CTest Channel
    wire [63:0] SCTestMicrorocCTestChannel;
    // SC Parameter Load
    wire SCTestMicrorocSCParameterLoad;
    wire SweepAcqMicrorocSCParameterLoad;
    // Start and done signal
    wire SweepAcqStartStop;
    wire SCTestStartStop;
    wire SCTestDone;
    wire SweepAcqDone;
    // Usb Start Stop
    wire SweepTestUsbStartStop;
    // Microroc ACQ Start Stop
    wire SweepAcqMicrorocAcqStartStop;
    // Data
    wire [15:0] ParallelData;
    wire ParallelData_en;
    wire [15:0] SweepAcqData;
    wire SweepAcqData_en;
    wire [15:0] SCTestData;
    wire SCTestData_en;
    Switcher Switcher(
      // Mode Select
      .ModeSelect(ModeSelect),
      .DacSelect(DacSelect),
      // 10-bit DAC
      .UsbMicroroc10BitDac0(UsbMicroroc10BitDac0),
      .UsbMicroroc10BitDac1(UsbMicroroc10BitDac1),
      .UsbMicroroc10BitDac2(UsbMicroroc10BitDac2),
      .SCTest10BitDAC(SCTest10BitDac),
      .SweepACQ10BitDac(SweepAcq10BitDac),
      .OutMicroroc10BitDac0(OutMicroroc10BitDac0),
      .OutMicroroc10BitDac1(OutMicroroc10BitDac1),
      .OutMicroroc10BitDac2(OutMicroroc10BitDac2),
      // Channel and Discriminator Mask
      .UsbMicrorocChannelMask(UsbMicrorocChannelMask),
      .SCTestChannelMask(SCTestChannelMask),
      .OutMicrorocChannelMask(OutMicrorocChannelMask),
      // CTest Channel
      .UsbMicrorocCTestChannel(UsbMicrorocCTestChannel),
      .SCTestMicrorocCTestChannel(SCTestMicrorocCTestChannel),
      .OutMicrorocCTestChannel(OutMicrorocCTestChannel),
      // SC Parameters Load
      .UsbMicrorocSCParameterLoad(UsbMicrorocSCParameterLoad),
      .SCTestMicrorocSCParameterLoad(SCTestMicrorocSCparameterLoad),
      .SweepAcqMicrorocSCParameterLoad(SweepAcqSCParameterLoad),
      .OutMicrorocSCParameterLoad(OutMicrorocSCParameterLoad),
      // SC or readreg
      .UsbSCOrReadreg(UsbSCOrReadreg),
      .OutMicrorocSCOrReadreg(OutMicrorocSCOrReadreg),
      // Start Signal
      .UsbMicrorocAcqStartStop(NormalAcqStartStop),
      .UsbSweepTestStartStop(SweepTestStartStop),
      .OutSCTestStartStop(SCTestStartStop),
      .OutSweepAcqStartStop(SweepAcqStartStop),
      // Done Signal
      .SCTestDone(SCTestDone),
      .SweepAcqDone(SweepAcqDone),
      .SweepTestDone(SweepTestDone),
      // USB Start
      //.UsbMicreorocAcqStartStop(UsbMicrorocAcqStartStop),
      .SweepTestUsbStartStop(SweepTestUsbStartStop),
      .OutUsbStartStop(OutUsbStartStop),
      // Microroc ACQ Start
      .SweepAcqMicrorocACQStartStop(SweepAcqMicrorocAcqStartStop),
      .MicrorocAcqStartStop(MicrorocAcqStartStop),
      // USB Data
      .MicrorocAcqData(MicrorocAcqData),
      .MicrorocAcqData_en(MicrorocAcqData_en),
      .SweepAcqData(SweepAcqData),
      .SweepAcqData_en(SweepAcqData_en),
      .SCTestData(SCTestData),
      .SCTestData_en(SCTestData_en),
      .UsbFifoData(OutUsbExtFifoData),
      .UsbFifoData_en(OutUsbExtFifoData_en),
      .ParallelData(ParallelData),
      .ParallelData_en(ParallelData_en)
    );
    SweepACQ_Top SweepACQ(
      .Clk(Clk),
      .reset_n(reset_n),
      // ACQ Control
      .SweepStart(SweepAcqStartStop),
      .SingleACQStart(SweepAcqMicrorocAcqStartStop),
      .ACQDone(SweepAcqDone),
      // Sweep ACQ Parameters
      .StartDAC0(StartDac),
      .EndDAC0(EndDac),
      .MaxPackageNumber(MaxPackageNumber),
      // ACQ Data
      .ParallelData(ParallelData),
      .ParallelData_en(ParallelData_en),
      // SC Parameters
      .OutDAC0(SweepAcq10BitDac),
      .LoadSCParameters(SweepAcqSCParameterLoad),
      .MicrorocConfigDone(MicrorocConfigDone),
      // Data Out
      .SweepACQData(SweepAcqData),
      .SweepACQData_en(SweepAcqData_en)
    );
    SCurve_Test_Top Microroc_SCurveTest(
      .Clk(Clk),
      .Clk_5M(Clk_5M),
      .reset_n(reset_n),
      // Select Trig Efficiency or Counter Efficiency test
      .TrigEffi_or_CountEffi(TrigEffi_or_CountEffi),
      //--- Test parameters and control interface--from upper level ---
      .Test_Start(SCTest_Start_Stop),
      .SingleTest_Chn(SingleTest_Chn),
      .Single_or_64Chn(Single_or_64Chn),
      .Ctest_or_Input(CTest_or_Input),
      .CPT_MAX(CPT_MAX),
      .Counter_MAX(Counter_MAX),
      //--- USB Data FIFO Interface ---
      //.usb_data_fifo_full(),
      .usb_data_fifo_wr_en(SCTest_usb_data_fifo_wr_en),
      .usb_data_fifo_wr_din(SCTest_usb_data_fifo_wr_din),
      .usb_data_fifo_full(usb_data_fifo_wr_full),
      //--- Microroc Config Interface ---
      .Microroc_Config_Done(Config_Done),
      .Microroc_CTest_Chn_Out(SCTest_Microroc_CTest_Chn_Out),
      .Microroc_10bit_DAC_Out(SCTest_Microroc_10bit_DAC_Out),
      .Microroc_Discriminator_Mask(SCTest_Channel_Discri_Mask),
      .SC_Param_Load(SCTest_SC_Param_Load),
      .Force_Ext_RAZ(Force_Ext_RAZ),
      //--- PIN ---
      .CLK_EXT(CLK_EXT),
      .out_trigger0b(OUT_TRIG0B),
      .out_trigger1b(OUT_TRIG1B),
      .out_trigger2b(OUT_TRIG2B),
      //--- Done Indicator ---
      .SCurve_Test_Done(SCurve_Test_Done),
      .Data_Transmit_Done(USB_Data_Transmit_Done)
    );
endmodule
