function bits = findSize(pyramid)

    bits = 0;
    [~,n] = size(pyramid);
    for i = 1:n
        bits = bits + bpp(pyramid{2,i})*numel(pyramid{2,i});
    end
    bits = bits + bpp(pyramid{1,n})*numel(pyramid{1,n});
end
