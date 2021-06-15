function [ pos ] = initpos( pasize,padim )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initpos(）初始化粒子群
% pasize粒子群大小 padim维度
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    pos =zeros(pasize,padim);         %初始化
    for i = 1:pasize
        t = 2:padim+1;                %生成初始访问
        ranorder = randperm(padim);   %乱序排列
        pos(i,:)=t(ranorder);         %生成粒子
    end

    % change city to the first city
    for i = 1:pasize
        t = find(pos(i,:)==8);    % index of city 8 
        temp = pos(i,t);     % city 8
        pos(i,t) = pos(i,1);
        pos(i,1) = temp;   
    end
    
end
