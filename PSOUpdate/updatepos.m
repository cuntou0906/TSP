function [ pos ] = updatepos( pos,v )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% updatepos( pos,v )�����ӵ�λ�ø���
% pos��λ��    v���ٶ�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[vx,vy] = size(v);     %����Ⱥά�Ⱥʹ�С
for i = 1:vx           %ѭ��ÿ������
    for j =1:vy/2      %��ÿ������������
        tt = pos(i,v(i,2*j-1)); 
        pos(i,v(i,2*j-1)) = pos(i,v(i,2*j));
        pos(i,v(i,2*j))=tt;  %����λ��
    end
end

    for i = 1:vx
        t = find(pos(i,:)==8);    % index of city 8 
        temp = pos(i,t);     % city 8
        pos(i,t) = pos(i,1);
        pos(i,1) = temp;   
    end
    
end
