a0=1;
a1=4.4;
a2=53.2;
a3=12;
u=10;
X0 = [0; 0; 0];

z1 = (-a0/a3);
z2 = (-a1/a3);
z3 = (-a2/a3);
z4 = (1/a3);

A=[0 1 0; 0 0 1; z1 z2 z3];
B=[0;0;z4];
E = eye(3);
h=0.2;
t=0;
X = (A*X0+B*u)*h+X0;
while t<=160
    X_next=X+h*((3/2)*(A*X+B*u)-(1/2)*(A*X0+B*u))
    X0=X;
    X=X_next;
    t=t+h;
end

X0 = [0; 0; 0];

f=A*X0+B*u;
while t<=160
    f=A*X0+B*u;
    l1=f;
    l2=A*(X0+l1*h/2)+B*u;
    l3=A*(X0+l2*h/2)+B*u;
    l4=A*(X0+l3*h)+B*u;
    X_res = X0 + h*(l1+2*l2+2*l3+l4)/6
    X0=X_res;
    t=t+h;
end


from = 0;
to = 160;

X0 = [0; 0; 0];

[T, X] = ode45(@(t,x) A*x + B*u, [from to], X0);
plot(T, X)