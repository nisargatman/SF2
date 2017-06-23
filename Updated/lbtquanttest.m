n = 1;
for r = 0.1:0.1:2
    [compRatio,max_abs_deviation] = LBT(X,4,1.4,r);
    c(n) = compRatio;
    e(n) = max_abs_deviation;
    n = n+1
end

% Xc = svdcompress(X);
% n = 1;
% for r = 0.1:0.1:2
%     [compRatio,max_abs_deviation] = LBT(Xc,4,1.4,r);
%     c1(n) = compRatio;
%     e1(n) = max_abs_deviation;
%     n = n+1
% end

rat = 0.1:0.1:2;
plot(rat,c,'r-o')
% hold on
% plot(rat,c1,'b-o')
xlabel('Quantisation ratio')
ylabel('Compression ratio')
figure
plot(rat,e,'r-x')
% hold on
% plot(rat,e1,'b-o')
xlabel('Quantisation ratio')
ylabel('Max absolute deviation')