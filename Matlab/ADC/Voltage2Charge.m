function [ Charge ] = Voltage2Charge( Voltage)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    if(Voltage >= 1.23788)
        Charge = (2.1467 - Voltage)/0.0022;
    else
        Charge = (1.7336 - Voltage)/0.0012;
    end
end

