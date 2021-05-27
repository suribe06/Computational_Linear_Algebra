%n = 6;
n = 8;
H = hilb(10);

A = zeros(10,n);
for i=1:length(H)
    for j=1:n
        A(i,j) = H(i, j);
    end
end

c =ones(n,1);
b = A*c;

%metodo QR
[Q, R] = qr(A);
solQR = R\(Q'*b);

%metodo QR economico
[Q2, R2] = qr(A, 0);
solQReco = R2\(Q2'*b);

%metodo minimo cuadrados
A_ = A'*A;
B_ = A'*b;
solMinCua = A_\B_;
