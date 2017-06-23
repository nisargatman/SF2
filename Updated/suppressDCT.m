function Ys = suppressDCT(Yr, N, thresh)
Ys=Yr;

% Ys = Yr;
blocksize = size(Ys,1)/N;

% Assume that the DC has the biggest energy
DCenergy = energy(Ys(1:blocksize, 1:blocksize));

for i=1:blocksize:N*blocksize
    for j=1:blocksize:N*blocksize
        block = Ys(i:i+blocksize-1, j:j+blocksize-1);
        if energy(block)/DCenergy < thresh
            Ys(i:i+blocksize-1, j:j+blocksize-1) = 0;
        end
    end
end
