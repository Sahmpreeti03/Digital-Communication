clc;
close all;
clear all;
A=input('enter amplitude of signal:')
ql=input('enter no of quantisation levels:')
bits=log2(ql)
bond=ql+1
fm=4
t=0:0.01:4/fm;
y=A*cos(2*pi*fm*t);
subplot(6,1,1)
plot(t,y)
xlabel('time')
ylabel('amplitude')
title('Analog Message Signal')
grid on
fs=50
n1=0:1/fs:4/fm;
y1=A*cos(2*pi*fm*n1);
subplot(6,1,2)
%plot(n1,y1)
%hold on
stem(n1,y1)
xlabel('time')
ylabel('amplitude')
title('Sampled Signal')
grid on
step=2*A/ql;
ran=-A:step:A;
%quan_vol=zeros(1,ql);
%quan_value=zeros(1,ql);
%enc=zeros(1,ql);
for i = 1 : length(ran)-1
  quan_vol(i) = (ran(i) + ran(i+1))/2;
end
for j=1:length(y1)
  for i=1:length(ran)-1
    if (y1(j)>ran(i) && y1(j)<=ran(i+1))
      quan_value(j)=quan_vol(i);
      break
    endif
  endfor
endfor
subplot(6,1,3) 
stairs(n1,quan_value)
xlabel('time')
ylabel('amplitude')
title('Quantised Signal')
grid on
enc=dec2bin(floor(quan_value+A));
enc1=reshape(enc.', 1, []);
for i=1:length(enc1)
  if enc1(i)=='1'
    enco(i)=5;
  else
    enco(i)=0;
  endif
endfor
[nr,nc]=size(enco);
enn=0:1/(nc-1):1;
subplot(6,1,4)
stairs(enn,enco)
xlabel('time')
ylabel('amplitude')
title('Encoded (PCM) Signal')
grid on
for j=1:length(quan_value)
  qr(j)=bin2dec(enc(j,:))-A+step/2;
endfor
subplot(6,1,5)
stairs(n1,qr)
xlabel('time')
ylabel('amplitude')
title('Recovered Quantised Signal')
grid on
subplot(6,1,6)
plot(n1,qr)
xlabel('time')
ylabel('amplitude')
title('Recovered Message Signal')
grid on

