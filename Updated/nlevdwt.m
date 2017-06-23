function Y = nlevdwt(X,n,h1,h2)

if nargin < 4
    h1=[-1 2 6 2 -1]/8;
    h2=[-1 2 -1]/4;
end

m = size(X(:,1));
if n>=log2(m)
    error('Too many levels')
end

Y = dwt(X);
for i = 2:n
    m = m/2;
    t = 1:m;
    Y(t,t) = dwt(Y(t,t));
end
    