close all; clear all; clc;

A = imread('grain.png');
a=im2double(A);
%imshow(A);

b = imresize(A,[300 300]);
B=im2double(b);
imshow(B)

%  for(k=1:10000)
%      k
%  for(i=2:299)
%       for(j=2:299)
%             if(B(i,j,1)==1 && B(i,j,2)==0 && B(i,j,3)==0)
%                 B(i,j,1)=1;
%                 B(i,j,2)=1;
%                 B(i,j,3)=1;
% %                     if(B(i-1,j-1,3)==0 && B(i-1,j-1,1)==0 && B(i-1,j-1,2)==0)
% %                         B(i-1,j-1,3)=0;
% %                         B(i-1,j-1,1)=1;
% %                         
% %                     end
%                     if(B(i-1,j,3)==0 && B(i-1,j,1)==0 && B(i-1,j,2)==0)
%                         B(i-1,j,2)=0;
%                         B(i-1,j,3)=0;
%                         B(i-1,j,1)=1;
%                     end
% %                     if(B(i-1,j+1,3)==0 && B(i-1,j+1,1)==0 && B(i-1,j+1,2)==0)
% %                         B(i-1,j+1,3)=0;
% %                         B(i-1,j+1,1)=1;
% %                     end
%                     if(B(i,j-1,3)==0 && B(i,j-1,1)==0 && B(i,j-1,2)==0)
%                         B(i,j-1,3)=0;
%                         B(i,j-1,1)=1;
%                         B(i,j-1,2)=0;
%                     end
%                     if(B(i,j+1,3)==0 && B(i,j+1,1)==0 && B(i,j+1,2)==0)
%                         B(i,j+1,3)=0;
%                         B(i,j+1,2)=0;
%                         B(i,j+1,1)=1;
%                     end
%                     if(B(i+1,j-1,3)==0 && B(i+1,j-1,1)==0 && B(i+1,j-1,2)==0)
%                         B(i+1,j-1,3)=0;
%                         B(i+1,j-1,2)=0;
%                         B(i+1,j-1,1)=1;
%                     end
%                     if(B(i+1,j,3)==0 && B(i+1,j,1)==0 && B(i+1,j,2)==0)
%                         B(i+1,j,3)=0;
%                         B(i+1,j,2)=0;
%                         B(i+1,j,1)=1;
%                     end
% %                     if(B(i+1,j+1,3)==0 && B(i+1,j+1,1)==0 && B(i+1,j+1,2)==0)
% %                         B(i+1,j+1,3)=0;
% %                         B(i+1,j+1,1)=1;
% %                     end
%                     
%             end
%                 
%       end
%  end
%   imshow(B);  drawnow;
%  end
%  
%  imshow(B)