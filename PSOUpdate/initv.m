function [ v ] = initv( pasize,padim ) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initv( pasize,padim ) ��ʼ���ٶ�
% pasize����Ⱥ��С padimά��
%ÿ������Ԫ��Ϊһ��������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v =floor(1+(padim-1)*rand(pasize,(padim-1)*2));
end