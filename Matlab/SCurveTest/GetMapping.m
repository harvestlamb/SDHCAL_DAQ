function [ ASIC_Channel, Pad_Channel ] = GetMapping()
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% % Get mapping function
    [FileName,PathName,FilterIndex] = uigetfile('*.txt','Select the file');
    if FilterIndex
        filename = [PathName FileName];
        delimiterIn = ' ';
        headerlinesIn = 1;
        A = importdata(filename, delimiterIn, headerlinesIn);
    end
    ASIC_Channel = A.data(:,1);
    Pad_Channel = A.data(:,2);
end

