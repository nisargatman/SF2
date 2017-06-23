step = 17;
error = 500;
while(error-4.934>0.1)
    error = std2(X-Z0);
    X4q = quantise(X4,step);
    Y3q = quantise(Y3,step);
    Y2q = quantise(Y2,step);
    Y1q = quantise(Y1,step);
    Y0q = quantise(Y0,step);

    X4i = rowint(X4q,2*h);  % interpolate quantised X4
    X4i = rowint(X4i',2*h);
    X4i = X4i';
    Z3 = X4i+Y3q;  % add on Y3q

    Z3i = rowint(Z3,2*h);  % interpolate Zfunction step = OptimumStep()3
    Z3i = rowint(Z3i',2*h);
    Z3i = Z3i';
    Z2 = Z3i + Y2q; % add on Y2q

    Z2i = rowint(Z2,2*h); % interpolate Z2
    Z2i = rowint(Z2i',2*h);
    Z2i = Z2i';
    Z1 = Z2i + Y1q; % add on Y1q

    Z1i = rowint(Z1,2*h); % interpolate Z1
    Z1i = rowint(Z1i',2*h);
    Z1i = Z1i';
    Z0 = Z1i + Y0q; % add on Y0q
    
    step = step-0.001;
end
step