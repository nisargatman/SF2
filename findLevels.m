function levels = findLevels(X,quantStep,pyramid,n,h)
energy = [];
    test = zeros(256,256);
    testPyramid = lencode(test,n,h);
    for i = 1:n
        s = size(testPyramid{2,i})/2;
        testPyramid{2,i} (s,s) = 100;
        image = ldecode(testPyramid,h);
        energy(i) = sum(image(:).^2);
        testPyramid{2,i} (s,s) = 0;
    end
    s = size(testPyramid{1,n})/2;
    if s<1
        s=1;
    end
    testPyramid{1,n} (s,s) = 100;
    image = ldecode(testPyramid,h);
    energy(i+1) = sum(image(:).^2);
    ratios = 1./sqrt(energy);
    ratios = ratios/ratios(1);
    
    Xq = quantise(X,quantStep); % quantise image
    target = std2(X-Xq);
    error = target + 100; % random initialisation for error
    
    r = 1;
    while(abs(error-target)>0.01)
        pyramidQuantised = pyramid;
        for i = 1:n
            pyramidQuantised{2,i} = quantise(pyramid{2,i},ratios(i)*r);
        end
        pyramidQuantised{1,n} = quantise(pyramid{1,n},ratios(i+1)*r);
        image = ldecode(pyramidQuantised, h);
        error = std2(X-image);
        r = r + 0.01;
    end
    levels = r*ratios;
end


