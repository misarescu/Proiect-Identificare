function out = mse(Y,Yhat)

N = length(Y);

out = 0;

for i = 1:N
    for j = 1:N
        out = (Y(i,j)-Yhat(i,j))^2;
    end
end

out = out/(N^2);

end

