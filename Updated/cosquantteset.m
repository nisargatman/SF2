n = 1;
for r = 0.1:0.1:2
    [Z,compRatio,error] = costransform(X,8,r);
    c(n) = compRatio;
    e(n) = std2(X-Z);
    s(n) = ssim(Z,X);
    n = n+1
end

% draw(Z)
% figure
Xc = svdcompress(X);
n = 1;
for r = 0.1:0.1:2
    [Z,compRatio,error] = costransform(Xc,8,r);
    c1(n) = compRatio;
    e1(n) = std2(X-Z);
    s1(n) = ssim(Z,X);
    n = n+1
end
% draw(Z)
% figure

rat = 0.1:0.1:2;
plot(rat,c,'r-o')
hold on
plot(rat,c1,'b-o')
xlabel('Quantisation ratio')
ylabel('Compression ratio')
legend('Without SVD','With low rank approximation with SVD')
figure
plot(rat,e,'r-x')
hold on
plot(rat,e1,'b-o')
xlabel('Quantisation ratio')
ylabel('Max absolute deviation')
legend('Without SVD','With low rank approximation with SVD')

% figure
% plot(rat,s,'r-x')
% hold on
% plot(rat,s1,'b-o')
% xlabel('Quantisation ratio')
% ylabel('SSIM')