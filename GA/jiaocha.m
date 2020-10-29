function [newgen] = jiaocha(gen ,fitvalue, pc ,method)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% jiaocha() ������� newgen �������
% gen ��ʼ��Ⱥ ,fitvalue,��Ӧ��
% pc�������  ,method ���淽��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if strcmp(method,'xunhuan')          %ѭ������
   [sizex,sizey] = size(gen);        %��С ά��
   newgen = zeros(sizex,sizey);      %��ʼ��
   [maxfitvalue,maxvalueindex] = max(fitvalue);
   newgen(1,:) = gen(maxvalueindex,:);%�������Ÿ���
   gen(maxvalueindex,:)=gen(1,:);    %�滻���Ÿ���
   for item = 2:2:sizex-1
     p =rand(1);
     if(p<=pc)                       %����
       index=1;                      %��ǰ������ 
       indexall =[];                 %��ʷ����
       for t = 1:sizey
         indexall =[indexall,index]; %���浱ǰ����
         if(gen(item+1,index)==gen(item,1))
             break;                  %һ��ѭ�����ֻ�
         else                        %�ҵ���һ������
             index = find(gen(item,:) == gen(item+1,index));
         end
       end
       inter = gen(item,indexall);   %�ҵ�����ֵ
       gen(item,indexall) = gen(item+1,indexall);
       gen(item+1,indexall) = inter; %������Ӧλ��
       newgen(item,:) = gen(item,:); %���潻�����
       newgen(item+1,:) = gen(item+1,:);
       else %������
       newgen(item,:) = gen(item,:); %ֱ�ӱ�����
       newgen(item+1,:) = gen(item+1,:);
     end
   end
elseif strcmp(method,'dandian')
   gencode = encode(gen);            %G����
   [sizex,sizey] = size(gencode);    %��С ά��
   newgencode = zeros(sizex,sizey);  %��ʼ��
   [maxfitvalue,maxvalueindex] = max(fitvalue); %�������Ÿ���
   newgencode(1,:) = gencode(maxvalueindex,:);  %�滻���Ÿ���
   gencode(maxvalueindex,:)=gencode(1,:);
   for item = 2:2:sizex-1                       %ѭ������
       p =rand(1);                               %�����
       if(p<=pc)                                 %����
           inde = 1+floor(rand(1)*(sizey-1));
           out = gencode(item,inde:end);         %���ٵ��㽻���ֵ
           gencode(item,inde:end) = gencode(item+1,inde:end);
           gencode(item+1,inde:end)=out;         
           newgencode(item,:) = gencode(item,:); %����������
           newgencode(item+1,:) = gencode(item+1,:);
       else                                      %������
           newgencode(item,:) = gencode(item,:); %ֱ�ӱ�������
           newgencode(item+1,:) = gencode(item+1,:);
       end
   end 
   newgen = decode(newgencode);
end

end