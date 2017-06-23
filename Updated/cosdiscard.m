n = 1;

for thresh = 0:0.001:0.01
    [Z,compRatio,error] = costransform(X,8,0.5,thresh);
    c(n) = compRatio;
    e(n) = error;
    n=n+1
end

th = 0:0.001:0.01;
plot(th,c,'r-x')
xlabel('Energy threshold for discarding sub images')
ylabel('Compression Ratio')
figure
plot(th,e,'r-o')
xlabel('Energy threshold for discarding sub images')
ylabel('Reconstruction error')
    