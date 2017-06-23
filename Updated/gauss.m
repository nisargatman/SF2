function h = gauss(N)

variance = 1;
h = (1/sqrt(2*pi*variance))*exp(-[1:N]/(2*variance));
h = h/sum(h);

return