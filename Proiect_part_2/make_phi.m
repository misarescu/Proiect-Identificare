function phi = make_phi(y,u, na, nb, nk, m)

N = length(y);
line = polynomial_power([y(1:na)',u(1:nb+nk-1)'],m);
M = length(line);

phi = [];

max_delay = max(na,nb);

for i = 1+max_delay+nk:N
    A = y(i-na:i-1)';
    B = u(i-nk-nb+1:i-1)';
    line = polynomial_power([A,B,1],m);
    phi(i,:) = line;
end

end

