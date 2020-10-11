% ��λ cm, s
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


% MATLAB �� COMSOL ����
% T15 = 175; T6 = 195; T7 = 235; T89 = 255; % degC
% model = environmentModel(T15, T6, T7, T89, ['environment_temp_',int2str(T15),'_',...
%     int2str(T6),'_',int2str(T7),'_',int2str(T89),'.csv']);
% ev = csvread(['environment_temp_',int2str(T15),'_',int2str(T6),'_',int2str(T7),'_',...
%     int2str(T89),'.csv'],9,0);

% ����ʧ����ִ������һ�еĴ���
ev = csvread('environment_temp_Q0.csv',9,0);


% ����
[l_list,I] = sort(ev(:,1));
ev = ev(I,:);
experiment_data = xlsread('appendix.xlsx',1);
t_list = ev(:,1) / 70 * 60;
u_env = ev(:,3);


% ����ȴ�������
% ʹ��COMSOLģ���¯�ڻ����¶�
m = 0;
sol = pdepe(m, @pdefun, @icfun, @bcfun, x, t_list);

% ¯�����߱Ƚ�
figure(1);
plot(ev(:,1) / 70 * 60, sol(:,26) - 273.15, 'LineWidth', 1.5); % ʹ��COMSOLģ���¯�ڻ����¶ȵõ���¯������
hold on;

% ���ɼ򻯰�Ļ����¶�
[~, temp_list] = env_temp_generator_simplified(175, 195, 235, 255); % ����ʽ
[x_coord, temp_list_MA] = env_temp_generator_simplified_MA(175, 195, 235, 255, 50); % ƽ����

% ����ȴ�������
% ʹ��ƽ����ļ򻯻����¶�
t_list = x_coord/70*60;
u_env = temp_list_MA + 273.15;
sol = pdepe(m, @pdefun, @icfun, @bcfun, x, t_list);

plot(t_list, sol(:,26) -273.15, 'LineWidth', 1.5); % ʹ��ƽ����ļ򻯻����¶ȵõ���¯������
plot(experiment_data(:,1), experiment_data(:,2), 'LineWidth', 1.5, 'LineStyle', '--');hold off; % ��Ŀ�ṩ��ʵ������
xlabel('t (s)');
ylabel('T (degC)');
legend('solution unsimplified (COMSOL)','solution simplified (MA)','experiment');


% �����¶����߱Ƚ�
figure(2);
plot(ev(:,1) / 70 * 60, ev(:,3)  - 273.15, 'LineWidth', 1.5, 'LineStyle', '-.');hold on; % COMSOLģ��Ļ����¶�
plot(t_list, temp_list_MA, 'LineWidth', 1.5); % ƽ����򻯻����¶�
plot(t_list, temp_list, 'LineWidth', 1.5, 'LineStyle','-.'); % ����ʽ�򻯻����¶�
hold off;
xlabel('t (s)');
ylabel('T (degC)');
legend('environment temperature unsimplified (COMSOL)','environment temperature simplified (MA)','environment temperature simplified');
