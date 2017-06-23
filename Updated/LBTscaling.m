steps = [];
ratios = [];

n = 1;
for s = 1:0.01:2
    [step,compRatio] = LBT(X,8,s);
    disp('passes')
    steps(n) = step;
    ratios(n) = compRatio;
    n = n+1
end

s = 1:0.01:2;
plot(s,steps,'-x')
xlabel('Scaling Factor')
ylabel('Step Size')
figure;
plot(s,ratios,'-o')
xlabel('Scaling Factor')
ylabel('Compression Ratio')
    
    