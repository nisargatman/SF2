function err = DWTerror(X, N, dwtstep)

Y = nlevdwt(X, N);
Yq = DWTquantise(Y, N, dwtstep);
Z = nlevidwt(Yq, N);
err = std2(X-Z);