function [ gencode ] = encode(gen)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%encode���� G����
%gencode ������ gen ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[sizex,sizey] = size(gen);   %ά��
gencode = zeros(sizex,sizey);%��ʼ��
for i = 1:sizex              %ѭ����Ⱥ
  for tt = 1:sizey           %ѭ������
    inde = sort(gen(i,tt:end)); %����
    index = find(inde ==gen(i,tt)); %�ҵ�����ֵ
    gencode(i,tt) = index;   %�������ֵ
  end
end
end