clear
close all

load('iddata-04.mat');

results = [];

% creem fiecare combinatie de na, nb, nk si m
% cu conditiile ca na >= nb, nb >= nk
for m = 1:5
    for nk = 1: 10
        for nb = nk : 10
            for na = nb : 10
                
                t_id = id_array(:,1);
                u_id = id_array(:,2);
                y_id = id_array(:,3);

                t_val = val_array(:,1);
                u_val = val_array(:,2);
                y_val = val_array(:,3);

                PHI = make_phi(y_id, u_id,na,nb,nk,m);
                theta = PHI\y_id;

                y_hat_id = simulate_output(u_id, y_id, theta, na, nb, nk, m);

                mse_id = mean((y_id-y_hat_id).^2);

                y_hat_val = simulate_output(u_val, y_val, theta, na, nb, nk, m);

                mse_val = mean((y_val-y_hat_val).^2);
                
                final_combination.na = na;
                final_combination.nb = nb;
                final_combination.nk = nk;
                final_combination.m = m;
                final_combination.mse_id = mse_id;
                final_combination.mse_val = mse_val;
               
                results = [results, final_combination];
            end
        end
    end
end

[values, index] = sort([results(:).mse_val], 'ascend');

% valorile cele mai bune, sortate dupa eroarea medie patratica pe 
% datele de validare 
sorted_values = results(index);