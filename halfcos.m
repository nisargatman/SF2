function h = halfcos(N)

%HALFCOS  Half cosine function.
%  HALFCOS(N) is a half-cosine of length N samples. The amplitude
%  gives unit gain at zero frequency.

h = cos(([1:N]'/(N+1) - 0.5) * pi);
h = h / sum(h);

return


