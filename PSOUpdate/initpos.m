function [ pos ] = initpos( pasize,padim )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initpos(����ʼ������Ⱥ
% pasize����Ⱥ��С padimά��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    pos =zeros(pasize,padim);         %��ʼ��
    for i = 1:pasize
        t = 2:padim+1;                %���ɳ�ʼ����
        ranorder = randperm(padim);   %��������
        pos(i,:)=t(ranorder);         %��������
    end

    % change city to the first city
    for i = 1:pasize
        t = find(pos(i,:)==8);    % index of city 8 
        temp = pos(i,t);     % city 8
        pos(i,t) = pos(i,1);
        pos(i,1) = temp;   
    end
    
end
