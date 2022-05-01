clc; clear;
A = [1 1 1 -1; 2 -2 4 2; 2 2 -3 5; 3 1 2 -2];
E=eye(4);
Q=eye(4);
R=A;
[m,n] = size(A);
for k=1:m-1
    x=zeros(m,1)
    s=sqrt(sum(R(k:m,k).^2))
    if R(k,k)>0
        s=-s;
    end
    x(k:m,1)=R(k:m,k)
    x(k,1)=x(k,1)-s
    nu=1/(sqrt(2*s*(s-R(k,k))))
    w=x*nu

    V=E-2*w*w'
    Q=Q*V
    R=V*R
end
Q
R
Q*R
Q^(-1)
Q'