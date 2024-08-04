function [e29,e31,e32] = MMD(ie29,ie31,ie32)
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
iemean=mean([ie29,ie31,ie32]);
beta29=ie29/iemean;
beta31=ie31/iemean;
beta32=ie32/iemean;
betamax=max([beta29,beta31,beta32]);
betamin=min([beta29,beta31,beta32]);
MMD=betamax-betamin;
emin=0.9828-0.8116*(MMD^0.8694);
emean=emin/betamin;
e29=beta29.*emean;
e31=beta31.*emean;
e32=beta32.*emean;
end

