function energy = energysubimages(Yreg,N)

    [a,b] = size(Yreg);
    n = 0;
    % calculate energies of sub images
    for i = 1:N:(N*N)-N+1
        for j = 1:N:(N*N)-N+1
            im = Yreg([i:i+(a/N-1)],[j:j+(b/N-1)]);
            energy(n+1) = sum(im(:).^2);
            n = n+1;
        end
    end
    
    energy = reshape(energy, [8,8]);
    