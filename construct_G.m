function G = construct_G(A,q, n)
    G = zeros(n,n);
    for i=1:n
        for j=1:n
            nj = sum(A(j,:));
            G(i, j) = (q/n) +((A(j,i)*(1-q))/nj);
        end
    end
end