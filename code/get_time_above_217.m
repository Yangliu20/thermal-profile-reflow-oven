% 制程界限 大于217度的时间
function output = get_time_above_217(temp_list, time_list)
mid = time_list .* (temp_list > 217);
MAX = max(mid);
MIN = min(mid(mid>0));
output = MAX - MIN;
end