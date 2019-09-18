clc;
clear all;

bits =[0,1,0,0,1,1,1,0];

bit_rate=2;
n=1000;
T=length(bits)/bit_rate;
N=n*length(bits);
dt=T/N;
t=0:dt:T;
prev_volt=1;
amp=1;
amp=prev_volt*amp;
tmp=amp;


for i=1:length(bits)
  if (bits(i)==1)
    amplitude(i)=-amp;
    amp=amplitude(i);
  else
    amplitude(i)=amp;
    amp=amplitude(i);
    
   end
end

x=1;
for i=1:length(t)
  y_valu(i)=amplitude(x);
  if (t(i)*bit_rate>=x)
    x=x+1;
  end
end

plot(t,y_valu);
axis([0 T -4 4]);

count=0;
last_bit=1;
for i=1:length(t)
  if t(i)*bit_rate>count
    count=count+1;
    if (y_valu(i)!=last_bit)
     ans_bit(count)=1;
     last_bit=-last_bit;
  else
    ans_bit(count)=0;
    end
    
  end
end
disp('Dimodulation');
disp(ans_bit);
