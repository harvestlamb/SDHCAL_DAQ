function [ DAC_percent ] = trig_efficiency( DAC_value,trig_data,percent)
%TRIG_EFFICIENCY �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% DAC_valueΪDAC��ֵ
% trig_dataΪͳ�ƴ����ʵ�ֵ
% percentΪ��ٷ�֮���Ĵ����ʣ�Ŀǰpercentֵ��Ϊ50
    
    if size(DAC_value) ~= size(trig_data)
        % There was an error--tell user
        str = 'the size of DAC value and trigger data should be the same';
        dlg_title = 'data error';
        errordlg(str, dlg_title,'modal');
    else
        %��֮ǰ��ʵ��ó���4���㣬��3������ϱȽϺ�
        len = length(DAC_value);
        for i=1:len-1
            if(trig_data(i) <= percent && trig_data(i+1)>= percent)
                pos = i;
            end
        end
        x = DAC_value(pos-1:pos+2); %��ӦDAC value��ֵ
        y = trig_data(pos-1:pos+2); %��Ӧ�����ʵ�ֵ
        [p,~,mu] = polyfit(y,x,3); %�Դ�����Ϊ�Ա�����DAC��Ϊ�����������
        DAC_percent = polyval(p,percent,[],mu);
    end
end

