% 遗传算法主函数
% 问题3
% pop_size: 输入种群大小
% generation_size: 输入迭代次数
% cross_rate: 输入交叉概率
% cross_rate: 输入变异概率
% elitism: 输入是否精英选择
% m: 输出最佳个体
% n: 输出最佳适应度
% p: 输出最佳个体出现代

function [m,n,p] = GeneticAlgorithm_Q3(pop_size, generation_size, cross_rate, mutate_rate, elitism)

global G ; %当前代
global fitness_value; % 当前代适应度矩阵
global best_fitness; % 历代最佳适应值
global fitness_avg; % 历代平均适应值矩阵
global best_individual; % 历代最佳个体
global best_generation; % 最佳个体出现代

chromo_size = 5;
% 先将历代平均适应度初始化为0
fitness_avg = zeros(generation_size, 1);

fprintf('START Genetic Algorithm\n');

fitness_value(pop_size) = 0.;
best_fitness = 0.;
best_generation = 0;
initialize(pop_size); % 初始化
for G = 1:generation_size   
    fitness_Area_min(pop_size);  % 计算适应度 
    rank(pop_size);  % 对个体按适应度大小进行排序
    selection(pop_size, elitism); % 选择操作
    crossover(pop_size, cross_rate); % 交叉操作
    mutation(pop_size, mutate_rate); % 变异操作
end
plotGA(generation_size); % 打印算法迭代过程
m = best_individual; % 获得最佳个体
n = best_fitness; % 获得最佳适应度
p = best_generation; % 获得最佳个体出现代
% q = fitness_avg; % 迭代每一步的平均适应度


clear i;
clear j;
end