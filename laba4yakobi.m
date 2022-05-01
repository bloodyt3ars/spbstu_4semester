clc; clear;
A = [11 5 13; 5 7 1; 13 1 -9];
A0=A;
E=eye(3);
[m,n] = size(A);
V=E;
stop_criteria=m;
while (stop_criteria~=0)
    stop_criteria=m;
    for k=1:m-1
        for l=k+1:m
            if (abs(A0(l,k))>=eps*(abs(A0(l,l))/100))
                T=E;
                c=A0(k,k)/sqrt(A0(k,k)^2 + A0(l,k)^2);
                s=A0(l,k)/sqrt(A0(k,k)^2 + A0(l,k)^2);
                T(l,l)=c;
                T(k,k)=c;
                T(l,k)=-s;
                T(k,l)=s;
                A0=T*A0*T';
                V=V*T';
            else 
                stop_criteria=stop_criteria-1;
            end
        end
    end
end
[P,G]=eig(A);
A0
G
V
P
