function [ newgen ] = bianyi(gen,fitvalue,pa,method)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%bianyi() 变异操作  method 变异方法
%gen 种群,fitvalue, 适应度 pa,变异概率
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if strcmp(method,'nizhuan')          %逆转变异
   [sizex,sizey] = size(gen);        %种群大小和维度
   newgen = zeros(sizex,sizey);      %初始化
   [maxfitvalue,maxvalueindex] = max(fitvalue);
   newgen(1,:) = gen(maxvalueindex,:);%保留最优个体
   gen(maxvalueindex,:)=gen(1,:);     %替换最优个体
   for item = 2:sizex
     p =rand(1);
     if(p<=pa)                       %变异
         newgen(item,:) = gen(item,:);
         in1 =1+floor((sizey-1)*rand(1));      %变异位置1
         in2 =in1+floor((sizey-in1)*rand(1));  %变异位置2
         oust = gen(item,in1:in2);             %获取变异片段
         oust =oust(end:-1:1);                 %反转
         newgen(item,in1:in2)=oust;            %保留变异结果
     else                                      %不变异
         newgen(item,:) = gen(item,:);         %直接保留个体
     end
   end
elseif strcmp(method,'changgui')               %常规变异
   gencode = encode(gen);                      %G编码
   [sizex,sizey] = size(gencode);              %种群维度和大小
   newgencode = zeros(sizex,sizey);            %初始化
   [maxfitvalue,maxvalueindex] = max(fitvalue);%保留最优个体
   newgencode(1,:) = gencode(maxvalueindex,:); %替换最优个体
   gencode(maxvalueindex,:)=gencode(1,:);
   for item = 2:sizex
       p =rand(1);
       if(p<=pa)                               %变异
             in1 =1+floor((sizey-1)*rand(1));  %变异位置
             in2 =1+floor((sizey-in1)*rand(1));%变异值
             newgencode(item,:) = gencode(item,:);
             newgencode(item,in1) = in2;       %保留变异后结果
       else                                    %不变异
           newgencode(item,:) = gencode(item,:);%直接保留个体
       end
   end 
   newgen = decode(newgencode);                 %解码
end

end