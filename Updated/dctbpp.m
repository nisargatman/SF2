function bits = dctbpp(Yr,N)

bits = 0;
a = size(Yr,1)/N;
for i = 1:a:N*a
    for j = 1:a:N*a
        im = Yr([i:i+a-1],[j:j+a-1]);
        bits = bits + bpp(im)*numel(im);
    end
end