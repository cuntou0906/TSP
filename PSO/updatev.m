function [ newv ] = updatev( v,w,pos,pid,pgd)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% updatev()�����ӵ��ٶȸ���
% pos��λ��    v���ٶ�  w��Ȩ��
%pid ��������  pgd ȫ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[posx,posy] = size(pos);    %��ȥά��
v1=[];v2=[];v3=[];          %������������
v22=zeros(posx,(posy-1)*2); %��ʼ��
v33=zeros(posx,(posy-1)*2);
% r1= round(1);r2=round(1);
r1= 0.7;r2=0.7;             %ѧϰ����
for i = 1:posx              %���㵱ǰλ��������λ�õĲ�
    v22(i,:) = find_jhz(pid(i,:),pos(i,:));
    v33(i,:) = find_jhz(pgd,pos(i,:));
end
for i = 1:posx              %ѭ��������������
    v1 = [v1;fiel(v(i,:),w)]; 
    v2 = [v2;fiel(v22(i,:),r1)];
    v3 = [v3;fiel(v33(i,:),r2)];
end
    newv = [v1 v2 v3 ];     %�ϲ��������� �����ٶ�
end
