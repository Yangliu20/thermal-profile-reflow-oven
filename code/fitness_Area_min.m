% ������Ⱥ������Ӧ��
% �˴����Ż�Ŀ��Ϊ�����С
% pop_size: ��Ⱥ��С
function fitness_Area_min(pop_size)
global fitness_value;
global pop;

global t_list;
global u_env;

fitness_value = zeros(pop_size,1);

for i=1:pop_size
    % ��Ӧֵ����Ӧ����Ϊ�����S����أ������ԽС����Ӧ��Խ�󣬸ø����Ч��Խ��
    para_list = pop(i,:);
    
    % ���������߻����¶�
    [x_coord, env_temp] = env_temp_generator_simplified_MA(para_list(1),para_list(2),para_list(3),para_list(4),50);
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
    timePointAbove217_right = max(middle_var);
    
    % ��ֵ�¶Ⱥ�ʱ��
    [tempPeak,timePointPeak] = max(temp_result);
    timePointPeak = t_list(timePointPeak);
    
    % ���
    area = (timePointPeak - timePointAbove217)*(tempPeak - 217)*2/pi;
    
    % �Գ��Ժ���
    ratio = abs((timePointPeak - timePointAbove217) - (timePointAbove217_right - timePointPeak))/(timePointAbove217_right-timePointAbove217);
    K = -400;
    
    % �жϸ�idxָʾ�Ĳ����Ƿ������Ƴ̽���
    limit1 = get_peak_temp(temp_result);
    limit2 = get_time_above_217(temp_result, t_list);
    limit3 = get_time_bt_150_190_up(temp_result, t_list);
    [limit4, limit5] = get_slope_ends(temp_result, t_list);


    judge = ((limit1 >= 240) & (limit1 <= 250) & (limit2 >= 40) & ...
    (limit2 <= 90) & (limit3 >= 60) & (limit3 <= 120) & (limit4 <= 3) & (limit5 >= -3));
  
    % ��Ӧ��
    fitness_value(i) = 20000 - area - 10000*(1-judge);
%     fprintf('%d \n',area);
end

clear i;
clear j;
end