%city = [0 0;roundn(10*rand(9,2),-2)];  %�����������ʮ������
clear;clc;
city =[0.0000 0.0000; 5.2100 8.8500;   %[0,10]��Χ�ڵ��������
       4.8900 7.9600; 6.2400 0.9900;
       6.7900 2.6200; 3.9600 3.3500;
       3.6700 6.8000; 9.8800 1.3700;
       0.3800 7.2100; 2.3200 9.1300;];
 citynum = size(city,1);
dist_city = zeros(citynum,citynum);   %��ʼ�����о���
for i = 1:citynum                     %�������֮��ľ���
    for j = 1:citynum
        link = (city(j,1)-city(i,1)).^2+(city(j,2)-city(i,2)).^2;
        dist_city(i,j)=sqrt(link);
    end
end
NC = 2000;                            %��������
tij_ori = 1000;                       %��ʼ��Ϣ��
m = 20;                               %������������
p= 0.01;                              %����ϵ��
tlim =[0 1000];                       %��Ϣ�صķ�Χ
a = 1; b = 3;                         %�̶�
dist_city = dist_city + 10000*eye(size(dist_city));  %��i-i�ľ������úܴ�
nij = ones(size(dist_city))./dist_city; %������ߵĵ��� �Խ��ߺ�С
tij = tij_ori*(ones(citynum,citynum)-eye(citynum,citynum));
lasttij = tij;
tabu = round(rand(m,1)*(citynum-1))+1;
item = 1; %������
while(1)
    if (item>NC)
        break;
    end;
    disp(['��',num2str(item),'����']);
    item = item+1;                              %��������1
    tabu = calculate( nij,tij,tabu,m,a,b,citynum);
    lujing = tabu;
    lasttij = tij;
     [ tabu,tij ] = updatexinxisu(tabu,tij,dist_city,p);
     if (sum(sum(lasttij-tij,2),1)==0)
        break;
    end;
end
distance = caldis(lujing,dist_city);            %�������
[mindis,minindex] = min(distance);              %�ҵ�����·��
disp(['����·��Ϊ��',num2str(mindis)]);
shuxu = [lujing(minindex,:),lujing(minindex,1)];%�������˳��
dit_lu = zeros(length(shuxu),2);                %��������
for i = 1:length(shuxu)
    dit_lu(i,:) = city(shuxu(i),:);
end
figure(1)
hold on;grid on;                              %����ͼ�� ��������
plot(city(:,1),city(:,2),'r*','linewidth',5)  %���Ƴ���
plot(dit_lu(:,1),dit_lu(:,2),'linewidth',2)   %����·��
title('10����TSP����')                         %����
for i =1:citynum                              %��ӳ�������
    text(city(i,1)+0.1,city(i,2),strcat('����',num2str(i)))
end
figure(2)
hold on;grid on;
plot(city(:,1),city(:,2),'r*','linewidth',5)  %���Ƴ���
maxtij = max(max(tij));                       %�����ֵ
ttij = tij/maxtij*2;
index = find(ttij<10^-3);                     %����Ϣ�ع�С����Ϊ0
ttij(index) =0*ones(length(index),1) ;
for i=1:size(tij,1)
    for j=1:size(tij,2)
        if (i~=j)&&(ttij(i,j)~=0)             %ѭ�����Ƴ��м����Ϣ��
        plot([city(i,1);city(j,1)],[city(i,2);city(j,2)],...
            'LineWidth',ttij(i,j));
        end
    end
end
title('���м���Ϣ��')                          %����
for i =1:citynum                              %��ӳ�������
    text(city(i,1)+0.1,city(i,2),strcat('����',num2str(i)))
end