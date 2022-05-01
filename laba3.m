clc;
func = @(x) x^3-0.2*x^2+0.5*x+1.5;
diff_func = @(x) 3*x^2-0.4*x+0.5;
x_previous=1;
epsilon = 10^(-6);
f_x_previous=func(x_previous);
fdiff_x_previous=diff_func(x_previous);
x_current=x_previous-f_x_previous/fdiff_x_previous;
while(abs(x_current-x_previous)>=epsilon)
    x_next=x_current-(func(x_current)*(x_current-x_previous))/(func(x_current)-func(x_previous));
    x_previous=x_current;
    x_current=x_next;
end
x_current