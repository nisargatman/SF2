C8 = dct_ii(8);
Xm = X-128; % make X zero mean

Y = colxfm(colxfm(Xm,C8)',C8)'; % apply DCT

N = 8;
%draw(regroup(Y,N)/N);
energy = [];

Yreg = regroup(Y,N)/N;
%draw(Yreg)
[a,b] = size(Y);
% calculate energies of sub images
for i = 1:N:(N*N)-N+1
    for j = 1:N:(N*N)-N+1
        im = Yreg([i:i+(a/N-1)],[j:j+(b/N-1)]);
        energy(i,j) = sum(im(:).^2);
    end
end
plot(energy(:))

Z = colxfm(colxfm(Y',C8')',C8'); % decode the image

bases = [zeros(1,8); C8'; zeros(1,8)];
%figure;
%draw(255*bases(:)*bases(:)');

Yr = regroup(Y,N)/N;
Yq = quantise(Yr,17);
draw(Yq)

num_bits = dctbpp(Yq,N)
num_bits_or = bpp(Yr)*numel(Yr)

Z = colxfm(colxfm(Yq',C8')',C8'); % decode the image quantised
rms = std2(X-Z);
error = max(abs(X(:)-Z(:)));

