% �Ƴ̽��� ����217�ȵ�ʱ��
function output = get_time_above_217(temp_list, time_list)
mid = time_list .* (temp_list > 217);
MAX = max(mid);
MIN = min(mid(mid>0));
output = MAX - MIN;
end