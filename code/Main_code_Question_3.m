% ���������ڽ��A������3
% ������Ų���
% �������ͼ
% ������Ų�����Ӧ��¯������
% ����ò����µ����ֵ

global para_range;
global k;
global kapa;
global ro;
global cap;

para_range = [165, 185; 185, 205; 225, 245; 245, 265; 65, 100]; % �������ı仯��Χ������Ϊ[T15, T6, T7, T89, v]
k = 0.3;
kapa = 0.00055;
ro = 0.004;
cap = 680;

% �Ŵ��㷨
% Ѱ�������Ƴ̽��޵���С���

% GeneticAlgorithm�����������Ϊ:
% pop_size: ������Ⱥ��С
% generation_size: �����������
% cross_rate: ���뽻�����
% cross_rate: ����������
% elitism: �����Ƿ�Ӣѡ��

% M: �����Ѹ������
% n: ��������Ӧ��
% p: �����Ѹ�����ִ�

[M,n,p] = GeneticAlgorithm_Q3(20, 200, 0.3, 0.2, 1);

%%
para_list = M; % ���Ų���
fprintf('\n Optimal parameters:\n');
fprintf('T15 T6 T7 T89 v \n');
disp(para_list);

% �����Ų����������΢�ַ��̲��õ���ָ��

% ���������߻����¶�
[x_coord, env_temp] = env_temp_generator_simplified_MA(para_list(1),para_list(2),para_list(3),para_list(4),50);
global u_env;
global t_list;
t_list = x_coord/para_list(5)*60;
u_env = env_temp + 273.15;

L = 0.015; % 0.15mm
x = linspace(0, L, 51);

m = 0;
% ����ȴ���΢�ַ���
sol = pdepe(m, @pdefun, @icfun, @bcfun, x, t_list);
% ���¯������
temp_result = sol(:,26) - 273.15;

% ����217�ȵ�ʱ��
middle_var = (temp_result > 217).* t_list;
timePointAbove217 = min(middle_var(middle_var>0));
% ��ֵ�¶Ⱥ�ʱ��
[tempPeak,timePointPeak] = max(temp_result);
timePointPeak = t_list(timePointPeak);

% ���
area = (timePointPeak - timePointAbove217)*(tempPeak - 217)*2/pi;

% �жϸ�idxָʾ�Ĳ����Ƿ������Ƴ̽���
limit1 = get_peak_temp(temp_result);
limit2 = get_time_above_217(temp_result, t_list);
limit3 = get_time_bt_150_190_up(temp_result, t_list);
[limit4, limit5] = get_slope_ends(temp_result, t_list);
judge = ((limit1 >= 240) & (limit1 <= 250) & (limit2 >= 40) & ...
(limit2 <= 90) & (limit3 >= 60) & (limit3 <= 120) & (limit4 <= 3) & (limit5 >= -3));


% �������������¯������
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
plot([0, point217(1)], [point217(2), point217(2)], '--',  'LineWidth', 1.5, 'color', 'k'); % ˮƽ��
plot([0, pointPeak(1)], [pointPeak(2), pointPeak(2)], '--', 'LineWidth', 1.5, 'color', 'k');
plot([point217(1), point217(1)], [0, point217(2)], '--', 'LineWidth', 1.5, 'color', 'k'); % ��ֱ��
plot([pointPeak(1), pointPeak(1)], [0, pointPeak(2)], '--', 'LineWidth', 1.5, 'color', 'k'); % ��ֱ��
hold off;
xlabel('t (s)');
ylabel('T (degC)');

% ������������
fprintf('judge = %d \n',judge);  % �Ƿ������Ƴ̽���
fprintf('estimated area = %d \n',area); % �Ż�������ʹ�õĽ������
fprintf('true area = %d \n',trapz(line_x, line_y - 217)); % ���ֵõ���ʵ�����
