function [global_max, max_error_pos] = punto5(X, n_satelites, orden, nmax)
    c = 299792.458; %velocidad de la luz
    max_error_pos = 0;
    global_max = 0;
    posibilidades = 2^n_satelites; %(-dt, +dt)
    for i=1:posibilidades
        %calculo de coordenadas esfericas
        sphe = coord_spherical2(X);
        A = sphe(:,1)';
        B = sphe(:,2)';
        C = sphe(:,3)';
        t = sphe(:,4)';
        
        %calculo aleaotrio para tiempo en relojes atomicos
        opciones = [-1,1];
        dt = zeros(1,4);
        for j=1:4
            randInd = randperm(length(opciones),1);
            signo = opciones(randInd);
            dt(j) = 10^-8 * signo;
        end
        new_t = t + dt;
        
        %metodo de Newton
        x = Newton_punto1(X,A,B,C,new_t,n_satelites, orden, nmax);
        
        %factor de magnificacion del error
        f_error = norm(x(1:3) - X(1:3),'inf');
        b_error = c*10^-8;
        emf = f_error/b_error;
        if emf > global_max
            global_max = emf; %se guarda el valor maximo
            max_error_pos = f_error; %se guarda el valor maximo de error de posicion
        end
    end
end