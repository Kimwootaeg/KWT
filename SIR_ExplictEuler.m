clear
close all
clc

T = 20;
dt = 0.05;
a = 2;
b = 1;

s = zeros(1,T/dt+1);
i = s;
r = s;

s(1,1) = 0.99;
i(1,1) = 0.01;
r(1,1) = 0;

for t = 1:T/dt
    s(1,t+1) = s(1,t) - dt*(a*i(1,t)*s(1,t));
    i(1,t+1) = i(1,t) + dt*(a*i(1,t)*s(1,t) - b*i(1,t));
    r(1,t+1) = r(1,t) + dt*(b*i(1,t));
end

t = 0:dt:T;
plot(t,s,'b',t,i,'r',t,r,'k')
legend('s','i','r')