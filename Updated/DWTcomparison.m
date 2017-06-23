% Direct quantisation
Xq = quantise(X, 17);
directError = std2(X-Xq);
bitsDirect = bpp(Xq) * numel(Xq);

for i=1:2
    crs = zeros(1, 7);
    for N=1:7

        if i==1
        dwtstep = ones(3, N+1);
        fprintf('Constant step\n');
    else
        dwtstep = DWTmse(N);
        fprintf('MSE\n');
    end
        
        f = @(x)DWTerror(X, N, x*dwtstep);
        x = bisectionSearch(f, directError, 0.001, 100);

        Y = nlevdwt(X, N);
        Yq = DWTquantise(Y, N, x*dwtstep);
        Z = nlevidwt(Yq, N);

        % Should be the same as directError
        DWTerr = std2(X-Z);

        % Calculate the CR
        bitsDWT = DWTentropy(Yq, N);
        bitsDirect;
        CR = bitsDirect/bitsDWT;

        fprintf('CR for N = %d: %f\n', N, CR);
        figure
        draw(Z)
        
        crs(1, N) = CR;
    end
    if i==1
        uniformCR = crs;
    else
        mseCR = crs;
    end
end

figure
set(gcf,'color','w');
set(0,'DefaultAxesFontSize',12);

plot(1:7, uniformCR, 'k', 'linewidth', 1.5);
hold on
plot(1:7, mseCR, 'r', 'linewidth', 1.5);
hold off
title('Compression ratios versus number of levels', 'FontSize', 15)
xlabel('Number of levels');
ylabel('Compression ratio');

legend('Uniform step size', 'MSE')