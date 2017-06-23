function h = DWTentropy(Y, N)

dwent = zeros(3, N+1); % Empty

w = size(Y, 1);
m = w;
for i=1:N
    m = m/2;
    dwent(1, i) = bpp(Y(m+1:w, 1:m)) * m^2;
    dwent(2, i) = bpp(Y(m+1:w, m+1:w)) * m^2;
    dwent(3, i) = bpp(Y(1:m, m+1:w)) * m^2;
end

dwent(1, N+1) = bpp(Y(1:m, 1:m)) * m^2;

h = sum(sum(dwent));