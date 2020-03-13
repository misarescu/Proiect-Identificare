function Y = Make_Y_mat(Yin, size)

Y = ones(size,size);

for i = 0:size-1
   for j = 0:size-1
       Y(i+1,j+1) = Yin(i*size + j + 1);
   end
end

end

