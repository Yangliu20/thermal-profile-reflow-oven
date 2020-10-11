% ����������
% pop_size: ��Ⱥ��С
% mutate_rate: �������
function mutation(pop_size, mutate_rate)
global pop;
global para_range;
chromo_size=5;
for i=1:pop_size
    if rand(1) < mutate_rate
        mutate_pos = round(rand*chromo_size);% mutate_pos�Ǳ���λ��
        if mutate_pos == 0
            continue;
        end
        % ���ݱ����ı仯��Χȷ������ķ�ʽ
        pop(i,:) = pop(i,:) + ((para_range(:,2) - para_range(:,1)) .* randn(5,1)/2).';
        inrange = (pop(i,:) >= para_range(:,1).') .* (pop(i,:) <= para_range(:,2).').*(pop(i,:));
        belowrange = (pop(i,:) < para_range(:,1).') .* (para_range(:,1).');
        aboverange = (pop(i,:) > para_range(:,2).') .* (para_range(:,2).');
        
        pop(i,:) = inrange + belowrange + aboverange;
        
    end
end

clear i;
clear mutate_pos;
end