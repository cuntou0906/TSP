function [ output ] = select( fitvalue )
  %%%%%%%  ���̶�ѡ�񷽷�  %%%%%%
  totalfit = sum(fitvalue);        %������Ӧ���ܺ�
  p_fitvalue = fitvalue/totalfit;  %����ÿ���������Ӧ�ȸ���
  p_fitvalue = cumsum(p_fitvalue); %�ۼӺ���
  randdata = rand(1);              %���ѡ��һ����
  newin = 1;
  fitindex = 1;
  while newin<=length(fitvalue)    %ѭ�����̶ķ�ѡ�����    
    if(randdata)<p_fitvalue(fitindex)
        output = fitindex;
        break;
    else
        fitindex = fitindex+1;
    end
  end
end