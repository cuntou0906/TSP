function [ jhz ] = find_jhz(pbest,x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%find_jhzѰ����������� ��x->pbest
% jhz ����õ��Ľ�����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
len = length(pbest);    %��ȡ����
jhz = ones((len-1)*2,1);%��ʼ��������
for i =1:len-1          %ѭ������
    index = find(x == pbest(i));
    if i~=index         %�Ƿ���Ҫ����
       jhz(2*i-1) = i;
       jhz(2*i) = index;
    end
    tt = x(index);      %��������λ��ֵ
    x(index) =x(i);
    x(i) = tt;
end
end

