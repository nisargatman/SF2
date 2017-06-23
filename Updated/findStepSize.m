function step = findStepSize(X,quantStep,pyramid,n,h,mrise)

Xq = quantise(X,quantStep,mrise);
    target = std2(X-Xq);
    error = target +100;
    step = 1;
    while(abs(error-target)>0.1)
        pyramidQuantised = pyramid;
        for i = 1:n
            pyramidQuantised{2,i} = quantise(pyramid{2,i},step);
        end
        pyramidQuantised{1,n} = quantise(pyramid{1,n},step);
        image = ldecode(pyramidQuantised, h);
        error = std2(X-image);
        step = step + 0.01;
    end
end
