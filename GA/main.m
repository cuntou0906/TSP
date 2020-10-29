%city = [0 0;roundn(10*rand(9,2),-2)]  %先用随机产生十个城市
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
gendai = 100;                          %演化代数
gensize = 51;                          %种群大小
ransize = citynum-1;                   %染色体大小
gen = initgen( gensize,ransize );      %初始化种群
pc = 0.9; %交叉概率
pa = 0.07;%变异概率
%plot(city(:,1),city(:,2),'*')

fitvalue = fit_cal( gen,dist_city);    %适应度就算
maxfitvalueall = [[],max(fitvalue)];
for index = 1:gendai
  gen = select( gen,fitvalue,'lunpan');       %选择操作
  gen = jiaocha(gen ,fitvalue, pc ,'xunhuan');%交叉操作
  gen = bianyi(gen,fitvalue,pa,'nizhuan');%变异操作
  fitvalue = fit_cal( gen,dist_city);    %适应度就算
  maxfitvalueall = [maxfitvalueall,max(fitvalue)];
end
[fin_fit,max_fit_index] =max(fitvalue);
lu_bin = gen(max_fit_index,:);           %适应度最大的路径
%%%%%%   计算最短路径        %%%%%%
min_distance = 0;
    for j = 1:length(lu_bin)-1
        min_distance =min_distance +...
            dist_city(lu_bin(1,j),lu_bin(1,j+1));
    end
min_distance = min_distance+dist_city(1,lu_bin(1,1))+...
    dist_city(lu_bin(1,end),1);
disp(strcat('最短距离为：',num2str(min_distance)))
%%%%%%  将首末位置加入绘图   %%%%%%
dit_lu = zeros(citynum+1,2);
dit_lu(1,:) =city(1,:); 
dit_lu(end,:) =city(1,:); 
for i =2: citynum
    dit_lu(i,:) = city(lu_bin(i-1),:);
end
figure(1)
hold on;grid on;                            %保持图像 开启网格
plot(city(:,1),city(:,2),'r*','linewidth',5)%绘制城市
plot(dit_lu(:,1),dit_lu(:,2),'linewidth',2) %绘制路径
title('10城市TSP问题')                      %标题
for i =1:citynum                            %添加城市名字
    text(city(i,1)+0.1,city(i,2),strcat('城市',num2str(i)))
end
figure(2)
plot(maxfitvalueall)
grid on; xlabel('迭代次数/n')               %开启网格
ylabel('适应度'); title('各代最大适应度')    %坐标轴名称 标题