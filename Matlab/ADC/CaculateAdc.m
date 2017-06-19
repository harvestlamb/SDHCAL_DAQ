function [ Average,Std ] = CaculateAdc(HitNumber, AverageNumber )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    InitialData = ImportData();
    AdcData = zeros(HitNumber,1);
    for i = 1:1:HitNumber
        SumAdcData = 0;
        for j = 1:1:AverageNumber
            DataIndex = (i - 1)*AverageNumber + j;
            SumAdcData = SumAdcData + InitialData(DataIndex);
        end
        AdcData(i) = SumAdcData / AverageNumber;
    end
    
    [AdcCount,Adc] = hist(AdcData,10);
    hist(AdcData,10);
    hold on;
    FAdc = AdcCount/sum(AdcCount);
    Average = FAdc*Adc';
    Std = sqrt(FAdc*((Adc-Average).*(Adc-Average))');


end

