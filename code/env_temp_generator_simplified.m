% 阶梯式生成环境温度
% T15 第一至第五个小温区的温度
% T6 第六个小温区的温度
% T7 第七个小温区的温度
% T89 第八和第九个小温区的温度
% 默认第十和第十一个小温区为25degC

function [x_coord, temp_list] = env_temp_generator_simplified(T15,T6,T7,T89)
boundary = 25; % 炉前和炉后区域长度
ele_width = 30.5; % 每个小温区的长度
ele_gap = 5; % 每两个小温区之间的间隔长度

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
