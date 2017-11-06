function [ R, p, x0, y0 ] = SelfLinearFit( x, y )
% �Լ�д��������ϵĺ���
% ����x,y������ϵ��R,��ϲ���p���Լ�������ͼ��x0��y0
    R = corrcoef(x, y);
    p = polyfit(x, y, 1);
    x0 = linspace(min(x), max(x));
    y0 = polyval(p, x0);
end

