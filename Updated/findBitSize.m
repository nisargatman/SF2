function bits = findBitSize(pyramid)

bits = 0;
[~,n] = size(pyramid);
for i = 1:n
    bits = bits + (bpp(quantise(pyramid{2,i},17))*numel(pyramid{2,i}));        
end
bits = bits + bpp(quantise(pyramid{1,n},17))*numel(pyramid{1,n});
end
