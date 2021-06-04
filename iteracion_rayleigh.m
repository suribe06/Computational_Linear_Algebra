function [eigenvec, lambda] = iteracion_rayleigh(A, maxiter)
    n = length(A);
    y = ones(n,1); %vector inicial
    I = eye(n);
    for i=1:maxiter
        v = y/norm(y);
        lambda = (v'*A*v)/(v'*v); %cociente de rayleigh
        y = (A-(lambda*I))\v;  
    end
    eigenvec = y/norm(y);
end 