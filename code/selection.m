% ���̶�ѡ�����
% pop_size: ��Ⱥ��С
% elitism: �Ƿ�Ӣѡ��
function selection(pop_size, elitism) % elitism=1��ʾ������Ӣѡ�����
global pop;
global fitness_table;
% global t_list;
% global u_env;

pop_new = zeros(size(pop));

for i=1:pop_size
    judge = 0;
    while (judge~=1)
        r = (0.5+0.5*rand(1)) * fitness_table(pop_size); % ���������תһ��
        first = 1;
        last = pop_size;
        mid = round((last+first)/2);
        idx = -1;
        while (first <= last) && (idx == -1) 
            if r > fitness_table(mid)
                first = mid;
            elseif r < fitness_table(mid)
                last = mid;     
            else
                idx = mid;
                break;
            end
            mid = round((last+first)/2);
            if (last - first) == 1
                idx = last;
                break;
            end
        end
        judge = 1;
    end
   
    for j=1:5
         pop_new(i,j) = pop(idx,j);
    end
   
end

if elitism
    p = pop_size-1;
else
    p = pop_size;
end

for i=1:p
   for j=1:5
        pop(i,j) = pop_new(i,j);
   end
end

clear i;
clear j;
clear pop_new;
clear first;
clear last;
clear idx;
clear mid;
end
