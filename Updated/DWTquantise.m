function Yq = DWTquantise(Y, N, dwtstep,r)

Yq = Y;

% Quantise each highpass image
w = size(Yq, 1);
m = w;
for i=1:N
    m = m/2;
    Yq(m+1:w, 1:m) = quantise(Yq(m+1:w, 1:m), dwtstep(1, i),r*dwtstep(1,i));
    Yq(m+1:w, m+1:w) = quantise(Yq(m+1:w, m+1:w), dwtstep(2, i),r*dwtstep(2,i));
    Yq(1:m, m+1:w) = quantise(Yq(1:m, m+1:w), dwtstep(3, i),r*dwtstep(3,i));
end

% Quantise the lowpass image
Yq(1:m, 1:m) = quantise(Yq(1:m, 1:m), dwtstep(1, N+1),r*dwtstep(1,N+1));