function [ pos ] = updatepos( pos,v )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% updatepos( pos,v )对粒子的位置更新
% pos：位置    v：速度
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[vx,vy] = size(v);     %粒子群维度和大小
for i = 1:vx           %循环每个粒子
    for j =1:vy/2      %对每个交换子运算
        tt = pos(i,v(i,2*j-1)); 
        pos(i,v(i,2*j-1)) = pos(i,v(i,2*j));
        pos(i,v(i,2*j))=tt;  %更新位置
    end
end
end
