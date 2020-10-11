% 初始化种群
% pop_size: 种群大小
function initialize(pop_size)
% T1,T2,T3,T4,V五个变量无编码构成算法的染色体
global pop;
global para_range;
for i=1:pop_size
    for j=1:5
        pop(i,j)= para_range(j,1)+ (para_range(j,2) - para_range(j,1))/(pop_size-1)*(i-1);
    end
end
clear i;
clear j;
end