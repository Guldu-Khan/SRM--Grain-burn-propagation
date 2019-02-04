close all; clear all; clc;

%% creating a structured grid 
% L/2 is the extent of the domain of length L
% It is chopped up into n pieces
% Time resolution delt is also set
L=20;
n=100;
x=linspace(-L/2,L/2,n+1);
y=x;
[X,Y]=meshgrid(x,y);
delt=0.001;
delx=L/n;
sizex=size(x);

%% Initial conditions to be given
% Give values 0 to the curve
% Points within are given a negative value say -10
% Points outside are given a positive value say 10

U = 1*ones(sizex(2));
U(:,1:50)=-1;
U(:,51)=0;
figure(1)
h=pcolor(U);
set(h,'EdgeColor','none');
drawnow;
%% Assuming speed function to be 1
% Finite difference formulation 
% Upwind for time
% Conditional difference in space
% Refer MIT paper for exact equation

F=0.1;
V = 1*ones(sizex(2));
for repeat=1:5000
    
    
for i=2:n
    for j=2:n
     %  V(i,j) = U(i,j) + delt*(F*(((max((U(i,j)-U(i-1,j))/delx,0))^2 + (min((U(i+1,j)-U(i,j))/delx,0))^2 + ...
      %                            (max((U(i,j)-U(i,j-1))/delx,0))^2 + (min((U(i,j+1)-U(i,j))/delx,0))^2)^0.5));
  V(i,j) = U(i,j)-delt*F*((U(i,j)-U(i-1,j))/delx);
    end
end

figure(2)
h=pcolor(V) ;
set(h,'EdgeColor','none');
drawnow;
%% Compute area of the curve

%% Update U and V;

U = V;

end




