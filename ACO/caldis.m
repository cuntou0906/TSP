function [ distance ] = caldis(tabu,dist_city)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% caldis() ��Ϣ�ظ���
% tuba ���ɱ� distance ����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tabu = [tabu ,tabu(:,1)];    %�ص���ʼ��
distance = zeros(size(tabu,1),1);  %��ʼ������
for i = 1:size(tabu,1)       %ѭ������ÿһֻ���ϵľ���
    dist = 0;
    for j = 1:size(tabu,2)-1 %�����������
        dist =dist +dist_city(tabu(i,j),tabu(i,j+1));
    end
    distance(i) = dist;      %�������ֵ
end          
end