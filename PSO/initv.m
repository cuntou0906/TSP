function [ v ] = initv( pasize,padim ) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initv( pasize,padim ) 初始化速度
% pasize粒子群大小 padim维度
%每行两两元素为一个交换子
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v =floor(1+(padim-1)*rand(pasize,(padim-1)*2));
end