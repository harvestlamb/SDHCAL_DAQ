`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:USTC 
// Engineer: Yu Wang
// 
// Create Date: 2017/04/20 14:42:31
// Design Name: SDHCAL DAQ
// Module Name: SweepACQ_Control
// Project Name: 
// Target Devices: xc7a100tfgg484-2
// Tool Versions: Vivado 16.3
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SweepACQ_Control(
    input Clk,
    input reset_n,
    // ACQ Control
    input SweepStart,
    output reg SingleACQStart,
    output reg ForceMicrorocAcqReset,
    output reg OneDACDone,
    output reg ACQDone,
    input DataTransmitDone,
    // Sweep ACQ parameters
    input [9:0] StartDAC0,
    input [9:0] EndDAC0,
    input [15:0] MaxPackageNumber,
    // ACQ Data Enable for Data Counts
    input ParallelData_en,    
    // Microroc SC Parameters
    output reg [9:0] OutDAC0,
    //output [9:0] OutDAC1, //Only need to sweep DAC0
    //output [9:0] OutDAC2,
    //output [5:0] MaskChannel,
    output reg LoadSCParameter,
    input MicrorocConfigDone,
    // Get ACQ Data
    input [15:0] SweepACQFifoData,
    output reg SweepACQFifoData_rden,
    // Data Output
    output reg [15:0] SweepACQData,
    output reg SweepACQData_en,
    // Usb FIFO Full Signal
    input UsbDataFifoFull
    );
    reg [3:0] State;
    localparam [3:0] IDLE = 4'd0,                //0000
                     HEADER_OUT = 4'd1,          //0001
                     SC_PARAM_OUT = 4'd3,        //0011
                     LOAD_SC_PARAM = 4'd2,       //0010
                     WAIT_LOAD_DONE = 4'd6,      //0110
                     START_ACQ = 4'd7,           //0111
                     WAIT_ONCE_DATA = 4'd5,      //0101
                     GET_ONE_DATA = 4'd4,        //0100
                     WAIT_FIFO_DATA = 4'd12,     //1100
                     OUT_ONE_DATA = 4'd13,       //1101
                     CHECK_ONE_DAC_DONE = 4'd15, //1111
                     CHECK_ALL_DONE = 4'd14,     //1110
                     TAIL_OUT = 4'd10,           //1010
                     WAIT_DONE = 4'd11,          //1011
                     ALL_DONE = 4'd9;           //1001
    reg [9:0] TestDAC0;
    reg [27:0] SCParamLoadDelayCount;
    localparam [27:0] SC_PARAM_LOAD_DELAY = 28'd40_000_000;//40_000
    reg OneFire;
    reg [15:0] FireDataCount;
    reg [3:0] DataReadCount;
    localparam [3:0] DATA_READ_NUM = 4'd10;
    //wire [15:0] SweepACQFifoData;
    //reg SweepACQFifoData_en;
    always @(posedge Clk or negedge reset_n) begin
      if(~reset_n) begin
        SingleACQStart <= 1'b0;
        OneDACDone <= 1'b0;
        ACQDone <= 1'b0;
        OutDAC0 <= 10'b0;
        TestDAC0 <= 10'b0;
        //MaskChannel <= 
        LoadSCParameter <= 1'b0;
        SweepACQData <= 16'b0;
        SweepACQData_en <= 1'b0;
        FireDataCount <= 16'b0;
        SCParamLoadDelayCount <= 28'b0;
        DataReadCount <= 4'b0;
        SweepACQFifoData_rden <= 1'b0;
        //SweepACQFifoData_en <= 1'b0;
        ACQDone <= 1'b0;
        ForceMicrorocAcqReset <= 1'b0;
        State <= IDLE;
      end
      else begin
        case(State)
          IDLE:begin
            if(~SweepStart) begin
              SingleACQStart <= 1'b0;
              OneDACDone <= 1'b0;
              ACQDone <= 1'b0;
              OutDAC0 <= 10'b0;
              TestDAC0 <= StartDAC0;
              LoadSCParameter <= 1'b0;
              SweepACQData <= 16'b0;
              SweepACQData <= 1'b0;
              FireDataCount <= 16'b0;
              SCParamLoadDelayCount <= 28'b0;
              DataReadCount <= 4'b0;
              SweepACQFifoData_rden <= 1'b0;
              ACQDone <= 1'b0;
              ForceMicrorocAcqReset <= 1'b0;
              State <= IDLE;
            end
            else begin
              SweepACQData <= 16'h5341;//ASCII SA:Sweep Acq
              State <= HEADER_OUT;
            end
          end
          HEADER_OUT:begin
            SweepACQData_en <= 1'b1;
            State <= SC_PARAM_OUT;
          end
          SC_PARAM_OUT:begin
            SweepACQData_en <= 1'b0;
            SweepACQData <= {4'hD, 2'b00, TestDAC0};
            OutDAC0 <= DACInvert(TestDAC0);
            State <= LOAD_SC_PARAM;
          end
          LOAD_SC_PARAM:begin
            SweepACQData_en <= 1'b1;
            LoadSCParameter <= 1'b1;
            State <= WAIT_LOAD_DONE;
          end
          WAIT_LOAD_DONE:begin
            LoadSCParameter <= 1'b0;
            SweepACQData_en <= 1'b0;
            if(MicrorocConfigDone || (SCParamLoadDelayCount != 28'd0 && SCParamLoadDelayCount < SC_PARAM_LOAD_DELAY)) begin
              State <= WAIT_LOAD_DONE;
              SCParamLoadDelayCount <= SCParamLoadDelayCount + 1'b1;
            end
            else if(SCParamLoadDelayCount == SC_PARAM_LOAD_DELAY) begin
              SCParamLoadDelayCount <= 28'b0;
              ForceMicrorocAcqReset <= 1'b1;
              State <= START_ACQ;
            end
            else
              State <= WAIT_LOAD_DONE;
          end
          START_ACQ:begin
            ForceMicrorocAcqReset <= 1'b0;
            SingleACQStart <= 1'b1;
            State <= WAIT_ONCE_DATA;
          end
          WAIT_ONCE_DATA:begin
            if(OneFire) begin
              SweepACQFifoData_rden <= 1'b1;
              State <= GET_ONE_DATA;
            end
            else begin
              State <= WAIT_ONCE_DATA;
            end
          end
          GET_ONE_DATA:begin
            SweepACQFifoData_rden <= 1'b0;
            SweepACQData_en <= 1'b0;
            //SweepACQData <= SweepACQFifoData;
            if(UsbDataFifoFull) begin
              State <= GET_ONE_DATA;
              SingleACQStart = 1'b0;
            end
            else begin
              State <= WAIT_FIFO_DATA;
            end
          end
          WAIT_FIFO_DATA:begin
            SweepACQData <= SweepACQFifoData;
            State <= OUT_ONE_DATA;
          end
          OUT_ONE_DATA:begin
            SweepACQData_en <= 1'b1;
            if(DataReadCount < DATA_READ_NUM - 1'b1) begin
              SweepACQFifoData_rden <= 1'b1;
              DataReadCount <= DataReadCount + 1'b1;
              State <= GET_ONE_DATA;
            end
            else begin
              DataReadCount <= 4'b0;
              State <= CHECK_ONE_DAC_DONE;
            end
          end
          CHECK_ONE_DAC_DONE:begin
            SweepACQData_en <= 1'b0;
            if(FireDataCount >= MaxPackageNumber - 1'b1) begin
              FireDataCount <= 16'b0;
              SingleACQStart <= 1'b0;
              OneDACDone <= 1'b1;
              State <= CHECK_ALL_DONE;
            end
            else if(SingleACQStart) begin
              FireDataCount <= FireDataCount + 1'b1;
              State <= WAIT_ONCE_DATA;
            end
            else begin
              ForceMicrorocAcqReset <= 1'b1;
              FireDataCount <= FireDataCount + 1'b1;
              State <= START_ACQ;
            end
            /*if(FireDataCount < MaxPackageNumber - 1'b1) begin
              FireDataCount <= FireDataCount + 1'b1;
              State <= WAIT_ONCE_DATA;
            end
            else begin
              FireDataCount <= 16'b0;
              SingleACQStart <= 1'b0;
              OneDACDone <= 1'b1;
              State <= CHECK_ALL_DONE;
            end*/
          end
          CHECK_ALL_DONE:begin
            OneDACDone <= 1'b0;
            if(TestDAC0 < EndDAC0) begin
              TestDAC0 <= TestDAC0 + 1'b1;
              State <= SC_PARAM_OUT;
            end
            else begin
              SweepACQData <= 16'hFF45;
              State <= TAIL_OUT;
            end
          end
          TAIL_OUT:begin
            SweepACQData_en <= 1'b1;
            State <= WAIT_DONE;
          end
          WAIT_DONE:begin
            ACQDone <= 1'b1;
            SweepACQData_en <= 1'b0;
            State <= ALL_DONE;
          end
          ALL_DONE:begin
            if(DataTransmitDone) begin
              ACQDone <= 1'b0;
              State <= IDLE;
            end
            else
              State <= ALL_DONE;
          end
          default: State <= IDLE;
        endcase
      end
    end

    // Count the ACQ Data
    reg [3:0] OneFireDataCount;
    localparam [3:0] ONE_FIRE_DATA_NUM = 5'd9;
    always @ (posedge Clk or negedge reset_n) begin
      if(~reset_n) begin
        OneFireDataCount <= 4'b0;
        OneFire <= 1'b0;
      end
      else if(!ParallelData_en) begin
        OneFireDataCount <= OneFireDataCount;
        OneFire <= 1'b0;
      end
      else if(OneFireDataCount == ONE_FIRE_DATA_NUM) begin
        OneFireDataCount <= 4'b0;
        OneFire <= 1'b1;
      end
      else begin
        OneFireDataCount <= OneFireDataCount + 1'b1;
        OneFire <= 1'b0;
      end
    end
  
    // Swap the LSB and MSB for SC parameter
    function [9:0] DACInvert(input [9:0] num);
      begin
        DACInvert = {num[0], num[1], num[2], num[3], num[4], num[5], num[6], num[7], num[8], num[9]};
      end
    endfunction
    // Debug
    /*(*mark_debug = "true"*)wire [3:0] State_Debug;
    assign State_Debug = State;
    (*mark_debug = "true"*)wire [15:0] SweepAcqData_Debug;
    assign SweepAcqData_Debug = SweepACQData;
    (*mark_debug = "true"*)wire SweepACQData_en_Debug;
    assign SweepACQData_en_Debug = SweepACQData_en;
    (*mark_debug = "true"*)wire [15:0] FireDataCount_Debug;
    assign FireDataCount_Debug = FireDataCount;
    (*mark_debug = "true"*)wire [3:0] DataReadCount_Debug;
    assign DataReadCount_Debug = DataReadCount;
    (*mark_debug = "true"*)wire [15:0] MaxPackageNumber_Debug;
    assign MaxPackageNumber_Debug = MaxPackageNumber;
    (*mark_debug = "true"*)wire SweepStart_Debug;
    assign SweepStart_Debug = SweepStart;
    (*mark_debug = "true"*)wire SingleACQStart_Debug;
    assign SingleACQStart_Debug = SingleACQStart;*/

endmodule
