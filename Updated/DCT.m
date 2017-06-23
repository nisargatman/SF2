function DCT(X,n)

    if nargin<2
        n = 8;
    end
    
    I = size(X,1);
    N = 8;
    [Pf Pr] = pot_ii(N);
    
    % pre filtering
    t = [(1+N/2):(I-N/2)];
    Xp = X;
    Xp(t,:) = colxfm(Xp(t,:),Pf);
    Xp(:,t) = colxfm(Xp(:,t)',Pf)';

    % apply DCT
    C8 = dct_ii(n);
    Xm = Xp-128; % make X zero mean
    Y = colxfm(colxfm(Xm,C8)',C8)';
    step = findStepDCT(Y,C8,X);
    Yq = quantise(Y,step);
    Z = colxfm(colxfm(Yq',C8')',C8')+128;
   
    Zp = Z; % copy the non-transformed edges directly from Z
    Zp(:,t) = colxfm(Zp(:,t)', Pr')';
    Zp(t,:) = colxfm(Zp(t,:), Pr');
    
    %Yreg = regroup(Y,N);
    %energy = energysubimages(Yreg,N);
    %plot(energy(:))
    Yr = regroup(Yq,N);

    num_bits = dctbpp(Yr,N);
    num_bits_or = bpp(Yr)*numel(Yr);

    %Z = colxfm(colxfm(Yq',C8')',C8')+128;% decode the image quantised
    %draw(Z)
    rms = std2(X-Zp);
    error = max(abs(X(:)-Zp(:)));
    
    bitsX = bpp(quantise(X,17))*numel(X);
    compRatio = bitsX/num_bits;
end


