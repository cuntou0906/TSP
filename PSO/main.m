city =[0.0000 0.0000; 5.2100 8.8500;   %[0,10]范围内的随机城市
       4.8900 7.9600; 6.2400 0.9900;
       6.7900 2.6200; 3.9600 3.3500;
       3.6700 6.8000; 9.8800 1.3700;
       0.3800 7.2100; 2.3200 9.1300;];
citynum = size(city,1);               %城市数量
dist_city = zeros(citynum,citynum);   %初始化城市距离
for i = 1:citynum                     %计算城市之间的距离
    for j = 1:citynum                 
        link = (city(j,1)-city(i,1)).^2+(city(j,2)-city(i,2)).^2;
        dist_city(i,j)=sqrt(link);
    end
end
padai =  2000;                   %演化代数
pasize = 81;                   %粒子数目
padim = citynum-1;              %维度
pos = initpos( pasize,padim );  %初始化位置
v = initv( pasize,padim );%初始化速度
pbest =zeros(pasize,1); %单个粒子最优适应度
pid =zeros(size(pos));  %单个粒子对应的位置
w = 0.9;                %权重
maxgbest = zeros(1);    %整个过程中最优适应度
maxpgd = zeros(1,size(pos,2)); %整个过程全局最优位置
maxfitvalueall = [];    %各代最优适应度
for item = 1:padai     %演化
    fitvalue = fit_cal(pos,dist_city); %适应度计算
    %%%%%%  更新个体最优和全局最优   %%%%%%
    [ pbest,pid,gbest,pgd ] = fit_cmp(pos,fitvalue,pbest,pid);
    v = updatev( v,w,pos,pid,pgd); %更新速度
    pos = updatepos( pos,v );      %更新位置
    w = w - (w-0.01)/padai;        %权重更新
    maxfitvalueall =[maxfitvalueall,maxgbest];
     if (gbest>maxgbest)           %保留最优粒子
         maxgbest = gbest;         %最优适应度
         maxpgd = pgd;             %最优粒子
     end
end
[fin_fit,max_fit_index] =max(fitvalue);
lu_bin = pos(max_fit_index,:); %适应度最大的路径
if(maxgbest>fin_fit)           %最优粒子
    lu_bin = pgd;
end
%%%%%%   计算最短路径        %%%%%%
min_distance = 0;
    for j = 1:length(lu_bin)-1
        min_distance =min_distance +dist_city(lu_bin(1,j),lu_bin(1,j+1));
    end
min_distance = min_distance+dist_city(1,lu_bin(1,1))+...
    dist_city(lu_bin(1,end),1);
disp(strcat('最短距离为：',num2str(min_distance))) %输出最短距离
%%%%%%  将首末位置加入绘图   %%%%%%
dit_lu = zeros(citynum+1,2);
dit_lu(1,:) =city(1,:); 
dit_lu(end,:) =city(1,:); 
for i =2: citynum
    dit_lu(i,:) = city(lu_bin(i-1),:);
end
figure(1)
hold on;grid on;         %保持图像 开启网格
plot(city(:,1),city(:,2),'r*','linewidth',5)  %绘制城市
plot(dit_lu(:,1),dit_lu(:,2),'linewidth',2)   %绘制最优路径
title('10城市TSP问题')                         %标题
for i =1:citynum                              %添加城市名
    text(city(i,1)+0.1,city(i,2),strcat('城市',num2str(i)))
end
figure(2)
plot(maxfitvalueall)                         %绘制
grid on; xlabel('迭代次数/n')                 %开启网格
ylabel('适应度'); title('演化过程最大适应度')  %标题 左边轴名称