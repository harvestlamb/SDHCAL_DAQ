function [Start, Middle, End] = FindStartMidEnd(Trig_Ratio, Percent, StartDacCode)
% Find the Start, Middle, End
% Len = length(Trig_Ratio);
Len = length(Trig_Ratio) - 1;
Start = 1;
End = Len;
Middle = 1;
for i = 1:1:Len
    if(Trig_Ratio(i) == 0 && Trig_Ratio(i + 1) ~= 0 )
        Start = i;
    end   
end
for i = 1:1:Len
    if(Trig_Ratio(i) ~= 100 && abs(Trig_Ratio(i + 1) - 100) < 0.1)
        End = i;
        break;        
    end
end
temp = 100;
I_Start = ((Start - 2) > 0)*(Start - 2) + ((Start - 2) <= 0)*Start;
I_End = ((Len - End) > 2)*(End + 2) + ((Len - End) <= 2)*End;
x_i = I_Start:I_End;
y_i = Trig_Ratio(x_i);
x_SI = I_Start:0.01:I_End;
y_SI = spline(x_i,y_i,x_SI);
n = (I_End - I_Start)/0.01 + 1;
Middle_temp = 0;
for i = 1:1:n
    if(abs(y_SI(i) - Percent) < temp)
        temp = abs(y_SI(i) - Percent);
        Middle_temp = i;
    end
end
Middle = Middle_temp*0.01 + I_Start + StartDacCode;
% for i = 1:1:Len - 1
%     if(abs(Trig_Ratio(i) - Percent) < temp)
%         temp = abs(Trig_Ratio(i) - Percent);
%         Middle = i;
%     end
% end