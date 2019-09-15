
clear

bits = [1,0,0,1,1,0,0,0,1,1,1,0];

for i = 1:length(bits)
  if (bits(i)==1)
    amp= 1;
  else
    amp = 0;
    
  endif
endfor

bitrate = 1;
Time= 12;
Sampl_frequency=150;

time=0:0.1:Time;

x = 1;

for i = 1:length(time)
  y_valu(i)=amp(x);
  if time(i)>=x
    x = x+1;
  endif
endfor

plot(time,y_valu);
axis([0 Time -4 4]);

