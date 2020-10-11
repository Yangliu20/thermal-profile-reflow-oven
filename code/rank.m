% 对个体按适应度从小到大进行排序，并且保存最佳个体
% pop_size: 种群大小
function rank(pop_size)
global fitness_value;
global fitness_table;
global fitness_avg;
global best_fitness;
global best_individual;
global best_generation;
global pop;
global G;

% 依照适应度给种群个体排序
[fitness_value, index] = sort(fitness_value, 'ascend');
pop = pop(index, :);

% 构造适应度累积向量
fitness_table = cumsum(fitness_value);

% 平均适应度
fitness_avg(G) = fitness_table(pop_size)/pop_size; % G是当前代


if fitness_value(pop_size) > best_fitness
    best_fitness = fitness_value(pop_size);
    best_generation = G; % 总适应度最高的一代作为最优代
    for j=1:5
        best_individual(j) = pop(pop_size,j);% 总适应度最高的一代中适应度最高的个体作为最优个体
    end
end


clear i;
clear j;
clear k;
clear min;
clear temp;
clear temp1;

end
