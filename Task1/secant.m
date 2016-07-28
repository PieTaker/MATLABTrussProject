function [ c ] = secant( f, a, b, tol )

while abs(b-a) > tol
    m=(f(b) - f(a))/(b-a);
    c = a-f(a)/m;  % midpoint
    
    a = b; % update a and b
    b = c;
end

c = (a+b) / 2;

end

%f(a) = ma+c