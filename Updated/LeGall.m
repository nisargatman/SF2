% Define the LeGall filters
h1 = [-1, 2, 6, 2, -1]/8;
h2 = [-1, 2, -1]/4;

U = rowdec(X, h1);
V = rowdec2(X, h2);

% Check the energy of U and V
fprintf('Energy of U: %f\n', energy(U));
fprintf('Energy of V: %f\n', energy(V));

UU = rowdec(U', h1)';
UV = rowdec2(U', h2)';
VU = rowdec(V', h1)';
VV = rowdec2(V', h2)';

figure; draw(scaleImg(UU, 0, 255))
figure; draw(scaleImg(UV, 0, 255))
figure; draw(scaleImg(VU, 0, 255))
figure; draw(scaleImg(VV, 0, 255))


fprintf('Energy of UU: %f\n', energy(UU));
fprintf('Energy of UV: %f\n', energy(UV));
fprintf('Energy of VU: %f\n', energy(VU));
fprintf('Energy of VV: %f\n', energy(VV));
sdfsdf

% Reconstruct
%
g1 = [1, 2, 1]/2;
g2 = [-1, -2, 6, -2, -1]/4;
Ur = rowint(UU', g1)' + rowint2(UV', g2)';
Vr = rowint(VU', g1)' + rowint2(VV', g2)';

% Check if UR=U and Vr=V
fprintf('rmsError(Ur, U) = %f\n', rmsError(Ur, U));
fprintf('rmsError(Vr, V) = %f\n', rmsError(Vr, V));

Xr = rowint(Ur, g1) + rowint2(Vr, g2);
% check if Xr=X
fprintf('rmsError(Xr, X) = %f\n', rmsError(Xr, X));

draw(Xr)