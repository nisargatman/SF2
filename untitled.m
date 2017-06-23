h = halfcos(255);
Y = convse(X,h);
Yh = X-Y;
E = sum(Y(:).^2)
E = sum(Yh(:).^2)