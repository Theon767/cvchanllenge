function H2to1 = epa(corr)
% INPUTS:
% p1 and p2 - Each are size (2 x N) matrices of corresponding (x, y)'  
%             coordinates between two images
p1=corr(1:2,:);
p2=corr(3:4,:);
N = size(p1,2);
u1i = p1(1,:)';
v1i = p1(2,:)';
u2i = p2(1,:)';
v2i = p2(2,:)';
% separate four columns of coordinate of p1 and p2

A1 = [-1*u2i , -1*v2i , -1*ones(N,1) , zeros(N,3) , u1i.*u2i , u1i.*v2i , u1i];
A2 = [zeros(N,3) , -1*u2i , -1*v2i , -1*ones(N,1) , v1i.*u2i , v1i.*v2i , v1i];
A = [A1;A2];
% the sequence of rows in A will not affect matrix V which yield the output
% i.e. the equation is sequencial or alternative are both ok

[~,~,V] = svd(A);
h = V(:,end);
% [V,D]=eig(A'*A);
% h=V(:,1);
% V is a descending order matrix 
% last column of V is the right singular vector we take

H2to1 = reshape(h,[3,3]);
% H2to1=inv(T1)*H2to1*T2;
% With normalization, use the formula above
%[~,S,~]=svd(H2to1);
H2to1 = H2to1';
% you have to do the transpose no matter using svd or eig
% just to remind myself
% H2to1=H2to1'/H2to1(3,3);


end