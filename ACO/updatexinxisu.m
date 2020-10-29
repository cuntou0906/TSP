function [ tabu,tij ] = updatexinxisu(tabu,tij,dist_city,Q,p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% updatexinxisu() 信息素更新
% tuba 禁忌表,tij 信息素,dist_city城市距离
% Q 初始信息素 p 蒸发系数
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tabu = [tabu ,tabu(:,1)];    %回到起始点
distance = caldis(tabu,dist_city);      
deta = Q*ones(size(distance))./distance; %计算平均信息素
[sizex,sizey] = size(tabu);  %获取尺寸
detatij = zeros(size(tij));  %初始化信息素变化矩阵
for i = 1:sizex             
    for j = 1:sizey-1
        tt1 = tabu(i,j);
        tt2 = tabu(i,j+1);
        detatij(tt1,tt2) = deta(i);
        %detatij(tt2,tt1) = deta(i);
    end
end
tij = (1-p)*tij+detatij;     %信息素更新
tabu = [[],tabu(:,1)];       %更新禁忌表
%tabu = round(rand(5,1)*(10-1))+1;
end