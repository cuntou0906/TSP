function [ distance ] = caldis(tabu,dist_city)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% caldis() 信息素更新
% tuba 禁忌表 distance 距离
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tabu = [tabu ,tabu(:,1)];    %回到起始点
distance = zeros(size(tabu,1),1);  %初始化距离
for i = 1:size(tabu,1)       %循环计算每一只蚂蚁的距离
    dist = 0;
    for j = 1:size(tabu,2)-1 %迭代计算距离
        dist =dist +dist_city(tabu(i,j),tabu(i,j+1));
    end
    distance(i) = dist;      %保存距离值
end          
end