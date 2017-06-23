function bits = dctbpp(Yr,N)

bits = 0;
[a,b] = size(Yr);
for i = 1:N:(N*N)-N+1
    for j = 1:N:(N*N)-N+1
        im = Yr([i:i+(a/N-1)],[j:j+(b/N-1)]);
        bits = bits + bpp(im)*numel(im);
    end
end