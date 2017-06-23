function Xc = svdcompress(X)
% assume that image is loaded into workspace as X

[U,S,V] = svd(X);
i = 1;
while(i<300)
    S(S<i)=0;
    i = i+1;
end
Xc = U*S*V';