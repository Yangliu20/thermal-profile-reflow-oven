% ��������������ƶ�ƽ��
% window: �ƶ����ڴ�С
% Ĭ�ϴ���Ϊ����
function output = movingAve(vector, window)
output = zeros(length(window:length(vector)),1);
for i=window:length(vector)
    output(i-window+1) = mean(vector(i-window+1:i));
end
end
