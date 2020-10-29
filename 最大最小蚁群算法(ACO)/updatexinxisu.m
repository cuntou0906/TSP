function [ tabu,tij ] = updatexinxisu(tabu,tij,dist_city,p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% updatexinxisu() 信息素更新
% tuba 禁忌表,tij 信息素,dist_city城市距离
% Q 初始信息素 p 蒸发系数
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tabu = [tabu ,tabu(:,1)];         %回到起始点
distance = caldis(tabu,dist_city);
[mindis,minindex] = min(distance);%找到最优路径
bestlu = tabu(minindex,:);        %最优路径
deta = 1/mindis;                  %计算平均信息素
[sizex,sizey] = size(tabu);       %获取尺寸
detatij = zeros(size(tij));       %初始化信息素变化矩阵
for i = 1:sizex             
    for j = 1:sizey-1
        tt1 = tabu(i,j);     %判断是否在最优路径里面
        tt2 = tabu(i,j+1);
        ttindex = find(bestlu==tt1);
        if(ttindex(1)==1)
            set = (tt2==bestlu(ttindex(1)+1))|(tt2==bestlu(end));
        else
            set = (tt2==bestlu(ttindex(1)+1))|(tt2==bestlu(ttindex(1)-1));
        end
        if (set)
            % 在最优路径里面则更新信息素
            detatij(tt1,tt2) = detatij(tt1,tt2)+deta;
        end
    end
end
tij = (1-p)*tij+detatij;     %信息素更新
tabu = [[],tabu(:,1)];       %更新禁忌表
%tabu = round(rand(5,1)*(10-1))+1;
end