function [ NewData ] = SingleMapping( OldData, OldIndex, NewIndex )
%Mapping �˴���ʾ�йش˺�����ժҪ
% ��OldData��ֵͨ��ӳ���ϵOldIndex --> NewIndexӳ�䵽NewData
%   �˴���ʾ��ϸ˵��
%   ��Pad��оƬ�ܽ�֮���ӳ��
    if(length(OldData) ~= length(OldIndex) && length(OldIndex) ~= length(NewIndex))
        str = 'Length is not matched';
        dlg_title = 'File Open Faild';
        errordlg(str, dlg_title,'modal');
    end
    ChannelNumber = length(OldData);
    NewData = zeros(1,ChannelNumber);
    for i = 1:1:ChannelNumber
        NewData(NewIndex(i)) = OldData(OldIndex(i));
    end
end

