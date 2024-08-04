%clear
%load simulationdata221217.mat
[M,N]=size(ValidationS);
ValidationS(:,12)=ValidationS(:,12)./ValidationS(:,10);
ValidationS(:,15)=ValidationS(:,15)./ValidationS(:,13);
ValidationS(:,18)=ValidationS(:,18)./ValidationS(:,16);
%atmospheric noise
awv_std=0;%0.3;
AWVnoise=normrnd(0,awv_std,[M 1]);
%AWVnoise=ValidationS(:,1).*AWVnoise;
AWVnoise=((ValidationS(:,1)+AWVnoise)<0.05).*(0.1-ValidationS(:,1))+((ValidationS(:,1)+AWVnoise)>0.05).*AWVnoise;
Trans1noise=AWVnoise.*-0.0829;
Trans2noise=AWVnoise.*-0.118;
Trans3noise=AWVnoise.*-0.1372;
ARup1noise=AWVnoise.*0.7112;
ARup2noise=AWVnoise.*1.0083;
ARup3noise=AWVnoise.*1.0999;
ARdown1noise=AWVnoise.*1.001;
ARdown2noise=AWVnoise.*1.2695;
ARdown3noise=AWVnoise.*1.33;
%radiance noise
radiance_std=0;%0.04;
L1noise=normrnd(0,radiance_std,[M 1]);
L2noise=normrnd(0,radiance_std,[M 1]);
L3noise=normrnd(0,radiance_std,[M 1]);
%emissivity noise
emissivity_std=0;%0.01;
e1noise=normrnd(0,emissivity_std,[M 1]);
e2noise=normrnd(0,emissivity_std,[M 1]);
e3noise=normrnd(0,emissivity_std,[M 1]);

SWDTESresult=zeros(M,10);
for i=1:M
    %[Ts,e29,e31,e32,j] = SWDTES( ValidationS(i,3),ValidationS(i,4),ValidationS(i,5),ValidationS(i,1),ValidationS(i,2));
    [Ts,e29,e31,e32,j] = SWDTES( ValidationS(i,3)+L1noise(i),ValidationS(i,4)+L2noise(i),ValidationS(i,5)+L3noise(i),ValidationS(i,1)+AWVnoise(i),ValidationS(i,2));
    SWDTESresult(i,1)=ValidationS(i,1);
    SWDTESresult(i,2)=ValidationS(i,6);
    SWDTESresult(i,3)=ValidationS(i,7);
    SWDTESresult(i,4)=ValidationS(i,8);
    SWDTESresult(i,5)=ValidationS(i,9);
    SWDTESresult(i,6)=j;
    SWDTESresult(i,7)=e29-ValidationS(i,7);
    SWDTESresult(i,8)=e32-ValidationS(i,8);
    SWDTESresult(i,9)=e31-ValidationS(i,9);
    SWDTESresult(i,10)=Ts-ValidationS(i,6);
end
    
    SWDTESresult(i+1,6)=sum(SWDTESresult(:,6))/i;
    SWDTESresult(i+1,7)=sum(SWDTESresult(:,7))/i;
    SWDTESresult(i+1,8)=sum(SWDTESresult(:,8))/i;
    SWDTESresult(i+1,9)=sum(SWDTESresult(:,9))/i;
    SWDTESresult(i+1,10)=sum(SWDTESresult(:,10))/i;
    SWDTESresult(i+2,6)=max(SWDTESresult(:,6));
    SWDTESresult(i+2,7)=sqrt(sum(SWDTESresult(:,7).^2)/i);
    SWDTESresult(i+2,8)=sqrt(sum(SWDTESresult(:,8).^2)/i);
    SWDTESresult(i+2,9)=sqrt(sum(SWDTESresult(:,9).^2)/i);
    SWDTESresult(i+2,10)=sqrt(sum(SWDTESresult(:,10).^2)/i);
    SWDTESresult(i+3,7)=sum(abs(SWDTESresult(:,7)))/i;
    SWDTESresult(i+3,8)=sum(abs(SWDTESresult(:,8)))/i;
    SWDTESresult(i+3,9)=sum(abs(SWDTESresult(:,9)))/i;
    SWDTESresult(i+3,10)=sum(abs(SWDTESresult(:,10)))/i;
    SWDTESresult(i+1:i+3,6:10)

