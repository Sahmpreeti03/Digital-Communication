clc;
close all;
clear all;
x=input('Enter bit stream:')
a=input('Enter amplitude:')
n=0:length(x);
%---------------------------------------------------------------------
t=0:0.01:length(x);
f1=1
f2=2
y1=a*cos(2*pi*f1*t);
y2=a*cos(2*pi*f2*t);
for i=1:length(x)
  if (x(i)==1)
    j(i)=a;
  else 
    j(i)=0;
  endif
endfor
j(i+1)=j(i)
subplot(4,1,1)
stairs(n,j)
title('Unipolar NRZ Signal')
grid on
subplot(4,1,2)
plot(t,y1)
title('Carrier Signal of 1Hz')
grid on
subplot(4,1,3)
plot(t,y2)
title('Carrier Signal of 2Hz')
grid on
i=1
for l=1:length(t)
  if t(l)<=i
    m(l)=x(i);
  else
    m(l)=x(i);
    i=i+1;
  end
end
for k=1:length(t)
  if m(k)==1
    q(k)=y1(k);
  else 
    q(k)=y2(k);
  endif
endfor
subplot(4,1,4)
plot(t,q)
title('Binary Frequency Shift Keying Modulated Signal')
grid on