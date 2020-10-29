function [ tabu,tij ] = updatexinxisu(tabu,tij,dist_city,Q,p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% updatexinxisu() ��Ϣ�ظ���
% tuba ���ɱ�,tij ��Ϣ��,dist_city���о���
% Q ��ʼ��Ϣ�� p ����ϵ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tabu = [tabu ,tabu(:,1)];    %�ص���ʼ��
distance = caldis(tabu,dist_city);      
deta = Q*ones(size(distance))./distance; %����ƽ����Ϣ��
[sizex,sizey] = size(tabu);  %��ȡ�ߴ�
detatij = zeros(size(tij));  %��ʼ����Ϣ�ر仯����
for i = 1:sizex             
    for j = 1:sizey-1
        tt1 = tabu(i,j);
        tt2 = tabu(i,j+1);
        detatij(tt1,tt2) = deta(i);
        %detatij(tt2,tt1) = deta(i);
    end
end
tij = (1-p)*tij+detatij;     %��Ϣ�ظ���
tabu = [[],tabu(:,1)];       %���½��ɱ�
%tabu = round(rand(5,1)*(10-1))+1;
end