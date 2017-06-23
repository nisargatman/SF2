% apply DCT



% apply LBT



% apply Laplacian pyramid
c = [];
m = [];
r = [];
rise = 1;
h = [0.25,0.5,0.25];
for i = 1:7
    [compRatio, max_abs_dev, rms] = compression(X,i,h,false,17,rise);
    c = [c compRatio];
    m = [m max_abs_dev];
    r = [r rms];
end

plot(c)
figure
plot(m)
figure
plot(r)
% apply DWT