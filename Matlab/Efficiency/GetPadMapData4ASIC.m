function [ MapData ] = GetPadMapData4ASIC()
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    MapData = cell(18, 15);
    [fid,~] = fopen('4ASIC_Order.txt','r');
    mapping = textscan(fid, '%s');
    for i = 1:1:18
       for j = 1:1:15
           MapData(i, j) = mapping{1}(j + 15*(i - 1));
       end
    end
end

