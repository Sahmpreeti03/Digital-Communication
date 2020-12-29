clc;
close all;
clear all;
x=input('Enter bit stream:')
a=input('Enter amplitude:')
n=0:0.5:length(x);
%--------------------------------------------------------
j=a.*x;
for k=1:2*length(x)
  if(rem(k,2)==0)
   l(k)=0;
  else
   l(k)=j((k+1)/2);
  endif
endfor 
l(k+1)=l(k)  
subplot(2,2,1)
stairs(n,l,'Linewidth',2)
title('Unipolar RZ')
grid on 
%---------------------------------------------------------  
for i=1:length(x)
  if (x(i)==1)
    j(i)=a;
  else 
    j(i)=-a;  
  endif
endfor
for k=1:2*length(x)
  if(rem(k,2)==0)
   l(k)=0;
  else
   l(k)=j((k+1)/2);
  endif
endfor 
l(k+1)=l(k)  
subplot(2,2,2)
stairs(n,l,'Linewidth',2)
title('Polar RZ')
grid on
%---------------------------------------------------------  
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
for k=1:2*length(x)
  if(rem(k,2)==0)
   l(k)=0;
  else
   l(k)=j((k+1)/2);
  endif
endfor 
l(k+1)=l(k)  
subplot(2,2,3)
stairs(n,l,'Linewidth',2)
title('Bipolar RZ')
grid on



