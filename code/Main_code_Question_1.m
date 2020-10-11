% ���������ڽ��A������1
% ���С����3��6��7�е㼰С����8�����������������ĵ��¶�
% �����Ӧ��¯������
% ÿ��0.5s�����������ĵ��¶ȴ����'result.csv'�ļ���

global k; % ����ϵ��
global kapa; % �ȶ���ϵ��
global ro; % �ܶ�
global cap; % ������
global t_list; % ʱ������
global u_env; % ��ʱ������t_list��Ӧ�Ļ����¶�
k = 0.3; kapa = 0.00055; ro = 0.004; cap = 680;

% �������ע֮�⣬��λ��Ϊcm, s
L = 0.015; % ���������� 0.15mm
x = linspace(0, L, 51); 
v = 78; % ��¯�ٶ� cm/min

% T15 ��һ�������С�������¶�
% T6 ������С�������¶�
% T7 ���߸�С�������¶�
% T89 �ڰ˺͵ھŸ�С�������¶�
% Ĭ�ϵ�ʮ�͵�ʮһ��С����Ϊ25degC
T15 = 173; T6 = 198; T7 = 230; T89 = 257; % degC

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
% 'environment_temp_Q1.csv'�Ǳ�������ͨ��'COMSOL Multiphysics 5.4'����õ�������
% ��ͨ���������븴��
ev = csvread('environment_temp_Q1.csv',9,0); % ȡ��ע�����ȡ��������

%%
% ��COMSOL������������Ҫ���պ�������������
[l_list, I] = sort(ev(:,1));
ev = ev(I,:);
t_list = ev(:,1) / v * 60;
u_env = ev(:,3);

% ����ȴ���΢�ַ���
m = 0;
sol = pdepe(m, @pdefun, @icfun, @bcfun, x, t_list);

% ¯������
figure(1);
plot(t_list, sol(:,26) - 273.15, 'LineWidth', 2); 
legend('solution');
xlabel('t (s)');
ylabel('T (degC)');

% �����¶�����
figure(2);
plot(t_list, u_env  - 273.15, 'LineWidth', 2, 'Color','r');
legend('environment');
xlabel('t (s)');
ylabel('T (degC)');


% С����3��6��7�е㼰С����8�����������������ĵ��¶�
x1 = 25 + 35.5*2 + 30.5/2; % 3�е�
x2 = 25 + 35.5*5 + 30.5/2; % 6�е�
x3 = 25 + 35.5*6 + 30.5/2; % 7�е�
x4 = 25 + 35.5*7 + 30.5;   % 8����

t_target = [x1, x2, x3, x4] / v * 60;
sol_target = pdepe(m, @pdefun, @icfun, @bcfun, x, [t_list(1),t_target,t_list(end)]);
points = table([x1;x2;x3;x4],t_target.',sol_target(2:5,26) - 273.15,'VariableNames',{'coordinate_value','time','temperature'},...
    'RowNames',{'Region_3_Mid';'Region_6_Mid';'Region_7_Mid';'Region_8_End'});
disp(points);


% ÿ��0.5s�����������ĵ��¶�
t_target_2 = t_list(1):0.5:t_list(end);
sol_target_2 = pdepe(m, @pdefun, @icfun, @bcfun, x, t_target_2);
result = [t_target_2.', sol_target_2(:,26) - 273.15];
writetable(table(result), 'result_raw.csv');
