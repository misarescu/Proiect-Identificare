clear 
load('proj_fit_13.mat')

R = 11;

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
YhatMat = g(X,theta,C,b1,b2);

close all
colormap autumn
ax1 = subplot(2,1,1);
surf(id.X{1,1},id.X{2,1},id.Y', 'FaceColor', 'interp', 'EdgeAlpha', 0.7)
title('Sistemul cunoscut bazat pe datele de identificare');

colorbar

ax2 = subplot(2,1,2);
surf(id.X{1,1},id.X{2,1},YhatMat', 'FaceColor', 'interp', 'EdgeAlpha', 0.7);
colorbar

title(['Sistemul identificat pe datele de identificare',newline,'MSE: ',num2str(mse(id.Y',YhatMat'))]);

xlabel('x1');
ylabel('x2');
zlabel('Y');

hlink = linkprop([ax1,ax2],{'CameraPosition','CameraUpVector'}); 
rotate3d on
addprop(hlink,'PlotBoxAspectRatio')

figure
colormap autumn
ax3 = subplot(2,1,1);
surf(val.X{1,1},val.X{2,1},val.Y', 'FaceColor', 'interp', 'EdgeAlpha', 0.5)
colorbar

Xval = [];
for i = val.X{1,1}
   for j = val.X{2,1}
       elem.x1 = i;
       elem.x2 = j;
       Xval = [Xval, elem];
   end
end
YhatMatVal = g(Xval,theta,C,b1,b2);

title('Sistemul necunoscut bazat pe datele de validare');
ax4 = subplot(2,1,2);
surf(val.X{1,1},val.X{2,1},YhatMatVal', 'FaceColor', 'interp', 'EdgeAlpha', 0.5)
colorbar

title(['Sistemul identificat pe datele de validare',newline,'MSE: ',num2str(mse(val.Y',YhatMatVal'))]);

xlabel('x1');
ylabel('x2');
zlabel('Y');

hlink2 = linkprop([ax3,ax4],{'CameraPosition','CameraUpVector'}); 
rotate3d on
addprop(hlink2,'PlotBoxAspectRatio')