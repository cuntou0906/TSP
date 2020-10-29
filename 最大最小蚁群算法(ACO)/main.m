%city = [0 0;roundn(10*rand(9,2),-2)];  %先用随机产生十个城市
clear;clc;
city =[0.0000 0.0000; 5.2100 8.8500;   %[0,10]范围内的随机城市
       4.8900 7.9600; 6.2400 0.9900;
       6.7900 2.6200; 3.9600 3.3500;
       3.6700 6.8000; 9.8800 1.3700;
       0.3800 7.2100; 2.3200 9.1300;];
 citynum = size(city,1);
dist_city = zeros(citynum,citynum);   %初始化城市距离
for i = 1:citynum                     %计算城市之间的距离
    for j = 1:citynum
        link = (city(j,1)-city(i,1)).^2+(city(j,2)-city(i,2)).^2;
        dist_city(i,j)=sqrt(link);
    end
end
NC = 2000;                            %迭代次数
tij_ori = 1000;                       %初始信息素
m = 20;                               %定义蚂蚁数量
p= 0.01;                              %蒸发系数
tlim =[0 1000];                       %信息素的范围
a = 1; b = 3;                         %程度
dist_city = dist_city + 10000*eye(size(dist_city));  %将i-i的距离设置很大
nij = ones(size(dist_city))./dist_city; %计算各边的倒数 对角线很小
tij = tij_ori*(ones(citynum,citynum)-eye(citynum,citynum));
lasttij = tij;
tabu = round(rand(m,1)*(citynum-1))+1;
item = 1; %计数器
while(1)
    if (item>NC)
        break;
    end;
    disp(['第',num2str(item),'迭代']);
    item = item+1;                              %迭代器加1
    tabu = calculate( nij,tij,tabu,m,a,b,citynum);
    lujing = tabu;
    lasttij = tij;
     [ tabu,tij ] = updatexinxisu(tabu,tij,dist_city,p);
     if (sum(sum(lasttij-tij,2),1)==0)
        break;
    end;
end
distance = caldis(lujing,dist_city);            %距离计算
[mindis,minindex] = min(distance);              %找到最优路径
disp(['最优路径为：',num2str(mindis)]);
shuxu = [lujing(minindex,:),lujing(minindex,1)];%计算城市顺序
dit_lu = zeros(length(shuxu),2);                %城市坐标
for i = 1:length(shuxu)
    dit_lu(i,:) = city(shuxu(i),:);
end
figure(1)
hold on;grid on;                              %保持图像 开启网格
plot(city(:,1),city(:,2),'r*','linewidth',5)  %绘制城市
plot(dit_lu(:,1),dit_lu(:,2),'linewidth',2)   %绘制路径
title('10城市TSP问题')                         %标题
for i =1:citynum                              %添加城市名字
    text(city(i,1)+0.1,city(i,2),strcat('城市',num2str(i)))
end
figure(2)
hold on;grid on;
plot(city(:,1),city(:,2),'r*','linewidth',5)  %绘制城市
maxtij = max(max(tij));                       %找最大值
ttij = tij/maxtij*2;
index = find(ttij<10^-3);                     %将信息素过小的设为0
ttij(index) =0*ones(length(index),1) ;
for i=1:size(tij,1)
    for j=1:size(tij,2)
        if (i~=j)&&(ttij(i,j)~=0)             %循环绘制城市间的信息素
        plot([city(i,1);city(j,1)],[city(i,2);city(j,2)],...
            'LineWidth',ttij(i,j));
        end
    end
end
title('城市间信息素')                          %标题
for i =1:citynum                              %添加城市名字
    text(city(i,1)+0.1,city(i,2),strcat('城市',num2str(i)))
end