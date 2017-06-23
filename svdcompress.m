% assume that image is loaded into workspace as X

[U,S,V] = svd(X);
image = U*S*V';
i = 1;
while(max(abs(image(:)-X(:)))<17)
    S(S<i)=0;
    i = i+0.1;
    image = quantise(U,17)*quantise(S,17)*quantise(V',17);
end
draw(image)
max_dev = max(abs(image(:)-X(:)))

bitsX = bpp(X)*numel(X);
bits = (bpp(quantise(U,1))*numel(U))+(bpp(quantise(S,1))*numel(S))+(bpp(quantise(V,1))*numel(V))