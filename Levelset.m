%Right now 1d wave eqn
close all;clear;clc
%%
n=100;
L=1;
U(:,1)=ones(n,1);
x=linspace(0,L,n);
dt=0.001;
dx=x(2)-x(1);
%% Initialization
U(1:round(n/2))=-1;
L=U(1,:);
a=1;
dt=10*dx^2/abs(a);
time=0;
%% Central difference with second order scaled artificial dissipation
for tstep=1:1:100000
    for i=2:n-1
        U(i,tstep+1)=U(i,tstep)-a*dt*(U(i+1,tstep)-U(i-1,tstep))/(2*dx)+abs(a)*1e-3*dt*((U(i+1,tstep)+U(i-1,tstep)-2*U(i,tstep))/dx^2);

    end
    U(1,tstep+1)=U(2,tstep);
    U(end,tstep+1)=U(end-1,tstep);
    for i=1:n
        L(i)=U(i,tstep+1);
        if U(i,tstep+1)>0
            L(i)=1;
        else
            L(i)=-1;
        end
    end
    hold off
    plot(x,L);
    hold on
    plot(x,U(:,tstep+1));
    drawnow;
    U(:,tstep)=U(:,tstep+1);
    time=time+dt;
    if time>0.5/abs(a)
        break;
    end
end