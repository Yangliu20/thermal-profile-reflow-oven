% �Ƴ̽��� ������Сб��
function [slopeMax, slopeMin] = get_slope_ends(temp_list, time_list)
slope_list = diff(temp_list) ./ diff(time_list);
slopeMax = max(slope_list);
slopeMin = min(slope_list);
end
