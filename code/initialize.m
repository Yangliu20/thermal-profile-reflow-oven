% ��ʼ����Ⱥ
% pop_size: ��Ⱥ��С
function initialize(pop_size)
% T1,T2,T3,T4,V��������ޱ��빹���㷨��Ⱦɫ��
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