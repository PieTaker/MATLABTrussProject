function [ c ] = bisection( f, a, b, tol )

while abs(b-a) > tol
    c = (a+b) / 2;  % midpoint
    
    if sign(f(a)) == sign(f(c))
        a = c;  % new a at midpoint
    else
        b = c;  % new b at midpoint
    end
end

c = (a+b) / 2;

end

