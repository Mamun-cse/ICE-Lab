clc;
clear all;
close all;

%Am=input('Amplitude of message signal');
%Ac=input('Amplitude of carriar signal');
%Fm=input('Frequency of message signal');
%Fc=input('Frequency of carriar signal');
%T=input('period');
Am=1,Ac=1,Fm=4,Fc=5,T=5;
t=0:0.01:T;
Ym=Am.*sin(2*pi*Fm*t);

subplot(411);
plot(t,Ym);
axis([0 T -2 2]);
title('Message signal');

Yc=Ac.*sin(2*pi*Fc*t);

subplot(412);
plot(t,Yc);
axis([0 T -2 2]);
title('carrier signal');

am=(Ac+Ym).*Yc;

subplot(413);
plot(t,am);
axis([0 T -2 2]);
title('am signal');

fm=Ac.*sin(2*pi*Fc*t+((Am/Ac).*(2*pi*Fm*t)));

subplot(414);
plot(t,fm);
axis([0 T -2 2]);
title('fm signal');
