function out = g(X,theta, C, b1, b2)

out = zeros(sqrt(length(X)),sqrt(length(X)));

Xc = [];
for i = 1:sqrt(length(X))
    for j =  1:sqrt(length(X))
        elem.x1 = i;
        elem.x2 = j;
        Xc = [Xc, elem];
    end
end

for i = 1 : length(X)
    for j = 1 : length(C)
        out(Xc(i).x1,Xc(i).x2) = out(Xc(i).x1,Xc(i).x2) + exp(-(((X(i).x1-C(j).x1)/b1)^2)-((X(i).x2-C(j).x2)/b2)^2) * theta(j);
    end
end

end

