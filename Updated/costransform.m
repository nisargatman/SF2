function [Z,compRatio,error] = costransform(X,n,r)

    if nargin<2
        n=8;
    end

    C8 = dct_ii(n);
    Xm = X-mean(X(:)); % make X zero mean

    Y = colxfm(colxfm(Xm,C8)',C8)'; % apply DCT
    
    N = 8;
    Yreg = regroup(Y,N);
    %draw(Yreg)
    energy = energysubimages(Yreg,N);

    %plot(energy(:))

    Z = colxfm(colxfm(Y',C8')',C8'); % decode the image

    %bases = [zeros(1,8); C8'; zeros(1,8)];
    %figure;
    %draw(255*bases(:)*bases(:)');
    
    step = findStepDCT(Y,C8,X,17,r);

    Yq = quantise(Y,step,step*r);
    Yr = regroup(Yq,n);
     %Yr = suppressDCT(Yr,n,thresh);
%     draw(Yr/8)
%     Yq = regroup(Yr,256/n);

    num_bits = dctbpp(Yr,N);
    num_bits_or = bpp(Yr)*numel(Yr);
    compRatio = (bpp(quantise(X,17))*numel(X))/num_bits;

    Z = colxfm(colxfm(Yq',C8')',C8');% decode the image quantised
    %draw(Z);
    rms = std2(X-Z);
    error = max(abs(Xm(:)-Z(:)));
end


