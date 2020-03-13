clear 
close all

na = 5;
nb = 2;
m = 2;

sympref('PolynomialDisplayStyle','descend');
if na == 1
        syms y_1
        pa = y_1;
        
elseif na == 2
        syms y_1 y_2 
        pa = [y_2  y_1];
        
elseif na == 3
        syms y_1 y_2 y_3 
        pa = [y_3  y_2  y_1];
        
elseif na == 4
        syms y_1 y_2 y_3 y_4 
        pa = [y_4  y_3  y_2  y_1];
        
elseif na == 5
        syms y_1 y_2 y_3 y_4 y_5
        pa = [y_5  y_4  y_3  y_2  y_1];
        
elseif na == 6
        syms y_1 y_2 y_3 y_4 y_5 y_6 
        pa = [y_6  y_5  y_4  y_3  y_2  y_1];
        
elseif na == 7
        syms y_1 y_2 y_3 y_4 y_5 y_6 y_7
        pa = [y_7  y_6  y_5  y_4  y_3  y_2  y_1];
        
elseif na == 8
        syms y_1 y_2 y_3 y_4 y_5 y_6 y_7 y_8
        pa = [y_8  y_7  y_6  y_5  y_4  y_3  y_2  y_1];
        
elseif na == 9
        syms y_1 y_2 y_3 y_4 y_5 y_6 y_7 y_8 y_9 
        pa = [y_9  y_8  y_7  y_6  y_5  y_4  y_3  y_2  y_1];
        
elseif na == 10
        syms y_1 y_2 y_3 y_4 y_5 y_6 y_7 y_8 y_9 y_10
        pa = [y_10  y_9  y_8  y_7  y_6  y_5  y_4  y_3  y_2  y_1];
        
end

if nb == 1
        syms u_1
        pb = u_1;

elseif nb == 2
        syms u_1 u_2
        pb = [u_2  u_1];

elseif nb == 3
        syms u_1 u_2 u_3 
        pb = [u_3  u_2  u_1];
        
elseif nb == 4
        syms u_1 u_2 u_3 u_4 
        pb = [u_4  u_3  u_2  u_1];
        
elseif nb == 5
        syms u_1 u_2 u_3 u_4 u_5
        pb = [u_5  u_4  u_3  u_2  u_1];
        
elseif nb == 6
        syms u_1 u_2 u_3 u_4 u_5 u_6 
        pb = [u_6  u_5  u_4  u_3  u_2  u_1];
        
elseif nb == 7
        syms u_1 u_2 u_3 u_4 u_5 u_6 u_7
        pb = [u_7  u_6  u_5  u_4  u_3  u_2  u_1];
        
elseif nb == 8
        syms u_1 u_2 u_3 u_4 u_5 u_6 u_7 u_8
        pb = [u_8  u_7  u_6  u_5  u_4  u_3  u_2  u_1];
        
elseif nb == 9
        syms u_1 u_2 u_3 u_4 u_5 u_6 u_7 u_8 u_9 
        pb = [u_9  u_8  u_7  u_6  u_5  u_4  u_3  u_2  u_1];
        
elseif nb == 10
        syms u_1 u_2 u_3 u_4 u_5 u_6 u_7 u_8 u_9 u_10
        pb = [u_10  u_9  u_8  u_7  u_6  u_5  u_4  u_3  u_2  u_1];
end

syms x 
p = collect(expand(poly2sym([pa,pb,1],x)^m))

transpose(fliplr(coeffs(p,x)))

