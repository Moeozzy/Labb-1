x = [-2:0.1:8]
y = @(x) x-4*sin(2*x)-3
plot(x,y(x));
xlabel("x")
ylabel("y(x)")
title("Newton")
ax = gca;
grid on;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
maxiter = 1000;
tol = 1e-10;
diffx = 1;
iter = 0;
yp = @(x) 1-8*cos(2*x)
xstart=[-1]; %Startgissning
x = xstart(1);
    while diffx > tol && iter < maxiter %Iteration via Newton
        iter = iter +1;
        xnew = x-y(x)/yp(x);
        diffx = abs(xnew-x);
        x = xnew;
        format long;
        disp([iter xnew diffx]) %Utskrift med antal iter, värdet och skillnaden 
    end
   
