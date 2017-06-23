h = [0.25 0.5 0.25];

for i = 1:7
    comp(i) = compression(X,i,h,true,17)
    compq(i) = compression(X,i,h,false,17)
end

h = [1/16 4/16 6/16 4/16 1/16];

for i = 1:7
    comph(i) = compression(X,i,h,true,17)
    compqh(i) = compression(X,i,h,false,17)
end

plot(comp,'-x')
hold on
plot(compq,'r-x')
plot(comph,'m-x')
plot(compqh,'g-x')
xlabel('Pyramid Levels')
ylabel('Compression Ratio')
legend('Uniform Quantising m=2','Non uniform Quantising m=2','Uniform Quantising m=4','Non unifrom quantising m=4')