function [ MapData ] = GetPadMapData()
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    MapData = cell(30, 30);
    [fid,~] = fopen('Pad_Order.txt','r');
    mapping = textscan(fid, '%s');
    for i = 1:1:30
       for j = 1:1:30
           MapData(i, j) = mapping{1}(j + 30*(i - 1));
       end
    end

end

