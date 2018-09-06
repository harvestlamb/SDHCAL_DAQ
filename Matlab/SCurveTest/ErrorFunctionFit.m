function [MyErrorFunctionFit, gof] = ErrorFunctionFit(x,y,bLower,bUpper)
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    fitType = fittype('A*(erf(a*(x-b))+c)','dependent',{'y'},'independent',{'x'},'coefficients',{'a','b','c','A'});
    [MyErrorFunctionFit, gof]= fit(x,y,fitType,'Lower',[-Inf bLower 0 0.3],'Upper',[Inf bUpper 2 0.6], 'StartPoint',[0.1 0.1 1 0.5]);
end

