function [ pbest,pid,gbest,pgd ] = fit_cmp(pos,fitvalue,pbest,pid)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fit_cmp（） 更新个体和全局最优粒子和适应度
% pos当前位置 fitvalue 当前适应度
% pbest 单个粒子最优适应度 pid 单个粒子对应的位置
% gbest 全局最优适应度 pgd 全局最优位置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[max1,index1] = max(fitvalue);%找到最大适应度
gbest = max1;                 %最优适应度
pgd = pos(index1,:);          %最优粒子
for i = 1:size(pos,1)         %循环个体
    if(fitvalue(i)>pbest(i))  %找到最优适应度
        pid(i,:) = pos(i,:);  %最优适应度
        pbest(i) = fitvalue(i);%个体最优位置
    end
end
end