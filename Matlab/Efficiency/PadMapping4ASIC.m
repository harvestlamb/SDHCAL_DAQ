function [ Pad ] = PadMapping4ASIC( MapData, A, B, N, P)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
% ��������A~P �����pad������pad��ӳ���ϵ
% MapData: The mapping table of the hole pad, in the format of string
% A~P: Data of 14 pad : format double 64x1
% Pad: Data of the 30*30 pad
%   �˴���ʾ��ϸ˵��
    Pad= zeros(18, 15);
    for i = 1:1:18
        for j = 1:1:15
            mapdata = char(MapData(i,j));
            MapDataLength = length(mapdata);
            MapDataHeader = mapdata(1);
            if(MapDataLength == 2)
                MapDataIndex = str2double(mapdata(2));
            else 
                MapDataIndex = str2double([mapdata(2),mapdata(3)]);
            end
            switch MapDataHeader
                case 'A'
                    Pad(i,j) = A(MapDataIndex);
                case 'B'
                    Pad(i,j) = B(MapDataIndex);                
                case 'N'
                    Pad(i,j) = N(MapDataIndex);
                case 'P'
                    Pad(i,j) = P(MapDataIndex);
                case 'X'
                    Pad(i,j) = 0;
                otherwise
                    Pad(i,j) = 0;                      
            end
        end
    end
end

