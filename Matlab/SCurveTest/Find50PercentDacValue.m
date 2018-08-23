function [DacPercent,IsGood] = Find50PercentDacValue(FitFunction,DacStart,DacEnd)
%UNTITLED6 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    for x = DacStart:0.1:DacEnd
        y0 = FitFunction(x);
        y1 = FitFunction(x + 0.1);
        if(y0 <= 0.5 && y1 >= 0.5)
            DacPercent = (abs(y0 - 0.5) < abs(y1 - 0.5))*x + (abs(y0 - 0.5) > abs(y1 - 0.5))*(x+0.1);
            IsGood = 1;
            break;
        else
            DacPercent = DacStart;
            IsGood = 0;
        end
    end
end

