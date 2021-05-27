function sol = coord_spherical(X, n_satelites)
    
    rho = 26570; 
    c = 299792.458; %velocidad de la luz
    
    A = zeros(n_satelites,1);
    B = zeros(n_satelites,1);
    C = zeros(n_satelites,1);
    t = zeros(n_satelites,1);
    for i=1:n_satelites
        phi_max = pi/2;
        phi = (phi_max-0)*rand(1,1) + 0;

        theta_max = 2*pi;
        theta = (theta_max-0)*rand(1,1) + 0;

        A(i) = rho*cos(phi)*cos(theta);
        B(i) = rho*cos(phi)*sin(theta);
        C(i) = rho*sin(phi);
        R = sqrt((A(i)-X(1))^2 + (B(i)-X(2))^2 + (C(i)-X(3))^2);
        t(i) = X(4) + R / c;
    end
    sol = [A, B, C, t];
end