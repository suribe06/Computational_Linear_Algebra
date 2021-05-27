function lectura_uribe()
    %load the pictures
    ancho=100;
    alto=100;
    for k=1:5
        X = sprintf('yasmin%d.jpg',k);
        Y(:,:,k)=imresize( double( rgb2gray( imread(X,'jpg') ) ) , [ancho alto] );
        X = sprintf('korin%d.jpg',k);
        K(:,:,k)=imresize( double( rgb2gray( imread(X,'jpg') ) ) , [ancho alto] );
        X = sprintf('uribe%d.jpg',k);
        U(:,:,k)=imresize( double( rgb2gray( imread(X,'jpg') ) ) , [ancho alto] );
        X = sprintf('JDC%d.jpg',k);
        C(:,:,k)=imresize( double( rgb2gray( imread(X,'jpg') ) ) , [ancho alto] );
        X = sprintf('Andres%d.jpg',k);
        A(:,:,k)=imresize( double( rgb2gray( imread(X,'jpg') ) ) , [ancho alto] );
        X = sprintf('camilo%d.jpg',k);
        CA(:,:,k)=imresize( double( rgb2gray( imread(X,'jpg') ) ) , [ancho alto] );  
    end

    %Plot each person pictures
    figure(1)
    for k=1:5
       subplot(6,5,k), pcolor(flipud(Y(:,:,k))), shading interp, colormap(gray), set(gca,'Xtick',[],'Ytick',[]) 
       subplot(6,5,k+5), pcolor(flipud(K(:,:,k))), shading interp, colormap(gray), set(gca,'Xtick',[],'Ytick',[])
       subplot(6,5,k+10), pcolor(flipud(U(:,:,k))), shading interp, colormap(gray), set(gca,'Xtick',[],'Ytick',[])
       subplot(6,5,k+15), pcolor(flipud(C(:,:,k))), shading interp, colormap(gray), set(gca,'Xtick',[],'Ytick',[])
       subplot(6,5,k+20), pcolor(flipud(A(:,:,k))), shading interp, colormap(gray), set(gca,'Xtick',[],'Ytick',[])
       subplot(6,5,k+25), pcolor(flipud(CA(:,:,k))), shading interp, colormap(gray), set(gca,'Xtick',[],'Ytick',[])
    end
    
    %Creacion de la matriz para tener un conjunto de datos para entrenar
    M = []; %size 10000 x 30
    new_dim = ancho*alto;
    for k=1:5
        M(:,k) = reshape(Y(:,:,k), new_dim, 1);
        M(:,k+5) = reshape(K(:,:,k), new_dim, 1);
        M(:,k+10) = reshape(U(:,:,k), new_dim, 1);
        M(:,k+15) = reshape(C(:,:,k), new_dim, 1); 
        M(:,k+20) = reshape(A(:,:,k), new_dim, 1);
        M(:,k+25) = reshape(CA(:,:,k), new_dim, 1);
    end

    %Use the 29 pictures for training data
    trainingFaces = M(:,1:29);
    avgFace = mean(trainingFaces, 2);
    
    figure(2)
    imagesc(reshape(avgFace,ancho,alto)), colormap gray  %Plot average face
    
    %covariance matrix
    X = trainingFaces - avgFace * ones(1,size(trainingFaces,2));
    %Compute eigen-faces
    [U,S,V] = svd(X,'econ');
    
    figure(3)
    imagesc(reshape(U(:,1),ancho,alto)), colormap gray  % Plot first eigen-face
    figure(4)
    imagesc(reshape(U(:,2),ancho,alto)), colormap gray  % Plot second eigen-face
    figure(5)
    imagesc(reshape(U(:,3),ancho,alto)), colormap gray  % Plot third eigen-face
    
    %use the last picture for trainig
    testFace = M(:,30);
    figure(6)
    imagesc(reshape(testFace,ancho,alto)), colormap gray  % Plot test face
    
    %reconstruct test face with the eigenvectors of the covariance matrix of the trainig data
    testFaceMS = testFace - avgFace;
    r = 27; 
    reconFace = avgFace + (U(:,1:r)*(U(:,1:r)'*testFaceMS));
    figure(7)
    imagesc(reshape(reconFace,ancho,alto)), colormap gray
end