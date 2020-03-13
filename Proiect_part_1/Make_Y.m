function Y = Make_Y(id)

Y = [];
for i = 1:length(id.X{1})
    for j = 1:length(id.X{1})
        Y = [Y, id.Y(i,j)];
    end
end

Y = Y';
end

