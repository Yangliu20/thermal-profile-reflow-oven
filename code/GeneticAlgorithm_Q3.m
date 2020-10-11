% �Ŵ��㷨������
% ����3
% pop_size: ������Ⱥ��С
% generation_size: �����������
% cross_rate: ���뽻�����
% cross_rate: ����������
% elitism: �����Ƿ�Ӣѡ��
% m: �����Ѹ���
% n: ��������Ӧ��
% p: �����Ѹ�����ִ�

function [m,n,p] = GeneticAlgorithm_Q3(pop_size, generation_size, cross_rate, mutate_rate, elitism)

global G ; %��ǰ��
global fitness_value; % ��ǰ����Ӧ�Ⱦ���
global best_fitness; % ���������Ӧֵ
global fitness_avg; % ����ƽ����Ӧֵ����
global best_individual; % ������Ѹ���
global best_generation; % ��Ѹ�����ִ�

chromo_size = 5;
% �Ƚ�����ƽ����Ӧ�ȳ�ʼ��Ϊ0
fitness_avg = zeros(generation_size, 1);

fprintf('START Genetic Algorithm\n');

fitness_value(pop_size) = 0.;
best_fitness = 0.;
best_generation = 0;
initialize(pop_size); % ��ʼ��
for G = 1:generation_size   
    fitness_Area_min(pop_size);  % ������Ӧ�� 
    rank(pop_size);  % �Ը��尴��Ӧ�ȴ�С��������
    selection(pop_size, elitism); % ѡ�����
    crossover(pop_size, cross_rate); % �������
    mutation(pop_size, mutate_rate); % �������
end
plotGA(generation_size); % ��ӡ�㷨��������
m = best_individual; % �����Ѹ���
n = best_fitness; % ��������Ӧ��
p = best_generation; % �����Ѹ�����ִ�
% q = fitness_avg; % ����ÿһ����ƽ����Ӧ��


clear i;
clear j;
end