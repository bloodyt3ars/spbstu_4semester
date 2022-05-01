clc; clear;
func = @(x) x^4-0.2*x^2+0.5*x+1.5;
a=-2;
b=0;
eps=10^-5;
delta=eps/3;
x0=(a + b)/2;
while(b-a>eps)
    x0=(a + b)/2;
    alpha=x0-delta;
    beta=x0+delta;
    if (func(alpha)<func(beta))
        b=beta;
        x0=alpha;
    else
        a=alpha;
        x0=beta;
    end
end
function_derivative = @(x) 4*x^3 - 0.4*x + 0.5;
x0
func(x0)
function_derivative(x0)