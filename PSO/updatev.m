function [ newv ] = updatev( v,w,pos,pid,pgd)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% updatev()对粒子的速度更新
% pos：位置    v：速度  w：权重
%pid 个体最优  pgd 全局最优
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[posx,posy] = size(pos);    %回去维度
v1=[];v2=[];v3=[];          %定义三个分量
v22=zeros(posx,(posy-1)*2); %初始化
v33=zeros(posx,(posy-1)*2);
% r1= round(1);r2=round(1);
r1= 0.7;r2=0.7;             %学习因子
for i = 1:posx              %计算当前位置与最优位置的差
    v22(i,:) = find_jhz(pid(i,:),pos(i,:));
    v33(i,:) = find_jhz(pgd,pos(i,:));
end
for i = 1:posx              %循环计算三个分量
    v1 = [v1;fiel(v(i,:),w)]; 
    v2 = [v2;fiel(v22(i,:),r1)];
    v3 = [v3;fiel(v33(i,:),r2)];
end
    newv = [v1 v2 v3 ];     %合并三个分量 更新速度
end
