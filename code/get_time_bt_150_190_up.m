% �Ƴ̽��� �����׶δ���150-190�ȵ�ʱ��
function output = get_time_bt_150_190_up(temp_list, time_list)
mid = (temp_list >= 150) .* (temp_list <= 190) .* [0; diff(temp_list)>0] .* time_list; 
MAX = max(mid);
MIN = min(mid(mid>0));
output = MAX - MIN;
end
