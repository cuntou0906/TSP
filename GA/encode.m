function [ gencode ] = encode(gen)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%encode（） G编码
%gencode 编码结果 gen 解码结果
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[sizex,sizey] = size(gen);   %维度
gencode = zeros(sizex,sizey);%初始化
for i = 1:sizex              %循环种群
  for tt = 1:sizey           %循环个体
    inde = sort(gen(i,tt:end)); %排序
    index = find(inde ==gen(i,tt)); %找到编码值
    gencode(i,tt) = index;   %保存编码值
  end
end
end