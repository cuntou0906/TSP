function [ newv ] = fiel(v , r)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%fiel(): ɸѡǷr�������� rɸѡ����
% v newv ɸѡǰ����ٶ�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
index = length(v)/2;  %��ȡ�����Ӹ���
len = round(index*r); %����ɸѡ����
newv = v(1:2*len);    %����ǰlen��
end