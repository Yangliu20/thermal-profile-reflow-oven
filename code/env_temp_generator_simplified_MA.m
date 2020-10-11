% 环境温度移动平均，去棱角化
% T15 第一至第五个小温区的温度
% T6 第六个小温区的温度
% T7 第七个小温区的温度
% T89 第八和第九个小温区的温度
% 默认第十和第十一个小温区为25degC
function [x_coord, temp_list] = env_temp_generator_simplified_MA(T15,T6,T7,T89,window)
[x_coord, temp_list] = env_temp_generator_simplified(T15,T6,T7,T89);
temp_list = [25*ones(1,round((window-1)/2)), temp_list, 25*ones(1,window-1-round((window-1)/2))];
temp_list = movingAve(temp_list, window);
x_coord = x_coord.';
temp_list = temp_list.';
end
