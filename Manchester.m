clc;
clear all;
close all;
bits =[0,1,1,0,0,1,1,1,0];

bit_rate=2;
n=1000;
T=length(bits)/bit_rate;
N=n*length(bits);
dt=T/N;
t=0:dt:T;
in=1;
for i=1:length(bits)
  if (bits(i)==1)
    amp(in)=-1;
    amp(in+1)=1;
    
  else
    amp(in)=1;
    amp(in+1)=-1;
   end
   in=in+2;
end

x=1;
for i=1:length(t)
  y_valu(i)=amp(x);
  if (t(i)*bit_rate*2>=x)
    x=x+1;
  end
end

plot(t,y_valu);
axis([0 T -4 4]);

count=0;
for i=1:length(t)
  if t(i)*bit_rate>count
    count=count+1;
    if (y_valu(i)>0)
    ans_bit(count)=0;
  else
    ans_bit(count)=1;
    end
    
  end
end
disp('Dimodulation');
disp(ans_bit);
