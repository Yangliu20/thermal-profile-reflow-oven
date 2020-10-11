% 本程序用于解决A题问题1
% 输出小温区3、6、7中点及小温区8结束处焊接区域中心的温度
% 输出相应的炉温曲线
% 每隔0.5s焊接区域中心的温度存放在'result.csv'文件中

global k; % 导热系数
global kapa; % 热对流系数
global ro; % 密度
global cap; % 比热容
global t_list; % 时间数列
global u_env; % 与时间数列t_list对应的环境温度
k = 0.3; kapa = 0.00055; ro = 0.004; cap = 680;

% 除特殊标注之外，单位均为cm, s
L = 0.015; % 焊接区域厚度 0.15mm
x = linspace(0, L, 51); 
v = 78; % 过炉速度 cm/min

% T15 第一至第五个小温区的温度
% T6 第六个小温区的温度
% T7 第七个小温区的温度
% T89 第八和第九个小温区的温度
% 默认第十和第十一个小温区为25degC
T15 = 173; T6 = 198; T7 = 230; T89 = 257; % degC

% COMSOL LiveLink for MATLAB
% 与COMSOL联调，模拟炉内环境温度
% 联调必须通过'COMSOL Multiphysics 5.4 with MATLAB'程序打开MATLAB界面
% 输出回焊炉中心线的环境温度
% 输出网格划分图 炉内温度分布二维图 中心线温度分布一维图
% model = environmentModel(T15, T6, T7, T89, ['environment_temp_',int2str(T15),'_',...
%     int2str(T6),'_',int2str(T7),'_',int2str(T89),'.csv']);
% ev = csvread(['environment_temp_',int2str(T15),'_',int2str(T6),'_',int2str(T7),'_',...
%     int2str(T89),'.csv'],9,0);

% 若没有安装COMSOL或联调失败，可直接读取已经导出的数据
% 'environment_temp_Q1.csv'是本组事先通过'COMSOL Multiphysics 5.4'计算得到的数据
% 可通过上述代码复现
ev = csvread('environment_temp_Q1.csv',9,0); % 取消注释则读取已有数据

%%
% 由COMSOL导出的数据需要按照横坐标重新排序
[l_list, I] = sort(ev(:,1));
ev = ev(I,:);
t_list = ev(:,1) / v * 60;
u_env = ev(:,3);

% 求解热传导微分方程
m = 0;
sol = pdepe(m, @pdefun, @icfun, @bcfun, x, t_list);

% 炉温曲线
figure(1);
plot(t_list, sol(:,26) - 273.15, 'LineWidth', 2); 
legend('solution');
xlabel('t (s)');
ylabel('T (degC)');

% 环境温度曲线
figure(2);
plot(t_list, u_env  - 273.15, 'LineWidth', 2, 'Color','r');
legend('environment');
xlabel('t (s)');
ylabel('T (degC)');


% 小温区3、6、7中点及小温区8结束处焊接区域中心的温度
x1 = 25 + 35.5*2 + 30.5/2; % 3中点
x2 = 25 + 35.5*5 + 30.5/2; % 6中点
x3 = 25 + 35.5*6 + 30.5/2; % 7中点
x4 = 25 + 35.5*7 + 30.5;   % 8结束

t_target = [x1, x2, x3, x4] / v * 60;
sol_target = pdepe(m, @pdefun, @icfun, @bcfun, x, [t_list(1),t_target,t_list(end)]);
points = table([x1;x2;x3;x4],t_target.',sol_target(2:5,26) - 273.15,'VariableNames',{'coordinate_value','time','temperature'},...
    'RowNames',{'Region_3_Mid';'Region_6_Mid';'Region_7_Mid';'Region_8_End'});
disp(points);


% 每隔0.5s焊接区域中心的温度
t_target_2 = t_list(1):0.5:t_list(end);
sol_target_2 = pdepe(m, @pdefun, @icfun, @bcfun, x, t_target_2);
result = [t_target_2.', sol_target_2(:,26) - 273.15];
writetable(table(result), 'result_raw.csv');
