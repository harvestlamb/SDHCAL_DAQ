function [IgnoreChannel] = GetIgnore( )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    [FileName,PathName,FilterIndex] = uigetfile('*.txt','Select the file');
    if FilterIndex
        filename = [PathName FileName];
        delimiterIn = ' ';
        headerlinesIn = 1;
        A = importdata(filename, delimiterIn, headerlinesIn);
    end
    IgnoreChannel = A.data(:,1);
end

