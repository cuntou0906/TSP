function [ tabu,tij ] = updatexinxisu(tabu,tij,dist_city,p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% updatexinxisu() ��Ϣ�ظ���
% tuba ���ɱ�,tij ��Ϣ��,dist_city���о���
% Q ��ʼ��Ϣ�� p ����ϵ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tabu = [tabu ,tabu(:,1)];         %�ص���ʼ��
distance = caldis(tabu,dist_city);
[mindis,minindex] = min(distance);%�ҵ�����·��
bestlu = tabu(minindex,:);        %����·��
deta = 1/mindis;                  %����ƽ����Ϣ��
[sizex,sizey] = size(tabu);       %��ȡ�ߴ�
detatij = zeros(size(tij));       %��ʼ����Ϣ�ر仯����
for i = 1:sizex             
    for j = 1:sizey-1
        tt1 = tabu(i,j);     %�ж��Ƿ�������·������
        tt2 = tabu(i,j+1);
        ttindex = find(bestlu==tt1);
        if(ttindex(1)==1)
            set = (tt2==bestlu(ttindex(1)+1))|(tt2==bestlu(end));
        else
            set = (tt2==bestlu(ttindex(1)+1))|(tt2==bestlu(ttindex(1)-1));
        end
        if (set)
            % ������·�������������Ϣ��
            detatij(tt1,tt2) = detatij(tt1,tt2)+deta;
        end
    end
end
tij = (1-p)*tij+detatij;     %��Ϣ�ظ���
tabu = [[],tabu(:,1)];       %���½��ɱ�
%tabu = round(rand(5,1)*(10-1))+1;
end