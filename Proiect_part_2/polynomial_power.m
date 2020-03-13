function result = polynomial_power(polynom, power)

result = polynom;

for k = 1:power-1
    result = conv(result,polynom);
end

end

