city =[0.0000 0.0000; 5.2100 8.8500;   %[0,10]��Χ�ڵ��������
       4.8900 7.9600; 6.2400 0.9900;
       6.7900 2.6200; 3.9600 3.3500;
       3.6700 6.8000; 9.8800 1.3700;
       0.3800 7.2100; 2.3200 9.1300;];
citynum = size(city,1);               %��������
dist_city = zeros(citynum,citynum);   %��ʼ�����о���
for i = 1:citynum                     %�������֮��ľ���
    for j = 1:citynum                 
        link = (city(j,1)-city(i,1)).^2+(city(j,2)-city(i,2)).^2;
        dist_city(i,j)=sqrt(link);
    end
end
padai =  2000;                   %�ݻ�����
pasize = 81;                   %������Ŀ
padim = citynum-1;              %ά��
pos = initpos( pasize,padim );  %��ʼ��λ��
v = initv( pasize,padim );%��ʼ���ٶ�
pbest =zeros(pasize,1); %��������������Ӧ��
pid =zeros(size(pos));  %�������Ӷ�Ӧ��λ��
w = 0.9;                %Ȩ��
maxgbest = zeros(1);    %����������������Ӧ��
maxpgd = zeros(1,size(pos,2)); %��������ȫ������λ��
maxfitvalueall = [];    %����������Ӧ��
for item = 1:padai     %�ݻ�
    fitvalue = fit_cal(pos,dist_city); %��Ӧ�ȼ���
    %%%%%%  ���¸������ź�ȫ������   %%%%%%
    [ pbest,pid,gbest,pgd ] = fit_cmp(pos,fitvalue,pbest,pid);
    v = updatev( v,w,pos,pid,pgd); %�����ٶ�
    pos = updatepos( pos,v );      %����λ��
    w = w - (w-0.01)/padai;        %Ȩ�ظ���
    maxfitvalueall =[maxfitvalueall,maxgbest];
     if (gbest>maxgbest)           %������������
         maxgbest = gbest;         %������Ӧ��
         maxpgd = pgd;             %��������
     end
end
[fin_fit,max_fit_index] =max(fitvalue);
lu_bin = pos(max_fit_index,:); %��Ӧ������·��
if(maxgbest>fin_fit)           %��������
    lu_bin = pgd;
end
%%%%%%   �������·��        %%%%%%
min_distance = 0;
    for j = 1:length(lu_bin)-1
        min_distance =min_distance +dist_city(lu_bin(1,j),lu_bin(1,j+1));
    end
min_distance = min_distance+dist_city(1,lu_bin(1,1))+...
    dist_city(lu_bin(1,end),1);
disp(strcat('��̾���Ϊ��',num2str(min_distance))) %�����̾���
%%%%%%  ����ĩλ�ü����ͼ   %%%%%%
dit_lu = zeros(citynum+1,2);
dit_lu(1,:) =city(1,:); 
dit_lu(end,:) =city(1,:); 
for i =2: citynum
    dit_lu(i,:) = city(lu_bin(i-1),:);
end
figure(1)
hold on;grid on;         %����ͼ�� ��������
plot(city(:,1),city(:,2),'r*','linewidth',5)  %���Ƴ���
plot(dit_lu(:,1),dit_lu(:,2),'linewidth',2)   %��������·��
title('10����TSP����')                         %����
for i =1:citynum                              %��ӳ�����
    text(city(i,1)+0.1,city(i,2),strcat('����',num2str(i)))
end
figure(2)
plot(maxfitvalueall)                         %����
grid on; xlabel('��������/n')                 %��������
ylabel('��Ӧ��'); title('�ݻ����������Ӧ��')  %���� ���������