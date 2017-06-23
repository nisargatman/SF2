X4q = quantise(X4,17);
Y3q = quantise(Y3,17);
Y2q = quantise(Y2,17);
Y1q = quantise(Y1,17);
Y0q = quantise(Y0,17);

X4i = rowint(X4q,2*h);  % interpolate quantised X4
X4i = rowint(X4i',2*h);
X4i = X4i';
Z3 = X4i+Y3q;  % add on Y3

Z3i = rowint(Z3,2*h);  % interpolate Z3
Z3i = rowint(Z3i',2*h);
Z3i = Z3i';
Z2 = Z3i + Y2q; % add on Y2

Z2i = rowint(Z2,2*h); % interpolate Z2
Z2i = rowint(Z2i',2*h);
Z2i = Z2i';
Z1 = Z2i + Y1q; % add on Y1

Z1i = rowint(Z1,2*h); % interpolate Z1
Z1i = rowint(Z1i',2*h);
Z1i = Z1i';
Z0 = Z1i + Y0q; % add on Y0

max_deviation = max(abs(X(:)-Z0(:))) % maximum error
draw(beside(Z3,beside(Z2,beside(Z1,Z0))));(beside(Z3,beside(Z2,beside(Z1,Z0))));