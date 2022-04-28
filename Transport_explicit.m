%Transport_explicit
% Using the one-sided and FTCS methods, solve
% ut - 2ux = 0 , t>=0, 0<=x<=1
% u(0,t) = u(1,t), u(x,0) = sin(2*pi*x)

clear
close all
clc

a = 0;
b = 1;
t = 0;
t0 = 0;
T = 1;
dt = 0.001;
Nx = 100;
c = -2;
tt = t0:dt:T;
dx = (b-a)/Nx;
x = 0:dx:(Nx-1)*dx;
u = sin(2*pi*x);

again = 1;
if c < 0
    while t<T
        if t+dt >= T
            dt = T-t;
            again = 0;
        end
        Ur = [u(1,2:end),u(1,1)];
        u = u-c*dt/dx*(Ur-u);
        t = t+dt;

        plot(x,u,'bo')
        axis([0,1,-1,1])
        pause(0.001)
    end
else
        while t<T
            if t+dt >= T
                dt = T-t;
                again = 0;
            end
            Ul = [u(1,end),u(1,1:end-1)];


            U = u-c*dt/dx*(u-Ul);
            t = t+dt;

            plot(x,U,'bo')
            axis([0,1,-1,1])
            pause(0.001)
        end
end
