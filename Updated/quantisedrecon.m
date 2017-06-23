n = 1;

for r = 0.1:0.1:2
pyramid = lencode(X,4,h);
for j = 1:4
pyramid{2,j} = quantise(pyramid{2,j},17,17*r);
end
pyramid{1,4} = quantise(pyramid{1,4},17,17*r);
c(n) = (bpp(quantise(X,17))*numel(X))/(findSize(pyramid));
% figure
image = ldecode(pyramid,h);
m(n) = max(abs(image(:)-X(:)));
n = n+1;
% draw(image)
% rms(i) = std2(image-X);
end

rat = 0.1:0.1:2;
plot(rat,m,'r-x')

hold on
n = 1;

for r = 0.1:0.1:2
pyramid = lencode(X,4,h);
for j = 1:4
pyramid{2,j} = quantise(pyramid{2,j},17);
end
pyramid{1,4} = quantise(pyramid{1,4},17);
c1(n) = bpp(quantise(X,17))*numel(X)/(findSize(pyramid));
image = ldecode(pyramid,h);
m1(n) = max(abs(image(:)-X(:)));
n = n+1;
% figure
% draw(image)
% rms(i) = std2(image-X);
end

plot(rat,m1,'b-x')