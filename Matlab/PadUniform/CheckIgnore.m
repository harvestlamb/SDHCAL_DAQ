function IgnoreOrNot = CheckIgnore( Channel,IgnoreData )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    for i = 1:1:length(IgnoreData)
        if(Channel == IgnoreData(i))
            IgnoreOrNot = 1;
            break;
        else
            IgnoreOrNot = 0;
        end
    end
end

