clc;
clear all;

bits =[0,1,0,1,1,1,0];

bit_rate=1;
n=1000;
T=length(bits)/bit_rate;
N=n*length(bits);
dt=T/N;
t=0:dt:T;

for i=1:length(bits)
  if (bits(i)==1)
    amp(i)=1;
  else
    amp(i)=0;
   end
end

x=1;
for i=1:length(t)
  y_valu(i)=amp(x);
  if (t(i)>=x)
    x=x+1;
  end
end

plot(t,y_valu);
axis([0 T -4 4]);

count=0;
for i=1:length(t)
  if t(i)>count
    count=count+1;
    ans_bit(count)=y_valu(i)
    
  end
end
disp('Dimodulation');
disp(ans_bit);
