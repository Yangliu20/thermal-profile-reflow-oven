% ���������ڽ��A������2
% ��ͼ�����ͬ�ٶȵĸ��Ƴ̽���ָ��ֵ
% ������������Ƴ̽��޵Ĺ�¯�ٶ�
% �������ʹ���¯�ٶ�

global k; 
global kapa; 
global ro; 
global cap; 
global t_list;
global u_env;
k = 0.3; kapa = 0.00055; ro = 0.004; cap = 680;

% �������ע֮�⣬��λ��Ϊcm, s
L = 0.015; % ���������� 0.15mm
x = linspace(0, L, 51);
m = 0;

% T15 ��һ�������С�������¶�
% T6 ������С�������¶�
% T7 ���߸�С�������¶�
% T89 �ڰ˺͵ھŸ�С�������¶�
% Ĭ�ϵ�ʮ�͵�ʮһ��С����Ϊ25degC
T15 = 182; T6 = 203; T7 = 237; T89 = 254; % degC

% COMSOL LiveLink for MATLAB
% ��COMSOL������ģ��¯�ڻ����¶�
% ��������ͨ��'COMSOL Multiphysics 5.4 with MATLAB'�����MATLAB����
% ����غ�¯�����ߵĻ����¶�
% ������񻮷�ͼ ¯���¶ȷֲ���άͼ �������¶ȷֲ�һάͼ
% model = environmentModel(T15, T6, T7, T89, ['environment_temp_',int2str(T15),'_',...
%     int2str(T6),'_',int2str(T7),'_',int2str(T89),'.csv']);
% ev = csvread(['environment_temp_',int2str(T15),'_',int2str(T6),'_',int2str(T7),'_',...
%     int2str(T89),'.csv'],9,0);

% ��û�а�װCOMSOL������ʧ�ܣ���ֱ�Ӷ�ȡ�Ѿ�����������
% 'environment_temp_Q2.csv'�Ǳ�������ͨ��'COMSOL Multiphysics 5.4'����õ�������
% ��ͨ���������븴��
ev = csvread('environment_temp_Q2.csv',9,0); % ȡ��ע�����ȡ��������

%%
% ��COMSOL������������Ҫ���պ�������������
[l_list,I] = sort(ev(:,1));
ev = ev(I,:);
u_env = ev(:,3);

% ���㲻ͬ�ٶ��µ�¯������
sol_list = [];
velocity_list = 65:1:100;
figure(1);
for velocity = velocity_list
    t_list = l_list/velocity*60;
    sol = pdepe(m, @pdefun, @icfun, @bcfun, x, t_list);
    plot(l_list./velocity*60, sol(:,26) - 273.15);hold on;
    sol_list = [sol_list, sol(:,26) - 273.15];
end 
hold off;
xlabel('t (s)');
ylabel('T (degC)');
%%
% ��ֵ�¶�
peak_temp = max(sol_list);
figure(2);
plot(65:1:100, peak_temp, '-o','LineWidth',2);hold on;
plot([65,100],[240,240],'-.','LineWidth',2);
plot([65,100],[250,250],'-.','LineWidth',2);hold off;
xlabel('velocity (cm/min)');
ylabel('peak temperature (degC)');
ylim([230,255]);

list1 = ((peak_temp >= 240) & (peak_temp <= 250));

%%
% ����217�ȵ�ʱ��
pos = diag(l_list) * (sol_list > 217);

max_val = [];
min_val = [];

for i=1:36
    pos_list = pos(:,i);
    MAX = max(pos_list);
    MIN = min(pos_list(pos_list>0));
    max_val = [max_val, MAX];
    min_val = [min_val, MIN];
end
time_interval_217 = (max_val - min_val)./velocity_list.*60;

figure(3);
plot(velocity_list,time_interval_217 , '-o','LineWidth',2);hold on;
plot([65,100],[40,40],'-.','LineWidth',2);
plot([65,100],[90,90],'-.','LineWidth',2);hold off;
xlabel('velocity (cm/min)');
ylabel('delta t (s)');
ylim([35,95]);

list2 = ((time_interval_217 >= 40) & (time_interval_217 <= 90));

%%
% �������̴���150-190��ʱ��
startPoint = [];
endPoint = [];

for i=1:36
    temp = sol_list(:,i);
    pos_list = (temp >= (150)) .* (temp <= (190)) .* [0; diff(temp)>0] .* l_list;
    MAX = max(pos_list);
    MIN = min(pos_list(pos_list>0));
    startPoint = [startPoint, MIN];
    endPoint = [endPoint, MAX];
end

% plot(startPoint);hold on;plot(endPoint);hold off;
time_interval_150_190 = (endPoint-startPoint)./velocity_list*60;
figure(4);
plot(velocity_list, time_interval_150_190, '-o','LineWidth',2);hold on;
plot([65,100],[60,60],'-.','LineWidth',2);
plot([65,100],[120,120],'-.','LineWidth',2);hold off;
xlabel('velocity (cm/min)');
ylabel('delta t (s)');
ylim([55,125]);

list3 = ((time_interval_150_190 >= 60) & (time_interval_150_190 <= 120));

%%
% б��
max_slope = [];
min_slope = [];

for i=1:36
    temp = sol_list(:,i);
    vel = velocity_list(i);
    diff_list = diff(temp)./diff(l_list)*vel/60;
    MAX = max(diff_list);
    MIN = min(diff_list);
    max_slope = [max_slope, MAX];
    min_slope = [min_slope, MIN];
end

figure(5);
plot(velocity_list, max_slope, '-o','LineWidth',2);hold on;
plot(velocity_list, min_slope','-o','LineWidth',2);
plot([65,100],[3,3],'-.','LineWidth',2);
plot([65,100],[-3,-3],'-.','LineWidth',2);hold off;hold off;
xlabel('velocity (cm/min)');
ylabel('slope (degC/s)');
legend('MAX', 'MIN');
ylim([-3.5,3.5]);

list4 = (max_slope <= 3) & (min_slope >= -3);

%%
% ����¯�ٶ�
v_list = list1 .* list2 .* list3 .* list4 .* velocity_list;
v_op = max(v_list);
fprintf('Feasible Velocities: \n');
disp(v_list(v_list>0));
fprintf('Max Feasible Velocity: %d cm/min \n',v_op);

t_list = l_list / v_op * 60;
sol = pdepe(m, @pdefun, @icfun, @bcfun, x, t_list);

% ¯������
figure(6);
plot(t_list, sol(:,26) - 273.15, 'LineWidth', 2);
legend('solution');
xlabel('t (s)');
ylabel('T (degC)');
title(['v = ',int2str(v_op),' cm/min']);

% �����¶����ߣ�������Ϊʱ��
figure(7);
plot(t_list, u_env  - 273.15, 'LineWidth', 2, 'Color','r');
legend('environment');
xlabel('t (s)');
ylabel('T (degC)');
title(['v = ',int2str(v_op),' cm/min']);

% �����¶����ߣ�������Ϊλ��
figure(8);
plot(l_list, u_env  - 273.15, 'LineWidth', 2, 'Color','r');
legend('environment');
xlabel('x (cm)');
ylabel('T (degC)');