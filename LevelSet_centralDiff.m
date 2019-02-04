%2D wave equation
close all;clear;clc;
format long e;
%%
n=250;
len=0.2;
U=-1*ones(n,n);
x=linspace(0,len,n);
y=linspace(0,len,n);
dx=x(2)-x(1);
dy=dx;
%% Initialization
% READ FROM IMAGE FILE
grain=imresize(rgb2gray(imread('grain.png')),[n,n]);
for i=1:n
    for j=1:n
        if grain(i,j)>127
            U(i,j)=1;
        else
            U(i,j)=-1;
        end
    end
end
%%
figure(1)
[X,Y]=meshgrid(x,y);
h=pcolor(X,Y,U);
colormap(jet);
colorbar();
axis equal;
set(h,'EdgeColor','none');
drawnow;
%% Solution
a=1e35;
Kd=abs(a)*max(dx,dy)/2;
dt=0.9*0.5*min(dx^2,dy^2)/(abs(a)*max(dx,dy));
%%
V=U;
V=U;
time=0;
for tstep=1:1:100000
    for i=2:1:n-1
        for j=2:1:n-1
            V(i,j)=U(i,j)-a*dt*sqrt(((U(i+1,j)-U(i-1,j))^2)/(4*dx^2)+((U(i,j+1)-U(i,j-1))^2)/(4*dy^2));
            %Add dissipative term
            V(i,j)=V(i,j)+Kd*dt*((U(i+1,j)+U(i-1,j)-2*U(i,j))/(dx^2)+(U(i,j+1)+U(i,j-1)-2*U(i,j))/(dy^2));
        end
    end
    V(1,:)=2*V(2,:)-V(3,:);
    V(end,:)=2*V(end-1,:)-V(end-2,:);
    V(:,1)=2*V(:,2)-V(:,3);
    V(:,end)=2*V(:,end-1)-V(:,end-2);
    %
    if mod(tstep,1)==0
        figure(2)
        h=pcolor(X,Y,sign(V));
        set(h,'EdgeColor','none');
        colormap(jet)
        colorbar();
%         figure(3)
%         plot(x,V(:,round(n/2)),'k.',x,V(:,round(n/2)),'r-');
        drawnow;
    end
    %
    k=sum(sum(sign(V)));
    areapercent=(n^2-k)/(2*n^2);
    if areapercent>=1
        areapercent=1;
    end
    disp(areapercent);
%     disp(time);
    U=V;
    time=time+dt;
    if time>=(0.5*len)/abs(a);
        disp(areapercent);
%         disp(time);
        break;
    end
end
%%