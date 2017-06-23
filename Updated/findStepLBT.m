function step = findStepLBT(Y,C8,Pr,X,t,quantStep,r)

    if nargin<7
        quantStep = 17;
    end
    step = 1;

    target = std2(X-quantise(X,17));
    error = target + 100;

    while(abs(error-target)>0.1)
        Yq = quantise(Y,step,r*step);
        Z = colxfm(colxfm(Yq',C8')',C8');
        Zp = Z; % copy the non-transformed edges directly from Z
        Zp(:,t) = colxfm(Zp(:,t)', Pr')';
        Zp(t,:) = colxfm(Zp(t,:), Pr');
        error = std2(X-Zp);
        step = step + 0.1;
    end

end

