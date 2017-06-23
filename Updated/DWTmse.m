function dwtstep = DWTmse(N)

dwtenergy = zeros(3, N+1);

w = 256;
empty = zeros(w, w);

m = w;
for i=1:N
    m = m/2;
    for j=1:3
        Y = empty; % DWT of black image is also black
        
        if j == 1
            Y(1.5*m, 0.5*m) = 100;
        elseif j == 2
            Y(1.5*m, 1.5*m) = 100;
        else
            Y(0.5*m, 1.5*m) = 100;
        end
        
        % Reconstruct and get the energy
        Z = nlevidwt(Y, N);
        dwtenergy(j, i) = energy(Z);
    end
end

% Quantise the lowpass image
Y = zeros(w, w);
Y(0.5*m, 0.5*m) = 100;
Z = nlevidwt(Y, N);
dwtenergy(1, N+1) = energy(Z);

dwtstep = 1./sqrt(dwtenergy);
dwtstep = dwtstep ./ min(min(dwtstep));
