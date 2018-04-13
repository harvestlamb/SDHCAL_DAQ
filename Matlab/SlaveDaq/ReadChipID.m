function [ ChipID, DataPoint ] = ReadChipID( Data, DataPoint )
    %DataPoint �ǵ�ǰ�����ڼ�������λ�ã�����һ����ʼ��
    ChipID = 0;
    for i=1:4
        ChipID = ChipID + Data(i + DataPoint)*4^(4-i);
    end
    DataPoint = DataPoint + 4;
end

