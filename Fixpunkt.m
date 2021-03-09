maxiter = 1000;
tol = 1e-10;
g = @(x) -sin(2*x)+(5/4)*x-3/4;
xstart=[0, 2.7, 3.8, 4.9, 6, 6.8] %Gissningar
for i = 1:6;
    x = xstart(i);
    iter = 0;
    diffx = 1;
    x1 = g(x)
    while abs(diffx) > tol && iter < maxiter
        iter = iter + 1;
        x2 = g(x1);
        if abs(x2-x1) > abs(x1-x) %Kvadratisk konvergens
            diffx = (x1-x)^2/(x2-2*x1+x)
            x = x-diffx;
            x1=g(x);
        else
            diffx = x2 -x1; %Linjär konvergens
            x = x1;
            x1 = x2;
        end
        format long
        disp([i iter x1 diffx])
    end
x2 = x;
xsvar(i) = x;
     
end
x = [xsvar(1), xsvar(2), xsvar(3), xsvar(4), xsvar(5), xsvar(6)]

