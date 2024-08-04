function [Ts,e29,e31,e32,i] = SWDTES( I29,I31,I32,w,vza)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
[ ie29,ie31,ie32,i ] = NEMmodel( I29,I31,I32,w,vza);
[e29,e31,e32] = MMD(ie29,ie31,ie32);
ematrix=[e29,e31,e32];
[H,b]=estimateMatrixs1e(I29,I31,I32,w,vza);
Tmatrix=H*(ematrix')+b;
Ts=Tmatrix(find(ematrix==max(ematrix)),1);
% Ts=mean(Tmatrix(1:3,1));
% [T29,T31,T32] = calculateMODISTfromL( I29,I31,I32);
% Ts=T31+1.51605199654518*(T31-T32)+0.355031351465140*(T31-T32)*(T31-T32)-0.445806316819825+(44.8990613477670+0.534151787024165*w)*(1-(e31+e32)/2)+(20.8535591355258*w-161.250363395327)*(e31-e32);
% ematrix=inv(H)*[Ts;Ts;Ts]-inv(H)*b;
% e29=ematrix(1,1);
% e31=ematrix(2,1);
% e32=ematrix(3,1);
%Ts=max(max(Tmatrix));
end

