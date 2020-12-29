clc;
close all;
clear all;
x=input('Enter bit stream:')
a=input('Enter amplitude:')
n=0:length(x);
%---------------------------------------------------------------------
for i=1:length(x)
  if (x(i)==1)
    j(i)=a;
  else 
    j(i)=0;
  endif
endfor
j(i+1)=j(i)
subplot(2,2,1)
stairs(n,j,'Linewidth',2)
title('Unipolar NRZ')
grid on
%---------------------------------------------------------------------
for i=1:length(x)
  if (x(i)==1)
    j(i)=a;
  else 
    j(i)=-a;  
  endif
endfor
j(i+1)=j(i)
subplot(2,2,2)
stairs(n,j,'Linewidth',2)
title('Polar NRZ')
grid on
%---------------------------------------------------------------------
c=0;
for i=1:length(x)
  if(x(i)==1)
    c=c+1;
    if(rem(c,2)==0)
      j(i)=-a;
    else
      j(i)=a;
    endif
  else
    j(i)=0;
  endif
endfor
j(i+1)=j(i)
subplot(2,2,3)
stairs(n,j,'Linewidth',2)
title('Bipolar NRZ')
grid on
   