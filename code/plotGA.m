% ��ӡ�㷨��������
% generation_size: ��������
function plotGA(generation_size)
global fitness_avg;
x = 1:1:generation_size;
y = fitness_avg; % yΪƽ����Ӧ��
figure(1);
plot(x,y,'LineWidth',.8);
xlabel('Generation');
ylabel('Average Fitness');
end