function [ jhz ] = find_jhz(pbest,x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%find_jhz寻求基本交换子 由x->pbest
% jhz 计算得到的交换子
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
len = length(pbest);    %获取长度
jhz = ones((len-1)*2,1);%初始化交互子
for i =1:len-1          %循环计算
    index = find(x == pbest(i));
    if i~=index         %是否需要交换
       jhz(2*i-1) = i;
       jhz(2*i) = index;
    end
    tt = x(index);      %交换两个位置值
    x(index) =x(i);
    x(i) = tt;
end
end

