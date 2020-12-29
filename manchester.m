clc;
close all;
clear all;
x=input('Enter bit stream:')
a=input('Enter amplitude:')
n=0:0.5:length(x)
%---------------------------------------------------------  
i=1;
j=zeros(1,2*length(x)+1);
while(i<(2*length(x)))
  if (x((i+1)/2)==1)
    j(i)=a;
    j(i+1)=-a;
  else 
    j(i)=-a;
    j(i+1)=a; 
  endif
  i=i+2;
endwhile
j(2*length(x)+1)=j(2*length(x));
subplot(1,2,1)
stairs(n,j,'Linewidth',2)
title('Manchester')
grid on 
%---------------------------------------------------------  
i=1;
j=zeros(1,2*length(x));
while(i<(2*length(x)))
  if (x((i+1)/2)==1)
    j(i)=-a;
    j(i+1)=a;
  else 
    j(i)=a;
    j(i+1)=-a; 
  endif
  i=i+2;
endwhile
j(2*length(x)+1)=j(2*length(x));
subplot(1,2,2)
stairs(n,j,'Linewidth',2)
title('Manchester(IEEE 802.3)')
grid on 