%Heat equation

Nx = 50;
h = 1/Nx;
k = 0.005;
D = 0.04;
r = k*D/h^2;
T=10;
x1 = 0;
x2 = 1;
x = x1:h:x2-h;
x = x';
u(1:Nx,1) = sin(2*pi*x)+2;

A = diag((1+r)+ones(1,Nx)) + diag(-r/2*ones(1,Nx-1),1) + diag(-r/2*ones(1,Nx-1),-1);
A(1,Nx) = -r/2;
A(Nx,1) = -r/2;
B = diag((1-r)+ones(1,Nx)) + diag(r/2*ones(1,Nx-1),1) + diag(r/2*ones(1,Nx-1),-1);
B(1,Nx) = r/2;
B(Nx,1) = r/2;

xlabel = ('Location');
ylabel = ('Temperature');

for i = 1:T/k-1
    u(1:Nx,i+1) = A\(B*u(1:Nx,i));
    plot(x, u(1:Nx,i+1),'o')
    grid on
    xlim([0,1])
    ylim([1,3])
    pause(0.005)
    
end


