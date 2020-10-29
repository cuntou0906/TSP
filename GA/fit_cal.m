function [ fitvalue ] = fit_cal(pos,dist_city)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fit_cal() ��Ӧ�ȼ���
% pos ����Ⱥ dist_city ���о���
% fitvalue = 2/distance;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[sizex,sizey] = size(pos);   %��ȡ����Ⱥά��
newgen = ones(sizex,sizey+2);%��ʼ��
newgen(:,2:end-1)=pos;       %������β����
fitvalue = zeros(sizex,1);   %��ʼ����Ӧ��
for i = 1:sizex    %ѭ������ÿһ����Ⱥ����Ӧ��
    dist = 0;
    for j = 1:size(newgen,2)-1 %�����������
        dist =dist +dist_city(newgen(i,j),newgen(i,j+1));
    end
    fitvalue(i) = dist;        %�������ֵ
end          
fitvalue = 2*ones(size(fitvalue))./fitvalue;%������Ӧ��
end