clear
load('proj_fit_13.mat');

R_values = 4:20;

results = performance_tester(id,val,R_values);

[values, index] = sort([results(:).mse_val], 'ascend');

sorted_values = results(index);