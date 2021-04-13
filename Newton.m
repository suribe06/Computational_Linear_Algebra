function [x, ex] = Newton(f, df, x0, orden, nmax)
    %{
    Entrada:
        f: funcion
        df: derivada de la funcion
        x0: valor inicial
        orden: diferencia de error (epsilon)
        nmax: maximo numero de iteraciones
    %}
    x = zeros(1, nmax-1);
    ex = zeros(1, nmax-1);
    x(1) = x0 - (f(x0)/df(x0));
    ex(1) = abs(x(1)-x0);
    k = 2;
    while (ex(k-1) >= orden) && (k <= nmax)
        x(k) = x(k-1) - (f(x(k-1))/df(x(k-1)));
        ex(k) = abs(x(k)-x(k-1));
        k = k+1;
    end
end
