h = [0.25 0.5 0.25];

for i = 1:7
    comp(i) = compression(X,i,h,true,17)
    compq(i) = compression(X,i,h,false,17)
end

h = [1/16,4/16,6/16,4/16,1/16];

for i = 1:7
    comph(i) = compression(X,i,h,true,17)
    comphq(i) = compression(X,i,h,false,17)
end

plot(comp,'o')
hold on
plot(compq,'go')
plot(comph,'ro')
plot(comphq,'mo')
legend('Uniform Quantising m = 2', 'Non uniform Quantising m = 2', 'Uniform Quantising m = 4', 'Non Uniform Quantising m = 4')