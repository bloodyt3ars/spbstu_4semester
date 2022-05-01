clc; clear;
A = [1 1 1 -1; 2 -2 4 2; 2 2 -3 5; 3 1 2 -2]
E=eye(4);
i=1;
j=1;
L=eye(4);
M=eye(4);
new_A = A;
[m,n] = size(A);
k=1;
while(i<4)
    [max_element, number_of_element]=max(abs(new_A(i:n,i)));
    if i>1
        number_of_element=number_of_element+k;
        k=k+1;
    end
    new_A([i, number_of_element],:) = new_A([number_of_element, i],:)
    while(i+j<=4)
        l=new_A(j+i,i)/new_A(i,i);
        L(j+i,i)=l;
        M(j+i,i)=-l;
        j=j+1;
    end
    new_A=M*new_A
    j=1;
    M=eye(4);
    i=i+1;
end
new_A %U
L
check=L*new_A