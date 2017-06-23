% TODO: put into loop

h = [0.25,0.5,0.25]; % filter samples

% --- Level 1 -----

X1 = rowdec(test,h);  % decimate rows
X1 = rowdec(X1',h);
X1 = X1';

Y0 = rowint(X1,2*h);
Y0 = rowint(Y0',2*h);
Y0 = test-Y0'; % combining steps of transposing image and subtracting from original

% --- Level 2 -----

X2 = rowdec(X1,h);  % decimate rows
X2 = rowdec(X2',h);
X2 = X2';

Y1 = rowint(X2,2*h);
Y1 = rowint(Y1',2*h);
Y1 = X1-Y1'; % combining steps of transposing image and subtracting from original

% --- Level 3 ----

X3 = rowdec(X2,h);  % decimate rows
X3 = rowdec(X3',h);
X3 = X3';

Y2 = rowint(X3,2*h);
Y2 = rowint(Y2',2*h);
Y2 = X2-Y2'; % combining steps of transposing image and subtracting from original

% --- Level 4 ----

X4 = rowdec(X3,h);  % decimate rows
X4 = rowdec(X4',h);
X4 = X4';

Y3 = rowint(X4,2*h);
Y3 = rowint(Y3',2*h);
Y3 = X3-Y3'; % combining steps of transposing image and subtracting from original

draw(beside(Y0,beside(Y1,beside(Y2,beside(Y3,X4)))))

