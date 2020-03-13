clear
close all

load('iddata-04.mat');

% valori alese folosind scriptul pick_parameters.m
na = 5;
nb = 2;
nk = 1;
m = 2;

t_id = id_array(:,1);
u_id = id_array(:,2);
y_id = id_array(:,3);

t_val = val_array(:,1);
u_val = val_array(:,2);
y_val = val_array(:,3);

PHI = make_phi(y_id, u_id,na,nb,nk,m);
theta = PHI\y_id;

y_hat_id = simulate_output(u_id, y_id, theta, na, nb, nk, m);

plot(t_id,y_id) ,hold on
plot(t_id,y_hat_id);

mse_id = mean((y_id-y_hat_id).^2);
title(['id, mse = ',num2str(mse_id)]);
legend('real','simulated');

figure

y_hat_val = simulate_output(u_val, y_val, theta, na, nb, nk, m);

plot(t_val,y_val);
hold on
plot(t_val,y_hat_val);

mse_val = mean((y_val-y_hat_val).^2);
title(['val, mse = ',num2str(mse_val)]);

legend('real','simulated');