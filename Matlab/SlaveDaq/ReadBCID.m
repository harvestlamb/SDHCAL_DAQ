function [ BCID, DataPoint ] = ReadBCID( Data, DataPoint )
    %DataPoint �ǵ�ǰ�����ڼ�������λ�ã�����һ����ʼ��
    BCID = 0;
    for i = 1:12
        BCID = BCID + Data(i + DataPoint)*4^(12 - i);
    end
    DataPoint = DataPoint + 12;
end

