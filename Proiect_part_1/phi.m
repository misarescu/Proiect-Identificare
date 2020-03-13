function out = phi(X, C, i, b1, b2)

gauss1 = zeros(1,length(X));
gauss2 = zeros(1,length(X));

for j = 1:length(X)
    gauss1(j) = ((X(j).x1 - C(i).x1)./b1)^2;
end

for j = 1:length(X)
    gauss2(j) = ((X(j).x2 - C(i).x2)./b2)^2;

end


out = exp(-gauss1 - gauss2);

end

