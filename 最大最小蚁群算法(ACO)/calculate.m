function [ tabu ] = calculate( nij,tij,tabu,m,a,b,citynum)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calculate() ���ڼ���ÿһ������
% nij ����ĵ��� tij ��Ϣ��  a ��Ϣ����Ҫ�̶� b ����������Ҫ�̶�
% tabu ���ɱ� newtabu ·�������ɱ�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tn = zeros(citynum,citynum,m); % ��ʼ�����ʵķ�����
for i = 1:m                    % ��ʼ��tn
   tn(:,:,i) = (nij.^a).*(tij.^b);
end
while(1)
    if(size(tabu,2)>=citynum)  %�жϽ��ɱ��Ƿ���
        break
    end
    tabu = [tabu,zeros(m,1)];
    for i = 1:m                %ѭ��ÿһֻ���Ͻ�������ȥ�ĳ���
        %disp(['��',num2str(i),'����']);
        tn(:,tabu(i,end-1),i) = zeros(citynum,1); %������ȥ�ĳ�������
        p = tn(tabu(i,end-1),:,i)/(sum(tn(tabu(i,end-1),:,i)));%�������
        seccity =  select(p);  %ѡ�����
        tabu(i,end) = seccity; %�����м�����ɱ�
    end
    
end

