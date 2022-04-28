%몬테카를로 방법을 사용하여 주가 예측하기
%예상 수익률 = (일 수익률 평균 -0.5*(표준편차^2)) + 표준편차*난수
%예상주가 = 어제의 주가*exp(예상수익률)

clear;close all;clc

Samsung = readmatrix('samsung.xlsx');
Samsung = Samsung(:,2);
Final = zeros(100,1);

for i = 2:19
    Samsung(i,2) = log(Samsung(i,1)/Samsung(i-1,1));
end

M = mean(Samsung(:,2));
sigma = std(Samsung(:,2));

for o = 1:100
r = normrnd(M,sigma,[100,1]);

ExpeactedReturn = zeros(100,1);
ExpeactedReturn(:,1) = [1:100];
ExpactedPrice = zeros(100,1);
for j=1:100
   ExpeactedReturn(j,2) = (M-0.5*(sigma)^2)+sigma*r(j);
end

for j = 1:100
ExpactedPrice(j,1) = Samsung(1,1)*exp(ExpeactedReturn(j,2));
end
Final(o,1) = ExpactedPrice(100,1);
end
disp(mean(Final));