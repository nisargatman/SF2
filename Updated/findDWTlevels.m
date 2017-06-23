function dwtstep = findDWTlevels(Y,n,X)

[a,b] = size(Y);
image = zeros(a,b);
m = a/2;
dwtstep = zeros(3,n+1);

for i=1:n
    s1 = m-m/2;
    s2 = m+m/2;
    
    image(s1,s2) = 100;
    Z = nlevidwt(image,i);
    dwtstep(1,i) = 1/sqrt(sum(Z(:).^2));
    image = zeros(a,b);
    
    image(s2,s2) = 100;
    Z = nlevidwt(image,i);
    dwtstep(2,i) = 1/sqrt(sum(Z(:).^2));
    image = zeros(a,b);
    
    image(s2,s1) = 100;
    Z = nlevidwt(image,i);
    dwtstep(3,i) = 1/sqrt(sum(Z(:).^2));
    image = zeros(a,b);
    m = m/2;
end

image = zeros(a,b);
image(s1,s1) = 100;
Z = nlevidwt(image,n);
dwtstep(1,n+1) = 1/sqrt(sum(Z(:).^2));

val = dwtstep(:);
dwtstep = dwtstep/min(val(1:end-2));

target = 4.934; % define to be error from quantised image: can make more general
error = target + 100;
r = 1;
while(abs(error-target)>0.01)
    Y2 = zeros(a,b);
    for i = n:-1:1
        m = a/(2^i);
        
        t = 1:m;
        tp = m:2*m;
        
        Y2(t,tp) = quantise(Y(t,tp),dwtstep(1,n-i+1)*r);
        Y2(tp,t) = quantise(Y(tp,t),dwtstep(2,n-i+1)*r);
        Y2(tp,tp) = quantise(Y(tp,tp),dwtstep(3,n-i+1)*r);
    end
    m = a/(2^n);
    t = 1:m;
    tp = m:2*m;
    Y2(t,t) = quantise(Y(t,t),dwtstep(1,n+1));
    Z = nlevidwt(Y2,n);
    error = std2(X-Z);
    r = r+0.01;
end

dwstep = dwtstep * r





