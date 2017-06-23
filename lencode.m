function tree = lencode(X,n,h)

% X is the image, n is the number of levels, tree is a vector of the
% laplacian pyramid

tree = cell(2,n);

for i = 1:n
    X1 = rowdec(X,h);  % decimate rows
    X1 = rowdec(X1',h);
    X1 = X1';

    Y0 = rowint(X1,2*h);
    Y0 = rowint(Y0',2*h);
    Y0 = X-Y0'; % combining steps of transposing image and subtracting from original
    
    tree{1,i} = X1;
    tree{2,i} = Y0;
    X = X1;
end

