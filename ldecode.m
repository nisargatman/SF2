function image = ldecode(tree,h)

% decode a pyramid of arbitary length

[~,n] = size(tree);

for i = n:-1:1
    Xni = rowint(tree{1,i},2*h);
    Xni = rowint(Xni',2*h);
    Xni = Xni';
    if i~=1
        tree{1,i-1} = Xni + tree{2,i};
    else
        image = Xni + tree{2,1};
    end
end
    