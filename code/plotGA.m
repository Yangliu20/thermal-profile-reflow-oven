% 打印算法迭代过程
% generation_size: 迭代次数
function plotGA(generation_size)
global fitness_avg;
x = 1:1:generation_size;
y = fitness_avg; % y为平均适应度
figure(1);
plot(x,y,'LineWidth',.8);
xlabel('Generation');
ylabel('Average Fitness');
end