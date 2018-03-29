function [ Average,Std ] = CaculateAdcAutoImport(AverageNumber, HistNumber, PathName, Charge)
%CaculateAdc AverageNumber�Ƕ��ٸ��㽫ADC������ƽ��һ�� HistNumber��Ϊ����hist
%   �˴���ʾ��ϸ˵��
    filename = sprintf('%s\\%s\\%dfC.dat',pwd,PathName,Charge);
    [fid,~] = fopen(filename,'r');
    if fid <= 0
        % There was an error--tell user
        str = ['File ' filename ' could not be opened.'];
        dlg_title = 'File Open Faild';
        errordlg(str, dlg_title,'modal');
    else
        %File opend successfully
        InitialData = fread(fid,'ubit16','ieee-be');%Big-endian ording
        %Size = length(importdata);
        fclose(fid);%close file
    end
    HitNumber = floor(length(InitialData)/AverageNumber);
    AdcData = zeros(HitNumber,1);
    for i = 1:1:HitNumber
        SumAdcData = 0;
        for j = 1:1:AverageNumber
            DataIndex = (i - 1)*AverageNumber + j;
            SumAdcData = SumAdcData + InitialData(DataIndex);
        end
        AdcData(i) = SumAdcData / AverageNumber;
    end
    
    [AdcCount,Adc] = hist(AdcData,HistNumber);
    h = histogram(AdcData,10);
    hold on;
    FAdc = AdcCount/sum(AdcCount);
    Average = FAdc*Adc';
    Std = sqrt(FAdc*((Adc-Average).*(Adc-Average))');


end
