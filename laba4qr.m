clc; clear;
A = [1 1 1 -1; 2 -2 4 2; 2 2 -3 5; 3 1 2 -2];
A0=A;
i=1;
while(i~=3)
    i=1;
    [Q,R] = qr(A0);
    A0=Q'*A0*Q;
    while((abs(A0(i+1,i))<(eps*(abs(A0(i,i))+abs(A0(i+1,i+1)))))&&(i~=3)) 
        i=i+1;
     end
end
A0
eig(A)