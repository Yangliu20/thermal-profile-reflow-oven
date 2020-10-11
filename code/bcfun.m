% 焊接区域热传导方程的边界条件
% 由牛顿冷却定律得到的Neumann边界条件
% xL 左端点坐标
% uL 左端点温度
% xR 右端点坐标
% uR 右端点温度
% t 时间
function [pL,qL,pR,qR] = bcfun(xL,uL,xR,uR,t) 
    global t_list;global u_env;global k;global kapa;
    
    if t <= 10
        env = 273.15 + 25;
    else
        env = interp1(t_list, u_env, t-10, 'Spline');
    end

    if(uL-env)<0
        pL = kapa*(uL-env)/k;
    else
        pL = kapa*(uL-env)/(k+0.6);
    end
    if(uR-env)<0
        pR = kapa*(uR-env)/k;
    else
        pR = kapa*(uR-env)/(k+0.6);
    end
    qL = -1;
    qR = 1;
end