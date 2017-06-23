function [compRatio,max_abs_dev] = LBT(X,n,s,r)
    
    N = 8;
    I = size(X,1);
    [Pf,Pr] = pot_ii(N,s);
    t = [(1+N/2):(I-N/2)]; % N is the DCT size, I is the image size
    Xp = X; % copy the non-transformed edges directly from X
    Xp(t,:) = colxfm(Xp(t,:), Pf);
    Xp(:,t) = colxfm(Xp(:,t)', Pf)';
    %figure;
    %draw(Xp*0.5)
    
    C8 = dct_ii(n);
    Xm = Xp-128; % make Xp zero mean
    Y = colxfm(colxfm(Xm,C8)',C8)'; % apply DCT
    
    step = findStepLBT(Y,C8,Pr,X,t,17,r);

    Yq = quantise(Y,step,step*r);
    Yr = regroup(Yq,N);
    num_bits = dctbpp(Yr,16);
    num_bits_or = bpp(quantise(X,17))*numel(X);
    compRatio = num_bits_or/num_bits;
    
    Z = colxfm(colxfm(Yq',C8')',C8') +128;
    Zp = Z; % copy the non-transformed edges directly from Z
    Zp(:,t) = colxfm(Zp(:,t)', Pr')';
    Zp(t,:) = colxfm(Zp(t,:), Pr');
    
    %draw(Zp)
    %error = std2(X-Zp)
    max_abs_dev = max(abs(X(:)-Zp(:)));
    
    
end


