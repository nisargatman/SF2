function max_abs_dev = compression(X,n,h,uniformQuantise,quantStep)

%assume image already loaded into workspace as X

% --- edit these ---

%n = 4;
%h = [0.25,0.5,0.25];
%h = [1/16,4/16,6/16,4/16,1/16];
%uniformQuantise = false; % quantise all levels equally or according to MSE
%quantStep = 17; % step size for quantising image to check for uniform quantising scheme

% ------------------

pyramid = lencode(X,n,h);
pyramidQ = pyramid;

if uniformQuantise
    % find optimum quantisation step for all pyramid levels
    step = findStepSize(X,quantStep,pyramid,n,h);
    
    % quantise pyramid according to scheme
    for i = 1:n
        pyramidQ{2,i} = quantise(pyramid{2,i},step);
    end
    pyramidQ{1,n} = quantise(pyramid{1,n},step);
else
    % find optimum quantisation levels for each pyramid level
    levels = findLevels(X,quantStep,pyramid,n,h);
    
    % quantise pyramid according to scheme
    for i = 1:n
        pyramidQ{2,i} = quantise(pyramid{2,i},levels(i));
    end
    pyramidQ{1,n} = quantise(pyramid{1,n},levels(n+1));
end

image = ldecode(pyramidQ,h);

max_abs_dev = max(abs(image(:)-X(:)));
rms = std2(X-image);

bitsX = bpp(X)*numel(X);
bitsXq = bpp(quantise(X,quantStep))*numel(X);
bitsp = findSize(pyramid);
bitspq = findSize(pyramidQ);

compRatiop = bitsX/bitsp;
compRatioq = bitsX/bitsXq;
compRatiopq = bitsX/bitspq;
compRatio = bitsXq/bitspq;



        
    