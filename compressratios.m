h = [0.25, 0.5, 0.25];

for i = 1:7
    cr(i) = compression(X,i,h,true,17);
end

plot(cr,'o')
xlabel('Pyramid Level')
%ylabel('Compression Ratio')
hold on;
%ylabel('Max Absolute Deviation')
ylabel('RMS Error')

for i = 1:7
    cr(i) = compression(X,i,h,false,17);
end


plot(cr,'ro')
xlabel('Pyramid Level')
%ylabel('Compression Ratio')

%ylabel('Max Absolute Deviation')
ylabel('RMS Error')
legend('Uniform Quantising','Non uniform quantising');