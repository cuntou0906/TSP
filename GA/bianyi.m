function [ newgen ] = bianyi(gen,fitvalue,pa,method)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%bianyi() �������  method ���췽��
%gen ��Ⱥ,fitvalue, ��Ӧ�� pa,�������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if strcmp(method,'nizhuan')          %��ת����
   [sizex,sizey] = size(gen);        %��Ⱥ��С��ά��
   newgen = zeros(sizex,sizey);      %��ʼ��
   [maxfitvalue,maxvalueindex] = max(fitvalue);
   newgen(1,:) = gen(maxvalueindex,:);%�������Ÿ���
   gen(maxvalueindex,:)=gen(1,:);     %�滻���Ÿ���
   for item = 2:sizex
     p =rand(1);
     if(p<=pa)                       %����
         newgen(item,:) = gen(item,:);
         in1 =1+floor((sizey-1)*rand(1));      %����λ��1
         in2 =in1+floor((sizey-in1)*rand(1));  %����λ��2
         oust = gen(item,in1:in2);             %��ȡ����Ƭ��
         oust =oust(end:-1:1);                 %��ת
         newgen(item,in1:in2)=oust;            %����������
     else                                      %������
         newgen(item,:) = gen(item,:);         %ֱ�ӱ�������
     end
   end
elseif strcmp(method,'changgui')               %�������
   gencode = encode(gen);                      %G����
   [sizex,sizey] = size(gencode);              %��Ⱥά�Ⱥʹ�С
   newgencode = zeros(sizex,sizey);            %��ʼ��
   [maxfitvalue,maxvalueindex] = max(fitvalue);%�������Ÿ���
   newgencode(1,:) = gencode(maxvalueindex,:); %�滻���Ÿ���
   gencode(maxvalueindex,:)=gencode(1,:);
   for item = 2:sizex
       p =rand(1);
       if(p<=pa)                               %����
             in1 =1+floor((sizey-1)*rand(1));  %����λ��
             in2 =1+floor((sizey-in1)*rand(1));%����ֵ
             newgencode(item,:) = gencode(item,:);
             newgencode(item,in1) = in2;       %�����������
       else                                    %������
           newgencode(item,:) = gencode(item,:);%ֱ�ӱ�������
       end
   end 
   newgen = decode(newgencode);                 %����
end

end