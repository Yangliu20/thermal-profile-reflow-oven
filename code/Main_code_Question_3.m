% 本程序用于解决A题问题3
% 输出最优参数
% 输出迭代图
% 输出最优参数对应的炉温曲线
% 输出该参数下的面积值

global para_range;
global k;
global kapa;
global ro;
global cap;

para_range = [165, 185; 185, 205; 225, 245; 245, 265; 65, 100]; % 各参数的变化范围，依次为[T15, T6, T7, T89, v]
k = 0.3;
kapa = 0.00055;
ro = 0.004;
cap = 680;

% 遗传算法
% 寻找满足制程界限的最小面积

% GeneticAlgorithm输入变量依次为:
% pop_size: 输入种群大小
% generation_size: 输入迭代次数
% cross_rate: 输入交叉概率
% cross_rate: 输入变异概率
% elitism: 输入是否精英选择

% M: 输出最佳个体参数
% n: 输出最佳适应度
% p: 输出最佳个体出现代

[M,n,p] = GeneticAlgorithm_Q3(20, 200, 0.3, 0.2, 1);

%%
para_list = M; % 最优参数
fprintf('\n Optimal parameters:\n');
fprintf('T15 T6 T7 T89 v \n');
disp(para_list);

% 将最优参数代入求解微分方程并得到各指标

% 生成中心线环境温度
[x_coord, env_temp] = env_temp_generator_simplified_MA(para_list(1),para_list(2),para_list(3),para_list(4),50);
global u_env;
global t_list;
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
% 峰值温度和时间
[tempPeak,timePointPeak] = max(temp_result);
timePointPeak = t_list(timePointPeak);

% 面积
area = (timePointPeak - timePointAbove217)*(tempPeak - 217)*2/pi;

% 判断该idx指示的参数是否满足制程界限
limit1 = get_peak_temp(temp_result);
limit2 = get_time_above_217(temp_result, t_list);
limit3 = get_time_bt_150_190_up(temp_result, t_list);
[limit4, limit5] = get_slope_ends(temp_result, t_list);
judge = ((limit1 >= 240) & (limit1 <= 250) & (limit2 >= 40) & ...
(limit2 <= 90) & (limit3 >= 60) & (limit3 <= 120) & (limit4 <= 3) & (limit5 >= -3));


% 画出所求面积及炉温曲线
[~, I] = max(temp_result > 217);
point217 = [t_list(I), 217];
[~, I_2] = max(temp_result);
pointPeak = [t_list(I_2), limit1];
line_x = t_list(I:I_2);
line_y = temp_result(I:I_2);

figure(4);
plot(t_list, temp_result, 'LineWidth', 2);hold on;
fill([line_x; pointPeak(1)], [line_y; point217(2)], 'b', 'FaceAlpha', 0.5);
plot([point217(1), pointPeak(1)], [point217(2), pointPeak(2)], '.');
plot([0, point217(1)], [point217(2), point217(2)], '--',  'LineWidth', 1.5, 'color', 'k'); % 水平线
plot([0, pointPeak(1)], [pointPeak(2), pointPeak(2)], '--', 'LineWidth', 1.5, 'color', 'k');
plot([point217(1), point217(1)], [0, point217(2)], '--', 'LineWidth', 1.5, 'color', 'k'); % 竖直线
plot([pointPeak(1), pointPeak(1)], [0, pointPeak(2)], '--', 'LineWidth', 1.5, 'color', 'k'); % 竖直线
hold off;
xlabel('t (s)');
ylabel('T (degC)');

% 输出结果并检验
fprintf('judge = %d \n',judge);  % 是否满足制程界限
fprintf('estimated area = %d \n',area); % 优化过程中使用的近似面积
fprintf('true area = %d \n',trapz(line_x, line_y - 217)); % 积分得到的实际面积
