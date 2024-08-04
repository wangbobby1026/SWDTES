function [ ie29,ie31,ie32,i ] = NEMmodel( I29,I31,I32,w,vza)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
emax=0.99;
[H,b]=estimateMatrixs1e(I29,I31,I32,w,vza);
ematrix=[emax,emax,emax];
Tmatrix=H*(ematrix')+b;
TNEM=max(Tmatrix);
ematrix=calculateLfromT(Tmatrix).*ematrix./calculateLfromT([TNEM,TNEM,TNEM]);
if var(ematrix)>0.00017
   emax=0.97;
end
ematrix=[emax,emax,emax];   
Tmatrix=H*(ematrix')+b;
Ttempt=Tmatrix;
TNEM=max(Tmatrix);
ematrix=calculateLfromT(Tmatrix).*ematrix./calculateLfromT([TNEM,TNEM,TNEM]);
Tmatrix=H*(ematrix')+b;
i=1;
while (mean(abs(Tmatrix-Ttempt))>0.005 && i<10)
%while ((abs(Tmatrix(1)-Tmatrix(2))+abs(Tmatrix(3)-Tmatrix(2)))>0.01 && i<10)
    Ttempt=Tmatrix;
    TNEM=max(Tmatrix); 
    ematrix=calculateLfromT(Tmatrix).*ematrix./calculateLfromT([TNEM,TNEM,TNEM]);
    Tmatrix=H*(ematrix')+b;
    i=i+1;
end
%ematrix=inv(H)*[TNEM;TNEM;TNEM]-inv(H)*b;
% else
%     ematrix92=eSpectrumFemax( H,b,0.92 );
%     ematrix95=eSpectrumFemax( H,b,0.95 );
%     ematrix97=eSpectrumFemax( H,b,0.97 );
%     ematrix99=eSpectrumFemax( H,b,0.99 );
%     var_ematrix92=var(ematrix92);
%     var_ematrix95=var(ematrix95);
%     var_ematrix97=var(ematrix97);
%     var_ematrix99=var(ematrix99);
%     var_ematrix_min=min([var_ematrix92,var_ematrix95,var_ematrix97,var_ematrix99]);
%     if var_ematrix92==var_ematrix_min
%         emax=0.92;
%     end
%     if var_ematrix95==var_ematrix_min
%         emax=0.95;
%     end
%     if var_ematrix97==var_ematrix_min
%         emax=0.97;
%     end
%     if var_ematrix99==var_ematrix_min
%         emax=0.99;
%     end
% %     firstDerivVar=[(var_ematrix95-var_ematrix92)/0.03,(var_ematrix97-var_ematrix95)/0.02,(var_ematrix99-var_ematrix97)/0.02];
% %     secondDerivVar=[(firstDerivVar(2)-firstDerivVar(1))/0.025,(firstDerivVar(3)-firstDerivVar(2))/0.02];
% %     if min(firstDerivVar)>0.001
% %         emax=0.99;
% %     end
% %     if max(secondDerivVar)<0.001
% %         emax=0.99;
% %     end
%     if var(eSpectrumFemax(H,b,emax))<0.0001
%         emax=0.99;
%     end
ie29=ematrix(1);
ie31=ematrix(2);
ie32=ematrix(3);
end

