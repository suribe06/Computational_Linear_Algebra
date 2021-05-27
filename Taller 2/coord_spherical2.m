function sol = coord_spherical2(X)
    
    rho = 26570; 
    c = 299792.458; %velocidad de la luz
    
    A = zeros(4,1);
    B = zeros(4,1);
    C = zeros(4,1);
    t = zeros(4,1);
    
    %phis con 5% de distancia entre si
    incremento_phi = 5*pi/2/100;
    phis = zeros(4,1);
    phis(1) = pi/4;
    for i=2:4
        phis(i) = phis(i-1) + incremento_phi;
    end
    %thetas con 5% de distancia entre si
    incremento_theta = 5*2*pi/100;
    thetas = zeros(4,1);
    thetas(1) = pi;
    for i=2:4
        thetas(i) = thetas(i-1) + incremento_theta;
    end
    
    for i=1:4
        phi = phis(i);
        theta = thetas(i);
        A(i) = rho*cos(phi)*cos(theta);
        B(i) = rho*cos(phi)*sin(theta);
        C(i) = rho*sin(phi);
        R = sqrt((A(i)-X(1))^2 + (B(i)-X(2))^2 + (C(i)-X(3))^2);
        t(i) = X(4) + R / c;
    end
    sol = [A, B, C, t];
end