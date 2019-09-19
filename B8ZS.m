clear;

bits = [1,0,0,0,0,0,0,0,0,1,0,1,0];

bit_rate=1;

pre_vol=1;
amp=1;
amp=pre_vol*amp;
tmp=amp;
cont=0;

for i=1:length(bits);
  if (bits(i)==0)
    cont=cont+1;
  endif
  if cont>7
    amplitude(i-4)=amp;
    amplitude(i-3)=-amp;
    amplitude(i-1)=-amp;
    amplitude(i)=amp;
    cont=0;
  
  elseif (bits(i)==0)
    amplitude(i)=0;
  else
    amplitude(i)=-amp;
    amp=amplitude(i);
  endif
  
  
endfor

Time=length(bits)/bit_rate;
n=100;
time=0:0.01:Time;
x=1;
for i=1:length(time)
  y_valu(i)=amplitude(x);
  if time(i)*bit_rate>=x
    x=x+1;
  endif
endfor

plot(time,y_valu);
axis([0 Time -4 4]);
