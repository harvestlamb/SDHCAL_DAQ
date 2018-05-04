function [ y, x ] = FermiDiracFit( Vth, TriggerRatio )
%FermiDiracFit ʹ��Fermi-Dirac�ֲ����������S��������
%   y = \frac{1}{e^{\frac{x-\mu}{kT}} + 1}
    ft = fittpye('1/(exp((x-u)/m) + 1)','independent','x');
    [Curve, gof] = fit(Vth, TriggerRatio,ft);

end

