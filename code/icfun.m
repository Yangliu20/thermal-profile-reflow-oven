% 焊接区域热传导方程的初始条件
% x: 一维坐标
function u0 = icfun(x) 
    u0 = 273.15 + 25; % 单位 K
end