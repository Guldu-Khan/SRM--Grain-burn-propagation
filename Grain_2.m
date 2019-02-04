close all; clear all; clc;
%%Program works only if 4 times symmetric
%% Primitive piece of shit
%%
A = imread('grain.png');
a=im2double(A);      %Converts to array of values between 0-1 double
imshow(a);
L=0;
s=size(a);
 for k=1:125
     l=0;
 for i=2:s(1)-1  %size of a
      for j=2:s(2)-1
            if(a(i,j,1)==1 && a(i,j,2)==0 && a(i,j,3)==0)   %if red change to white
                l = l+1;
                a(i,j,1)=1;
                a(i,j,2)=1;
                a(i,j,3)=1;
                    %%
                    if(a(i-1,j,3)==0 && a(i-1,j,1)==0 && a(i-1,j,2)==0) %if i-1,j is black change to red
                        a(i-1,j,2)=0;
                        a(i-1,j,3)=0;
                        a(i-1,j,1)=1;
                    end
                    if(a(i,j-1,3)==0 && a(i,j-1,1)==0 && a(i,j-1,2)==0) %if i,j-1 is black change to red
                        a(i,j-1,3)=0;
                        a(i,j-1,1)=1;
                        a(i,j-1,2)=0;
                    end
                    if(a(i,j+1,3)==0 && a(i,j+1,1)==0 && a(i,j+1,2)==0) %if i,j+1 is black change to red
                        a(i,j+1,3)=0;
                        a(i,j+1,2)=0;
                        a(i,j+1,1)=1;
                    end
                    if(a(i+1,j,3)==0 && a(i+1,j,1)==0 && a(i+1,j,2)==0) %if i+1,j is black change to red
                        a(i+1,j,3)=0;
                        a(i+1,j,2)=0;
                        a(i+1,j,1)=1;
                    end
                    
            end     
      end
 end
  imshow(a);  drawnow; 
   if(l>0)
        L = [L l];
      end
 end
 %%
 %Assuming correction factor of 1.2
 L=L(1,2:100);
 Weblength = L*1.2*4;
