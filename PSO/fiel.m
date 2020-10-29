function [ newv ] = fiel(v , r)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%fiel(): 筛选欠r个交换子 r筛选比例
% v newv 筛选前后的速度
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
index = length(v)/2;  %获取交换子个数
len = round(index*r); %计算筛选个数
newv = v(1:2*len);    %保留前len个
end