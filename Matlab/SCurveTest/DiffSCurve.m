function [ DiffT0, DiffT1, DiffT2 ] = DiffSCurve( ImportData, Channel_Number )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    [~, ~, P0, T0, P1, T1, P2, T2] = ReadData(ImportData, 2 + Channel_Number*7169);
    Trig_Ratio0 = (T0./P0).*100 ;
    Trig_Ratio1 = (T1./P1).*100;
    Trig_Ratio2 = (T2./P2).*100;
    DiffT0 = diff(Trig_Ratio0);
    DiffT1 = diff(Trig_Ratio1);
    DiffT2 = diff(Trig_Ratio2);
end

