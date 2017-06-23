function dwtent = entropyDWT(Y,n)

[a,~] = size(Y);
dwtent = zeros(3,n+1);
m = a;
for i = 1:n
    m = m/2;
    dwtent(1,i) = bpp(Y(m+1:a,1:m))*m^2;
    dwtent(2,i) = bpp(Y(m+1:a,m+1:a))*m^2;
    dwtent(3,i) = bpp(Y(1:m, m+1:a))*m^2;
end
        dwtent(1,n+1) = bpp(Y(1:m, 1:m))*m^2;