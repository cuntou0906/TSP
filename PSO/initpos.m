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
end
