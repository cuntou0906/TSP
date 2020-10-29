function [ gen ] = initgen( gensize,ransize )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initgen() 初始化种群
%gensize种群大小 ransize维度
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gen =zeros(gensize,ransize);        %初始化
for i = 1:gensize
    t = 2:ransize+1;                %生成初始访问
    ranorder = randperm(ransize);   %乱序排列
    gen(i,:)=t(ranorder);
end

end

