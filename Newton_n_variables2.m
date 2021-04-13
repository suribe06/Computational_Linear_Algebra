function x = Newton_n_variables2(F, x0, orden, nmax)
    %{
    Entrada:
        f: funcion
        x0: valor inicial
        orden: diferencia de error (epsilon)
        nmax: maximo numero de iteraciones
    %}
    k = 1;
    while (k <= nmax)
        DF = Df(x0(1), x0(2));
        y = (DF'*DF)\(-DF'*F(x0));
        x = y + x0;
        if norm(y) < orden
            fprintf("La solucion es %0.5e", x)
            return
        end
        x0 = x;
        k = k + 1;
    end
    fprintf('El metodo fracaso despues de %f iteraciones', k)
end

