% �����¶��ƶ�ƽ����ȥ��ǻ�
% T15 ��һ�������С�������¶�
% T6 ������С�������¶�
% T7 ���߸�С�������¶�
% T89 �ڰ˺͵ھŸ�С�������¶�
% Ĭ�ϵ�ʮ�͵�ʮһ��С����Ϊ25degC
function [x_coord, temp_list] = env_temp_generator_simplified_MA(T15,T6,T7,T89,window)
[x_coord, temp_list] = env_temp_generator_simplified(T15,T6,T7,T89);
temp_list = [25*ones(1,round((window-1)/2)), temp_list, 25*ones(1,window-1-round((window-1)/2))];
temp_list = movingAve(temp_list, window);
x_coord = x_coord.';
temp_list = temp_list.';
end
