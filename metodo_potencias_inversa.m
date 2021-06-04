function [eigenvec, lambda] = metodo_potencias_inversa(A, s, maxiter)
    %{
    Entrada: Matriz diagonalizable A y un desplazamiento s
    Salida: Retorna el mayor autovalor dominante lambda y el autovector y asociado a lambda
    %}
    n = length(A);
    y = ones(n,1); %vector inicial
    I = eye(n);
    for i=1:maxiter
       v = y/norm(y);
       y = (A-(s*I))\v;
       lambda = v'*y;
    end
    eigenvec = y/norm(y);
    lambda = 1/lambda + s;
end

