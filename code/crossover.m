% 单点交叉操作
% pop_size: 种群大小
% cross_rate: 交叉概率
function crossover(pop_size, cross_rate)
global pop;
chromo_size = 5;
for i=1:2:pop_size
    if(rand < cross_rate)
        cross_pos = round(rand * chromo_size); % cross_pos是交叉的位置
        if or (cross_pos == 0, cross_pos == 1)
            continue;
        end
        for j=cross_pos:chromo_size
            temp = pop(i,j);
            pop(i,j) = pop(i+1,j);
            pop(i+1,j) = temp;
        end
    end
end


clear i;
clear j;
clear temp;
clear cross_pos;
end

