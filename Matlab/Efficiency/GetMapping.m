function [ ASIC_Channel, Pad_Channel ] = GetMapping(FileName)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% % Get mapping function
    PathName = pwd;
    filename = [PathName '\' FileName];      
    delimiterIn = ' ';
    headerlinesIn = 1;
    A = importdata(filename, delimiterIn, headerlinesIn);
    ASIC_Channel = A.data(:,1);
    Pad_Channel = A.data(:,2);
end

