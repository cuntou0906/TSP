%city = [0 0;roundn(10*rand(9,2),-2)]  %�����������ʮ������
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
gendai = 100;                          %�ݻ�����
gensize = 51;                          %��Ⱥ��С
ransize = citynum-1;                   %Ⱦɫ���С
gen = initgen( gensize,ransize );      %��ʼ����Ⱥ
pc = 0.9; %�������
pa = 0.07;%�������
%plot(city(:,1),city(:,2),'*')

fitvalue = fit_cal( gen,dist_city);    %��Ӧ�Ⱦ���
maxfitvalueall = [[],max(fitvalue)];
for index = 1:gendai
  gen = select( gen,fitvalue,'lunpan');       %ѡ�����
  gen = jiaocha(gen ,fitvalue, pc ,'xunhuan');%�������
  gen = bianyi(gen,fitvalue,pa,'nizhuan');%�������
  fitvalue = fit_cal( gen,dist_city);    %��Ӧ�Ⱦ���
  maxfitvalueall = [maxfitvalueall,max(fitvalue)];
end
[fin_fit,max_fit_index] =max(fitvalue);
lu_bin = gen(max_fit_index,:);           %��Ӧ������·��
%%%%%%   �������·��        %%%%%%
min_distance = 0;
    for j = 1:length(lu_bin)-1
        min_distance =min_distance +...
            dist_city(lu_bin(1,j),lu_bin(1,j+1));
    end
min_distance = min_distance+dist_city(1,lu_bin(1,1))+...
    dist_city(lu_bin(1,end),1);
disp(strcat('��̾���Ϊ��',num2str(min_distance)))
%%%%%%  ����ĩλ�ü����ͼ   %%%%%%
dit_lu = zeros(citynum+1,2);
dit_lu(1,:) =city(1,:); 
dit_lu(end,:) =city(1,:); 
for i =2: citynum
    dit_lu(i,:) = city(lu_bin(i-1),:);
end
figure(1)
hold on;grid on;                            %����ͼ�� ��������
plot(city(:,1),city(:,2),'r*','linewidth',5)%���Ƴ���
plot(dit_lu(:,1),dit_lu(:,2),'linewidth',2) %����·��
title('10����TSP����')                      %����
for i =1:citynum                            %��ӳ�������
    text(city(i,1)+0.1,city(i,2),strcat('����',num2str(i)))
end
figure(2)
plot(maxfitvalueall)
grid on; xlabel('��������/n')               %��������
ylabel('��Ӧ��'); title('���������Ӧ��')    %���������� ����