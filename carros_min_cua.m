%Ejercicio carros resuelto sin linealizacion (minimimos cuadrados no lineales)
function xf = carros_min_cua()
    orden = 1e-6;
    nmax = 1000;

    year = [0, 5, 10, 15, 20, 25, 30]'; %vector de años
    cars = [53.05, 73.04, 98.31, 139.78, 193.48, 260.20, 320.39]'; %vector de carros por año
    
    %puntos iniciales
    c1in = 50; 
    c2in = 0;
    
    k = 1;
    while (k <= nmax)
            DR = Dr2(c1in, c2in, year);
            ri = cars - (c1in * exp(c2in*year));
            y = (DR'*DR)\(-DR'*ri);
            xa = [c1in; c2in];
            xf = y + xa;
            if norm(y) < orden
                %fprintf('punto: %0.5e', xf)
                break
            end
            c1in = xf(1);
            c2in = xf(2);
            k = k + 1;
    end
    c1 = xf(1);
    c2 = xf(2);
    w = c1 * exp(c2*year);
    plot(year,cars,'o',year,w)
    
end