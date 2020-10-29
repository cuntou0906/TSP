function [newgen] = jiaocha(gen ,fitvalue, pc ,method)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% jiaocha() 交叉操作 newgen 交叉后结果
% gen 初始种群 ,fitvalue,适应度
% pc交叉概率  ,method 交叉方法
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if strcmp(method,'xunhuan')          %循环交叉
   [sizex,sizey] = size(gen);        %大小 维度
   newgen = zeros(sizex,sizey);      %初始化
   [maxfitvalue,maxvalueindex] = max(fitvalue);
   newgen(1,:) = gen(maxvalueindex,:);%保留最优个体
   gen(maxvalueindex,:)=gen(1,:);    %替换最优个体
   for item = 2:2:sizex-1
     p =rand(1);
     if(p<=pc)                       %交叉
       index=1;                      %当前多索引 
       indexall =[];                 %历史索引
       for t = 1:sizey
         indexall =[indexall,index]; %保存当前索引
         if(gen(item+1,index)==gen(item,1))
             break;                  %一个循环体轮回
         else                        %找到下一个索引
             index = find(gen(item,:) == gen(item+1,index));
         end
       end
       inter = gen(item,indexall);   %找到交换值
       gen(item,indexall) = gen(item+1,indexall);
       gen(item+1,indexall) = inter; %交换对应位置
       newgen(item,:) = gen(item,:); %保存交换结果
       newgen(item+1,:) = gen(item+1,:);
       else %不交叉
       newgen(item,:) = gen(item,:); %直接保存结果
       newgen(item+1,:) = gen(item+1,:);
     end
   end
elseif strcmp(method,'dandian')
   gencode = encode(gen);            %G编码
   [sizex,sizey] = size(gencode);    %大小 维度
   newgencode = zeros(sizex,sizey);  %初始化
   [maxfitvalue,maxvalueindex] = max(fitvalue); %保留最优个体
   newgencode(1,:) = gencode(maxvalueindex,:);  %替换最优个体
   gencode(maxvalueindex,:)=gencode(1,:);
   for item = 2:2:sizex-1                       %循环个体
       p =rand(1);                               %随机数
       if(p<=pc)                                 %交叉
           inde = 1+floor(rand(1)*(sizey-1));
           out = gencode(item,inde:end);         %火速单点交叉的值
           gencode(item,inde:end) = gencode(item+1,inde:end);
           gencode(item+1,inde:end)=out;         
           newgencode(item,:) = gencode(item,:); %保留交叉结果
           newgencode(item+1,:) = gencode(item+1,:);
       else                                      %不交叉
           newgencode(item,:) = gencode(item,:); %直接保留个体
           newgencode(item+1,:) = gencode(item+1,:);
       end
   end 
   newgen = decode(newgencode);
end

end