function [ pbest,pid,gbest,pgd ] = fit_cmp(pos,fitvalue,pbest,pid)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fit_cmp���� ���¸����ȫ���������Ӻ���Ӧ��
% pos��ǰλ�� fitvalue ��ǰ��Ӧ��
% pbest ��������������Ӧ�� pid �������Ӷ�Ӧ��λ��
% gbest ȫ��������Ӧ�� pgd ȫ������λ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[max1,index1] = max(fitvalue);%�ҵ������Ӧ��
gbest = max1;                 %������Ӧ��
pgd = pos(index1,:);          %��������
for i = 1:size(pos,1)         %ѭ������
    if(fitvalue(i)>pbest(i))  %�ҵ�������Ӧ��
        pid(i,:) = pos(i,:);  %������Ӧ��
        pbest(i) = fitvalue(i);%��������λ��
    end
end
end