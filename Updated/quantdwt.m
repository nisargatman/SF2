N = 4;
step = 17;

% Perform the DWT
Y = nlevdwt(X, N);

% Initialise the dwtstep and dwent matrices
dwtstep = ones(3, N+1) * step;
dwent = zeros(3, N+1); % Empty

% Quantise each highpass image
w = size(Y, 1);
m = w;
for i=1:N
    m = m/2;
    Y(m+1:w, 1:m) = quantise(Y(m+1:w, 1:m), dwtstep(1, i));
    Y(m+1:w, m+1:w) = quantise(Y(m+1:w, m+1:w), dwtstep(2, i));
    Y(1:m, m+1:w) = quantise(Y(1:m, m+1:w), dwtstep(3, i));
    
    dwent(1, i) = bpp(Y(m+1:w, 1:m)) * m^2;
    dwent(2, i) = bpp(Y(m+1:w, m+1:w)) * m^2;
    dwent(3, i) = bpp(Y(1:m, m+1:w)) * m^2;
end

% Quantise the lowpass image
Y(1:m, 1:m) = quantise(Y(1:m, 1:m), dwtstep(1, N+1));
dwent(1, N+1) = bpp(Y(1:m, 1:m)) * m^2;

% Reconstruct
Z = nlevidwt(Y, N);
draw(Z)