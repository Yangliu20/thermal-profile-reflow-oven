% 计算任意数组的移动平均
% window: 移动窗口大小
% 默认窗口为方形
function output = movingAve(vector, window)
output = zeros(length(window:length(vector)),1);
for i=window:length(vector)
    output(i-window+1) = mean(vector(i-window+1:i));
end
end
