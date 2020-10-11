% 计算种群个体适应度
% 此处的优化目标为面积最小
% pop_size: 种群大小
function fitness_Area_min(pop_size)
global fitness_value;
global pop;

global t_list;
global u_env;

fitness_value = zeros(pop_size,1);

for i=1:pop_size
    % 适应值函数应定义为与面积S负相关，即面积越小，适应度越大，该个体的效果越好
    para_list = pop(i,:);
    
    % 生成中心线环境温度
    [x_coord, env_temp] = env_temp_generator_simplified_MA(para_list(1),para_list(2),para_list(3),para_list(4),50);
    t_list = x_coord/para_list(5)*60;
    u_env = env_temp + 273.15;
    
    L = 0.015; % 0.15mm
    x = linspace(0, L, 51);
    
    m = 0;
    % 求解热传导微分方程
    sol = pdepe(m, @pdefun, @icfun, @bcfun, x, t_list);
    % 获得炉温曲线
    temp_result = sol(:,26) - 273.15;
    
    % 超过217度的时间
    middle_var = (temp_result > 217).* t_list;
    timePointAbove217 = min(middle_var(middle_var>0));
    timePointAbove217_right = max(middle_var);
    
    % 峰值温度和时间
    [tempPeak,timePointPeak] = max(temp_result);
    timePointPeak = t_list(timePointPeak);
    
    % 面积
    area = (timePointPeak - timePointAbove217)*(tempPeak - 217)*2/pi;
    
    % 对称性衡量
    ratio = abs((timePointPeak - timePointAbove217) - (timePointAbove217_right - timePointPeak))/(timePointAbove217_right-timePointAbove217);
    K = -400;
    
    % 判断该idx指示的参数是否满足制程界限
    limit1 = get_peak_temp(temp_result);
    limit2 = get_time_above_217(temp_result, t_list);
    limit3 = get_time_bt_150_190_up(temp_result, t_list);
    [limit4, limit5] = get_slope_ends(temp_result, t_list);


    judge = ((limit1 >= 240) & (limit1 <= 250) & (limit2 >= 40) & ...
    (limit2 <= 90) & (limit3 >= 60) & (limit3 <= 120) & (limit4 <= 3) & (limit5 >= -3));
  
    % 适应度
    fitness_value(i) = 20000 - area - 10000*(1-judge);
%     fprintf('%d \n',area);
end

clear i;
clear j;
end