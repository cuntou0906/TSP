function [ gen ] = decode(gencode)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%decode���� G����
%gencode ������ gen ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[sizex,sizey] = size(gencode); %ά��
gen = zeros(sizex,sizey);      %��ʼ��
for i = 1:sizex                %ѭ����Ⱥ
  intcode = 2:sizey+1;         %��ʼ������
  for tt = 1:sizey             %�ҵ�λ��
    gen(i,tt) = intcode(gencode(i,tt));
    intcode(gencode(i,tt))=[]; %ɾ����Ӧ��ֵ
  end
end
end