X4i = rowint(X4q,2*h);  % interpolate X4
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