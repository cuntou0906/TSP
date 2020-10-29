function [ tabu ] = calculate( nij,tij,tabu,m,a,b,citynum)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calculate() 用于计算每一个周游
% nij 距离的倒数 tij 信息素  a 信息素重要程度 b 启发因子重要程度
% tabu 禁忌表 newtabu 路径（禁忌表）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tn = zeros(citynum,citynum,m); % 初始化概率的分子项
for i = 1:m                    % 初始化tn
   tn(:,:,i) = (nij.^a).*(tij.^b);
end
while(1)
    if(size(tabu,2)>=citynum)  %判断禁忌表是否满
        break
    end
    tabu = [tabu,zeros(m,1)];
    for i = 1:m                %循环每一只蚂蚁将不可以去的城市
        %disp(['第',num2str(i),'蚂蚁']);
        tn(:,tabu(i,end-1),i) = zeros(citynum,1); %将不可去的城市置零
        p = tn(tabu(i,end-1),:,i)/(sum(tn(tabu(i,end-1),:,i)));%计算概率
        seccity =  select(p);  %选择城市
        tabu(i,end) = seccity; %将城市加入禁忌表
    end
    
end

