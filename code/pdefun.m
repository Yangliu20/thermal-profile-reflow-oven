% 焊接区域的一维热传导方程
% x: 一维坐标
% t: 时间坐标
% u: 温度
% dudx: 温度关于坐标的一阶偏导数

function [c,f,s] = pdefun(x,t,u,dudx) 
    global k;
    global ro;
    global cap;
    c = ro*cap/k;
    f = dudx;
    s = 0;
end