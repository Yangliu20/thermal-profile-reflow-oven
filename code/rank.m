% �Ը��尴��Ӧ�ȴ�С����������򣬲��ұ�����Ѹ���
% pop_size: ��Ⱥ��С
function rank(pop_size)
global fitness_value;
global fitness_table;
global fitness_avg;
global best_fitness;
global best_individual;
global best_generation;
global pop;
global G;

% ������Ӧ�ȸ���Ⱥ��������
[fitness_value, index] = sort(fitness_value, 'ascend');
pop = pop(index, :);

% ������Ӧ���ۻ�����
fitness_table = cumsum(fitness_value);

% ƽ����Ӧ��
fitness_avg(G) = fitness_table(pop_size)/pop_size; % G�ǵ�ǰ��


if fitness_value(pop_size) > best_fitness
    best_fitness = fitness_value(pop_size);
    best_generation = G; % ����Ӧ����ߵ�һ����Ϊ���Ŵ�
    for j=1:5
        best_individual(j) = pop(pop_size,j);% ����Ӧ����ߵ�һ������Ӧ����ߵĸ�����Ϊ���Ÿ���
    end
end


clear i;
clear j;
clear k;
clear min;
clear temp;
clear temp1;

end
