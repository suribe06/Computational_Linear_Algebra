function x = Newton_punto1(X,A,B,C,t,n_satelites, orden, nmax)
    k = 1;
    while k < nmax
        DF = Df_punto1(X,n_satelites,A,B,C,t);
        F = F_punto1(X,n_satelites,A,B,C,t);
        y = (DF'*DF)\(-DF'*F);
        x = y + X;
        if norm(y) < orden
            %fprintf("La solucion es %0.5e", x)
            return
        end
        X = x;
        k = k+1;
    end
    fprintf('El metodo fracaso despues de %f iteraciones\n', k)
end