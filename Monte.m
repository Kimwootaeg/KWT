%몬테카를로 방법을 사용해서 원의 면적 계산하기
clear;close all;clc

K = 10000;          %추출할 점의 갯수
r=1;                %원의 반지름

x = 2*r*rand(K,1)-r;
y = 2*r*rand(K,1)-r;
z = horzcat(x,y);   %코드를 진행하는데는 필요없지만 순서쌍 확인을 위해 첨가
n = 0;

for i = 1:K
 if x(i,1)^2+y(i,1)^2<=r^2
  n=n+1;
 end
end

S = (n/K)*(2*r)^2;
display(S)
plot(x,y,'.')
hold on

a = 0:0.1:2*pi;
xx = cos(a);
xx(:,64) = 1;
yy = sin(a);
yy(:,64) = 0;
p = plot(xx,yy,'-','LineWidth',2);
title('Monte Carlo')
