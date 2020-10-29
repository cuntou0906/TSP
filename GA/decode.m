function [ gen ] = decode(gencode)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%decode（） G解码
%gencode 编码结果 gen 解码结果
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[sizex,sizey] = size(gencode); %维度
gen = zeros(sizex,sizey);      %初始化
for i = 1:sizex                %循环种群
  intcode = 2:sizey+1;         %初始化个体
  for tt = 1:sizey             %找到位置
    gen(i,tt) = intcode(gencode(i,tt));
    intcode(gencode(i,tt))=[]; %删除对应的值
  end
end
end