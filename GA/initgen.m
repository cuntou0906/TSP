function [ gen ] = initgen( gensize,ransize )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initgen() ��ʼ����Ⱥ
%gensize��Ⱥ��С ransizeά��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gen =zeros(gensize,ransize);        %��ʼ��
for i = 1:gensize
    t = 2:ransize+1;                %���ɳ�ʼ����
    ranorder = randperm(ransize);   %��������
    gen(i,:)=t(ranorder);
end

end

