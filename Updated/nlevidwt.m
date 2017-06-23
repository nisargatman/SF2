function Yq = nlevidwt(Yq,n,g1,g2)

if nargin<4
    g1=[1 2 1]/2;
    g2=[-1 -2 6 -2 -1]/4;
end

[m,~] = size(Yq(:,1));
if n>=log2(m)
    error('Too many levels')
end

m = m/(2^(n-1));
t = 1:m;

for i = 1:n
    Yq(t,t) = idwt(Yq(t,t));
    m=m*2;
    t=1:m;
end