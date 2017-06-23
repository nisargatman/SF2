X4i = rowint(X4,2*h);  % interpolate X4
X4i = rowint(X4i',2*h);
X4i = X4i';
Z3 = X4i+Y3;  % add on Y3

Z3i = rowint(Z3,2*h);  % interpolate Z3
Z3i = rowint(Z3i',2*h);
Z3i = Z3i';
Z2 = Z3i + Y2; % add on Y2

Z2i = rowint(Z2,2*h); % interpolate Z2
Z2i = rowint(Z2i',2*h);
Z2i = Z2i';
Z1 = Z2i + Y1; % add on Y1

Z1i = rowint(Z1,2*h); % interpolate Z1
Z1i = rowint(Z1i',2*h);
Z1i = Z1i';
Z0 = Z1i + Y0; % add on Y0

max_deviation = max(abs(X(:)-Z0(:))) % maximum error
draw(beside(Z3,beside(Z2,beside(Z1,Z0))));