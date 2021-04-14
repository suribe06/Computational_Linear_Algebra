function [q,r]=GramSchmidtQR(A)
    [n, m] = size(A);
    q = zeros(n,m);
    r = zeros(m,m);
    for k=1:m
        y = A(:,k);
        for j=1:k-1
            r(j,k) = dot(A(:,k), q(:,j));
            y = y - r(j,k) * q(:,j);
        end
        r(k,k) = norm(y);
        q(:,k) = y/r(k,k);
    end
end