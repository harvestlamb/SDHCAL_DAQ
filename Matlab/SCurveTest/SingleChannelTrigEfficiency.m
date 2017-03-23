function [ DAC_Percent0, DAC_Percent1, DAC_Percent2  ] = SingleChannelTrigEfficiency( ImportData, Channel_Number )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[~, ~, P0, T0, P1, T1, P2, T2] = ReadData(ImportData, 2 + Channel_Number*7169);
Trig_Ratio0 = (T0./P0).*100 ;
Trig_Ratio1 = (T1./P1).*100;
Trig_Ratio2 = (T2./P2).*100;
% DAC_Percent0 = trig_efficiency(DAC_Code,Trig_Ratio0,Percent);
% DAC_Percent1 = trig_efficiency(DAC_Code,Trig_Ratio1,Percent);
% DAC_Percent2 = trig_efficiency(DAC_Code,Trig_Ratio2,Percent);
[~, DAC_Percent0, ~] = FindStartMidEnd(Trig_Ratio0, 50);
[~, DAC_Percent1, ~] = FindStartMidEnd(Trig_Ratio1, 50);
[~, DAC_Percent2, ~] = FindStartMidEnd(Trig_Ratio2, 50);

end

