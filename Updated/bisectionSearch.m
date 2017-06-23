function c = bisectionSearch(fun, target, tol, maxIter)

a = 0;
b = 256;
fa = fun(a) - target;
fb = fun(b) - target;

if fa == 0
    c = a;
    return
end
if fb == 0
    c = b;
    return
end
if sign(fa) == sign(fb)
    c = inf;
    disp "Interval not correct"
    return
end

n = 0;
while n < maxIter
    c = (a+b)/2;
    fc = fun(c) - target;
    if fc == 0 || (b-a)/2 < tol
        return
    end
    n = n + 1;
    if sign(fa) == sign(fc)
        a = c;
    else
        b = c;
    end
end