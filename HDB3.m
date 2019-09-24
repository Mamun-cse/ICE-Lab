clear;

bits= [1 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0];

bit_rate=1;

pre_vol=-1;
amp=1;
amp=pre_vol*amp;
tmp=amp;
cn0=0;
cn1=0;

for i = 1:length(bits)
    
    if bits(i) == 0
        cn0 = cn0+1;
    else
        cn1=cn1+1;
        cn0=0;
    end
    
    if cn0>3
        if mod(cn1,2)==0
            amplitude(i) = -amp;
            amp=amplitude(i);
            amplitude(i-3) = amp;
        else
            amplitude(i) = amp;
        end
        cn0=0;
        cn1=0;
    elseif bits(i)==0
        amplitude(i) = 0;
    else 
        amplitude(i)= -amp;
        amp=amplitude(i);
    end
end

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

counter = 0;
lastbit =-1;
for i = 1:length(time)
  if time(i)*bit_rate>counter
    counter = counter + 1;
    if y_valu(i)==lastbit
      result(counter-3:counter) = 0;
    else
      if(y_valu(i)==0)
        result(counter) = 0;
      else
        result(counter) = 1;
        lastbit = -lastbit;
      end
    end
  end
end

disp('HDB3 Decoding:');
bits
disp(result);
