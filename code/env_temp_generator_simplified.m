% ����ʽ���ɻ����¶�
% T15 ��һ�������С�������¶�
% T6 ������С�������¶�
% T7 ���߸�С�������¶�
% T89 �ڰ˺͵ھŸ�С�������¶�
% Ĭ�ϵ�ʮ�͵�ʮһ��С����Ϊ25degC

function [x_coord, temp_list] = env_temp_generator_simplified(T15,T6,T7,T89)
boundary = 25; % ¯ǰ��¯�����򳤶�
ele_width = 30.5; % ÿ��С�����ĳ���
ele_gap = 5; % ÿ����С����֮��ļ������

x_coord = 0:0.5: (boundary*2 + ele_width*11 + ele_gap*10); 

temp_list = linspace(25, 25, 15/0.5+1);

new_list = linspace(25, T15, (boundary-15)/0.5+1);
temp_list = [temp_list, new_list(2:end)];

new_list = linspace(T15,T15,(5*ele_width+4*ele_gap)/0.5+1);
temp_list = [temp_list, new_list(2:end)];

new_list = linspace(T15,T6,(ele_gap)/0.5+1);
temp_list = [temp_list, new_list(2:end)];

new_list = linspace(T6,T6,(ele_width)/0.5+1);
temp_list = [temp_list, new_list(2:end)];

new_list = linspace(T6,T7,(ele_gap)/0.5+1);
temp_list = [temp_list, new_list(2:end)];

new_list = linspace(T7,T7,(ele_width)/0.5+1);
temp_list = [temp_list, new_list(2:end)];

new_list = linspace(T7,T89,(ele_gap)/0.5+1);
temp_list = [temp_list, new_list(2:end)];

new_list = linspace(T89,T89,(2*ele_width+ele_gap)/0.5+1);
temp_list = [temp_list, new_list(2:end)];

new_list = linspace(T89,25,(ele_gap)/0.5+1);
temp_list = [temp_list, new_list(2:end)];

new_list = linspace(25,25,(2*ele_width+ele_gap)/0.5+1);
temp_list = [temp_list, new_list(2:end)];

new_list = linspace(25,25,(boundary)/0.5+1);
temp_list = [temp_list, new_list(2:end)];

end
