photo_name = 'photo.jpg';
X = imread(photo_name); %cargar la imagen en matlab
A = rgb2gray(X); %convertir a blanco y negro
figure(1)
imshow(A);
A = double(A); %castear la matriz a double
[U,S,V] = svd(A,'econ'); %calculo de SVD
A = uint8(A);

%Haciendo uso de la diagonal con U y V completas
D = diag(S);
n = 50;
DD = D(1:n);
S11 = diag(DD);
S2 = zeros(851, 851);
S2(1:n, 1:n) = S11;
A2 = U*S2*V';
A2 = uint8(A2);
figure(2)
imshow(A2);


%Haciendo uso de la diagonal con U y V comprimidas
D = diag(S);
totalAporte = sum(D);
x = (1/totalAporte)*D*100;
figure(3)
plot(x, 'o');
title('Aporte de cada valor singular en %');

n = 50;
DD = D(1:n);
S11 = diag(DD);
U1 = U(:,1:n);
V1 = V(:,1:n);
A2 = U1*S11*V1';
A2 = uint8(A2);
figure(4)
imshow(A2);
