function step = findStepDCT(Y,C8,X,quantStep,r)

if nargin<5
    quantStep = 17;
    r = 0.5;
end
if nargin < 4
    r = 0.5;
end

step = 1;

target = std2(X-quantise(X,quantStep));
error = target + 100;

while(abs(error-target)>0.01)
    Yq = quantise(Y,step,r*step);
    Z = colxfm(colxfm(Yq',C8')',C8');
    error = std2(X-Z);
    step = step+0.01;
end
