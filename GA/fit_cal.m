function [ fitvalue ] = fit_cal(pos,dist_city)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fit_cal() 适应度计算
% pos 粒子群 dist_city 城市距离
% fitvalue = 2/distance;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[sizex,sizey] = size(pos);   %获取粒子群维度
newgen = ones(sizex,sizey+2);%初始化
newgen(:,2:end-1)=pos;       %加入首尾城市
fitvalue = zeros(sizex,1);   %初始化适应度
for i = 1:sizex    %循环计算每一个种群的适应度
    dist = 0;
    for j = 1:size(newgen,2)-1 %迭代计算距离
        dist =dist +dist_city(newgen(i,j),newgen(i,j+1));
    end
    fitvalue(i) = dist;        %保存距离值
end          
fitvalue = 2*ones(size(fitvalue))./fitvalue;%计算适应度
end