
Xq = quantise(X,17); % quantise image
target = std2(X-Xq);
error = target + 100; % random initialisation for error

i = 1;
while(abs(error-target) > 0.01)
    X4q = quantise(X4,0.0009*i/0.01);
    Y0q = quantise(Y0,i);
    Y1q = quantise(Y1,0.0067*i/0.01);
    Y2q = quantise(Y2,0.0036*i/0.01);
    Y3q = quantise(Y3,0.0019*i/0.01);
    py4decq;
    error = std2(X-Z0);
    i = i + 0.01;
end

i
