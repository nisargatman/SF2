function step = findDWTstep(Y,X,n)

target = std2(X-quantise(X,17));
error = target+100;
step = 1;

while(abs(error-target)>0.01)
    Yq = quantise(Y,step);
    Z = nlevidwt(Yq,n);
    error = std2(X-Z);
    step = step+0.01;
end