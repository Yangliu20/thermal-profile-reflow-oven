% 单位 cm, s
global k;
global kapa;
global ro;
global cap;
global t_list;
global u_env;

k = 0.3;
kapa = 0.00055;
ro = 0.004;
cap = 680;

L = 0.015; % 0.15mm
x = linspace(0, L, 51);


% MATLAB 与 COMSOL 联调
% T15 = 175; T6 = 195; T7 = 235; T89 = 255; % degC
% model = environmentModel(T15, T6, T7, T89, ['environment_temp_',int2str(T15),'_',...
%     int2str(T6),'_',int2str(T7),'_',int2str(T89),'.csv']);
% ev = csvread(['environment_temp_',int2str(T15),'_',int2str(T6),'_',int2str(T7),'_',...
%     int2str(T89),'.csv'],9,0);

% 联调失败请执行下面一行的代码
ev = csvread('environment_temp_Q0.csv',9,0);


% 排序
[l_list,I] = sort(ev(:,1));
ev = ev(I,:);
experiment_data = xlsread('appendix.xlsx',1);
t_list = ev(:,1) / 70 * 60;
u_env = ev(:,3);


% 求解热传导方程
% 使用COMSOL模拟的炉内环境温度
m = 0;
sol = pdepe(m, @pdefun, @icfun, @bcfun, x, t_list);

% 炉温曲线比较
figure(1);
plot(ev(:,1) / 70 * 60, sol(:,26) - 273.15, 'LineWidth', 1.5); % 使用COMSOL模拟的炉内环境温度得到的炉温曲线
hold on;

% 生成简化版的环境温度
[~, temp_list] = env_temp_generator_simplified(175, 195, 235, 255); % 阶梯式
[x_coord, temp_list_MA] = env_temp_generator_simplified_MA(175, 195, 235, 255, 50); % 平滑版

% 求解热传导方程
% 使用平滑版的简化环境温度
t_list = x_coord/70*60;
u_env = temp_list_MA + 273.15;
sol = pdepe(m, @pdefun, @icfun, @bcfun, x, t_list);

plot(t_list, sol(:,26) -273.15, 'LineWidth', 1.5); % 使用平滑版的简化环境温度得到的炉温曲线
plot(experiment_data(:,1), experiment_data(:,2), 'LineWidth', 1.5, 'LineStyle', '--');hold off; % 题目提供的实验数据
xlabel('t (s)');
ylabel('T (degC)');
legend('solution unsimplified (COMSOL)','solution simplified (MA)','experiment');


% 环境温度曲线比较
figure(2);
plot(ev(:,1) / 70 * 60, ev(:,3)  - 273.15, 'LineWidth', 1.5, 'LineStyle', '-.');hold on; % COMSOL模拟的环境温度
plot(t_list, temp_list_MA, 'LineWidth', 1.5); % 平滑版简化环境温度
plot(t_list, temp_list, 'LineWidth', 1.5, 'LineStyle','-.'); % 阶梯式简化环境温度
hold off;
xlabel('t (s)');
ylabel('T (degC)');
legend('environment temperature unsimplified (COMSOL)','environment temperature simplified (MA)','environment temperature simplified');
