bits=[0,1,1,0,1,0,1,0,0,1,1,0];

n=100;
bit_rate=2;
Time=length(bits)/bit_rate;
N=n*length(bits);
dt=Time/N;
t=0:dt:Time;

prev_vol=1;
amp=1;
amp=prev_vol*amp;
temp=amp;

for i=1:length(bits)
  if (bits(i)==1)
    amplitude(i)=-amp;
  
    amp=amplitude(i);
  else
    amplitude(i)=0;
   
  endif
endfor
x=1;

for i=1:length(t)
  y_valu(i)=amplitude(x);
  if t(i)*bit_rate>=x
    x=x+1;
  endif
endfor

plot(t,y_valu);
axis([0 Time -4 4]);

count=0;

for i=1:length(t)
   if t(i)*bit_rate>count
     count=count+1;
     if y_valu(i)==0
       ansbit(count)=0;
       
     else
       ansbit(count)=1;
     endif
   endif
 
  
endfor
disp("deomodulation");
disp(ansbit);
