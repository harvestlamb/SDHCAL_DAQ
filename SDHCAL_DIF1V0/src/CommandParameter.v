`define SlowControlOrReadScopeSelect_CAND          16'hA0A0
`define DataoutChannelSelect_CAND                  16'hA0B3
`define TransmitOnChannelSelect_CAND               16'hA0C3
`define StartReadoutChannelSelect_CAND             16'hA0D1
`define EndReadoutChannelSelect_CAND               16'hA0E1
`define InternalRazSignalLength_CAND               16'hA0F3
`define CkMux_CAND                                 16'hA001
`define ExternalRazSignalEnable_CAND               16'hA030
`define InternalRazSignalEnable_CAND               16'hA041
`define ExternalTriggerEnable_CAND                 16'hA051
`define TriggerNor64OrDirectSelect_CAND            16'hA061
`define TriggerOutputEnable_CAND                   16'hA071
`define TriggerToWriteSelect_CAND                  16'hA087
`define DacEnable_CAND                             16'hA091
`define BandGapEnable_CAND                         16'hA1A1
`define ChipID3to0_CAND                            16'hA1B1
`define ChipID7to4_CAND                            16'hA1CA
`define MaskChannel3to0_CAND                       16'hA2A0
`define MaskChannel5to4_CAND                       16'hA2B0
`define DiscriMask_CAND                            16'hA2C7
`define MaskSet_CAND                               16'hA2D0
`define LatchedOrDirectOutput_CAND                 16'hA101
`define OTAqEnable_CAND                            16'hA111
`define HighGainShaperFeedbackSelect_CAND          16'hA122
`define ShaperOutLowGainOrHighGain_CAND            16'hA130
`define LowGainShaperFeedbackSelect_CAND           16'hA142
`define GainBoostEnable_CAND                       16'hA151
`define CTestChannel3to0_CAND                      16'hA160
`define CTestChannel7to4_CAND                      16'hA170
`define ReadScopeChannel3to0_CAND                  16'hA180
`define ReadScopeChannel7to4_CAND                  16'hA190
`define LvdsReceiverPPEnable_CAND                  16'hA2E0
`define DacPPEnable_CAND                           16'hA2F0
`define BandGapPPEnable_CAND                       16'hA200
`define DiscriminatorPPEnable_CAND                 16'hA210
`define OTAqPPEnable_CAND                          16'hA220
`define Dac4bitPPEnable_CAND                       16'hA230
`define WidlarPPEnable_CAND                        16'hA240
`define LowGainShaperPPEnable_CAND                 16'hA250
`define HighGainShaperPPEnable_CAND                16'hA260
`define PreAmplifierPPEnable_CAND                  16'hA270
`define ReadoutChannelSelect_CAND                  16'hA281
`define ExternalRazModeSelect_CAND                 16'hA293
`define ExternalRazDelayTime_CAND                  16'hA3A7
`define Dac0Vth3to0_CAND                           16'hC000
`define Dac0Vth7to4_CAND                           16'hC010
`define Dac0Vth9to8_CAND                           16'hC020
`define Dac1Vth3to0_CAND                           16'hC030
`define Dac1Vth7to4_CAND                           16'hC040
`define Dac1Vth9to8_CAND                           16'hC050
`define Dac2Vth3to0_CAND                           16'hC060
`define Dac2Vth7to4_CAND                           16'hC070
`define Dac2Vth9to8_CAND                           16'hC080
`define ParameterLoadStart_CAND                    16'hD0A0
`define RunningModeSelect_CAND                     16'hE0A0
`define SweepDacSelect_CAND                        16'hE0B0
`define SweepDacStartValue3to0_CAND                16'hE0C0
`define SweepDacStartValue7to4_CAND                16'hE0D0
`define SweepDacStartValue9to8_CAND                16'hE0E0
`define SweepDacEndValue3to0_CAND                  16'hE0FF
`define SweepDacEndValue7to4_CAND                  16'hE00F
`define SweepDacEndValue9to8_CAND                  16'hE013
`define SweepDacStepValue3to0_CAND                 16'hE021
`define SweepDacStepValue7to4_CAND                 16'hE030
`define SweepDacStepValue9to8_CAND                 16'hE040
`define SingleOr64ChannelSelect_CAND               16'hE051
`define CTestOrInputSelect_CAND                    16'hE061
`define SingleTestChannelSet3to0_CAND              16'hE070
`define SingleTestChannelSet5to4_CAND              16'hE080
`define TriggerCountMaxSet3to0_CAND                16'hE1A8
`define TriggerCountMaxSet7to4_CAND                16'hE1B8
`define TriggerCountMaxSet11to8_CAND               16'hE1C3
`define TriggerCountMaxSet15to12_CAND              16'hE1D1
`define TriggerDelaySet_CAND                       16'hE1E3
`define SweepTestStartStop_CAND                    16'hF0A0
`define UnmaskAllChannelSet_CAND                   16'hE1F0
`define TriggerEfficiencyOrCountEfficiencySet_CAND 16'hE101
`define CounterMaxSet3to0_CAND                     16'hE118
`define CounterMaxSet7to4_CAND                     16'hE128
`define CounterMaxSet11to8_CAND                    16'hE133
`define CounterMaxSet15to12_CAND                   16'hE141
`define SweepAcqMaxPackageNumberSet3to0_CAND       16'hE158
`define SweepAcqMaxPackageNumberSet7to4_CAND       16'hE168
`define SweepAcqMaxPackageNumberSet11to8_CAND      16'hE173
`define SweepAcqMaxPackageNumberSet15to12_CAND     16'hE181
`define ResetMicrorocAcq_CAND                      16'hE190
`define ExternalAdcStartStop_CAND                  16'hF0B0
`define AdcStartDelayTimeSet_CAND                  16'hE2A8
`define AdcDataNumberSet3to0_CAND                  16'hE2B0
`define AdcDataNumberSet7to4_CAND                  16'hE2C2
`define TriggerCoincidenceSet_CAND                 16'hE2D0
`define HoldDelaySet3to0_CAND                      16'hE2E6
`define HoldDelaySet7to4_CAND                      16'hE2F1
`define HoldTimeSet3to0_CAND                       16'hE208
`define HoldTimeSet7to4_CAND                       16'hE21C
`define HoldTimeSet11to8_CAND                      16'hE220
`define HoldTimeSet15to12_CAND                     16'hE230
`define HoldEnableSet_CAND                         16'hE240
`define EndHoldTimeSet3to0_CAND                    16'hE254
`define EndHoldTimeSet7to4_CAND                    16'hE261
`define EndHoldTimeSet11to8_CAND                   16'hE270
`define EndHoldTimeSet15to12_CAND                  16'hE280
`define AsicChainSelectSet_CAND                    16'hB0A0
`define LightLed_CAND                              16'hB000
`define AcquisitionStartStop_CAND 16'hF0F0
`define ResetDataFifo_CAND 16'hF1A0
`define ResetTimeStamp_CAND 16'hA3B0
`define DaqSelect_CAND 16'hE290
