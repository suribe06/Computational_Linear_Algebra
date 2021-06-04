function [eigenvec, lambda] = metodo_potencias(A, maxiter)
    %{
    Entrada: Matriz diagonalizable A, vector y
    Salida: Retorna el mayor autovalor dominante lambda y el autovector y asociado a lambda
    %}
    n = length(A);
    y = ones(n,1); %vector inicial
    for i=1:maxiter
        v = y/norm(y); %autovector asociado al mayor autovalor
        y = A*v;
        lambda = (v'*A*v)/(v'*v); %aproxima el autovalor (cociente_rayleigh) 
    end
    eigenvec = v/norm(v);
end

