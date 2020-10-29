function [ newgen ] = select( gen,fitvalue,method)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% select()��ѡ�����      gen:��Ⱥ
% fitvalue ��Ⱥ��Ӧ��     method ѡ�񷽷�
% newgen ��ѡ������Ⱥ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%  ���̶�ѡ�񷽷�  %%%%%%%
if strcmp(method,'lunpan')
  [gensizex,gensizey] = size(gen);%��ȡ��Ⱥ��ά�� genx ��Ⱥ����
  totalfit = sum(fitvalue);        %������Ӧ���ܺ�
  p_fitvalue = fitvalue/totalfit;  %����ÿ���������Ӧ�ȸ���
  p_fitvalue = cumsum(p_fitvalue); %�ۼӺ���
  randdata = sort(rand(gensizex,1));%��С�������� %sort��������
  newgen = zeros(gensizex,gensizey);%��ʼ������Ⱥ
  fitindex = 1;                    %ѭ������
  newin = 1;                       %ѭ������
  while newin<=gensizex            %ѭ�� ���̶ķ�ѡ�����    
    if(randdata(newin))<p_fitvalue(fitindex)
        newgen(newin,:) = gen(fitindex,:);
        newin = newin+1;
    else
        fitindex = fitindex+1;
    end
  end
%%%%%%%  ������ѡ�񷽷�  %%%%%%%
elseif strcmp(method,'jinbiao')     %��������
  [gensizex,gensizey] = size(gen);  %��ȡ��Ⱥ��ά�� genx ��Ⱥ���� 
  newgen = zeros(gensizex,gensizey);%��ʼ������Ⱥ
  sizeindex = round(0.5*gensizex);  %��ȡ������Ϊ��Ⱥ��С��һ��
  for i = 1:gensizex                %ѭ����ȡ�µ���Ⱥ
    indext = round(1+rand(sizeindex,1)*(gensizex-1));%���ѡ��һ�������ĸ���
    [maxgen,indexmax] = max(fitvalue(indext));%�ҵ���Ӧ�����ĸ���
    newgen(i,:) = gen(indexmax,:);
  end

end
end