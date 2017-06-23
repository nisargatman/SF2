for i = 1:7
pyramid = lencode(X,i,h);
for j = 1:i
pyramid{2,j} = quantise(pyramid{2,j},17);
end
pyramid{1,i} = quantise(pyramid{1,i},17);
figure
image = ldecode(pyramid,h);
draw(image)
rms(i) = std2(image-X);
end