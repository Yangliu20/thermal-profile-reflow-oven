% ���������һά�ȴ�������
% x: һά����
% t: ʱ������
% u: �¶�
% dudx: �¶ȹ��������һ��ƫ����

function [c,f,s] = pdefun(x,t,u,dudx) 
    global k;
    global ro;
    global cap;
    c = ro*cap/k;
    f = dudx;
    s = 0;
end