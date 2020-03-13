function results = performance_tester(id, val, R_vector)    
    results = [];
    for R = R_vector
        x1_min = id.X{1,1}(1);
        x1_max = id.X{1,1}(end);

        x2_min = id.X{2,1}(1);
        x2_max = id.X{2,1}(end);

        grid_x1 = linspace(x1_min, x1_max, R);
        grid_x2 = linspace(x2_min, x2_max, R);

        b1 = abs(x1_max - x1_min) / (R-1);
        b2 = abs(x2_max - x2_min) / (R-1);


        X = [];
        for i = id.X{1,1}
           for j = id.X{2,1}
               elem.x1 = i;
               elem.x2 = j;
               X = [X, elem];
           end
        end

        C = [];
        for i = grid_x1
           for j = grid_x2
              elem.x1 = i;
              elem.x2 = j;
              C = [C, elem];
           end
        end

        PHI = [];
        for i = 1:length(C)
            PHI = [PHI,phi(X,C,i,b1,b2)'];
        end

        Y = Make_Y(id);

        theta = inv(PHI' * PHI) * PHI' * Y;
        
        Xval = [];
        for i = val.X{1,1}
           for j = val.X{2,1}
               elem.x1 = i;
               elem.x2 = j;
               Xval = [Xval, elem];
           end
        end
        YhatMatVal = g(Xval,theta,C,b1,b2);

        YhatMat = g(X,theta,C,b1,b2);
        
        error.R = R;
        error.mse_id = mse(id.Y,YhatMat);
        error.mse_val = mse(val.Y,YhatMatVal);
        results = [results, error];
    end
end

