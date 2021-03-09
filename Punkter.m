clear all
%3b)
%startvärden
ra = 1.5;
rb= 0.8;
Tol = 1e-10;
xa = -1.5;
ya = 0.5;
xb = 2;
yb = 0;
x0 = [-1 1 2 1]';
%Funktionerna
F = @(x1,y1,x2,y2) [(x1-xa)^2+(y1-ya)^2-ra^2; (x2-xb)^2+(y2-yb)^2-rb^2;(x1-x2)*(x1-xa)+(y1-y2)*(y1-ya); (x1-x2)*(x2-xb)+(y1-y2)*(y2-yb)]
J = @(x1,y1,x2,y2) [2*(x1-xa) 2*(y1-ya) 0 0; 0 0 2*(x2-xb) 2*(y2-yb); 2*x1-xa-x2 2*y1-ya-y2 -(x1-xa) -(y1-ya); x2-xb y2-yb x1-2*x2+xb y1-2*y2+yb]
%Kolla om Jacobianen stämmer.
Jkoll=J(0,0,0,0)
%Iteration via Newtons-metod.
felet = 10;
iter = 0;
while felet > Tol & iter < 100
    x1 = x0(1); y1 = x0(2); x2 = x0(3); y2 = x0(4);
    x = J(x1,y1,x2,y2)\F(x1,y1,x2,y2);
    x0 = x0-x;
    felet=abs(x);
    iter = iter +1;
    xpunkt= x0;
    format long
    disp(iter)
    disp([x0 felet])
end
%2d)
%Plotta cirklarna.
th = 0 : pi/50 : 2 * pi;
x1cos = (xa + ra * cos(th));
y1sin = (ya + ra * sin(th));
x2cos = (xb + rb * cos(th));
y2sin = (yb + rb * sin(th));
plot(x1cos, y1sin, x2cos, y2sin);
hold on;
%Plotta snöret-
x =[xpunkt(1) xpunkt(3)];
y =[xpunkt(2) xpunkt(4)];
plot(x, y);
grid on;

