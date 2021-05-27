function sol = punto3(A, B, C, t)
    %{
    Entrada: 
        A, B, y C coordenadas de satelites
        t vector de tiempo
    Salida:
        Problema satelites resuelto con formula cuadratica
    %}
    
    c = 299792.458; %velocidad de la luz;
    
    %ecuaciones lineales en forma vectorial
    ux = [2*(A(2)-A(1)); 2*(A(3)-A(1)); 2*(A(4)-A(1))];
    uy = [2*(B(2)-B(1)); 2*(B(3)-B(1)); 2*(B(4)-B(1))];
    uz = [2*(C(2)-C(1)); 2*(C(3)-C(1)); 2*(C(4)-C(1))];
    ud = [2*c^2*(t(1)-t(2)); 2*c^2*(t(1)-t(3)); 2*c^2*(t(1)-t(4))];
    w1 = (A(1)^2-A(2)^2)+(B(1)^2-B(2)^2)+(C(1)^2-C(2)^2)+(c^2*(t(2)^2-t(1)^2));
    w2 = (A(1)^2-A(3)^2)+(B(1)^2-B(3)^2)+(C(1)^2-C(3)^2)+(c^2*(t(3)^2-t(1)^2));
    w3 = (A(1)^2-A(4)^2)+(B(1)^2-B(4)^2)+(C(1)^2-C(4)^2)+(c^2*(t(4)^2-t(1)^2));
    w = [w1; w2; w3];
    
    %rectas con ecuacion punto pendiente
    mx = -(det([uy, uz, ud])/det([uy, uz, ux]));
    bx = -(det([uy, uz, w])/det([uy, uz, ux]));
    
    my = -(det([ux, uz, ud])/det([ux, uz, uy]));
    by = -(det([ux, uz, w])/det([ux, uz, uy]));
    
    mz = -(det([ux, uy, ud])/det([ux, uy, uz]));
    bz = -(det([ux, uy, w])/det([ux, uy, uz]));
    
    %reemplazo en f1
    A_ = (mx^2 + my^2 + mz^2 - c^2);
    B_ = 2*(mx*(bx-A(1)) + my*(by-B(1)) + mz*(bz-C(1)) + c^2*t(1));
    C_ = ((A(1)-bx)^2 + (B(1)-by)^2 + (C(1)-bz)^2 - c^2*t(1)^2);
    
    %solucion formula cuadratica con sym y solve
    eq = sym(string(A_))*sym('d')^2 + sym(string(B_))*sym('d') + sym(string(C_));
    soleq = solve(eq == 0, sym('d'));
    
    %Encontrar las otras variables con sym y subs
    x1 = sym(string(mx))*sym('d') + sym(string(bx));
    vx1 = subs(x1,sym('d'), soleq(1));
    y1 = sym(string(my))*sym('d') + sym(string(by));
    vy1 = subs(y1,sym('d'), soleq(1));
    z1 = sym(string(mz))*sym('d') + sym(string(bz));
    vz1 = subs(z1,sym('d'), soleq(1));
    
    x2 = sym(string(mx))*sym('d') + sym(string(bx));
    vx2 = subs(x2,sym('d'), soleq(2));
    y2 = sym(string(my))*sym('d') + sym(string(by));
    vy2 = subs(y2,sym('d'), soleq(2));
    z2 = sym(string(mz))*sym('d') + sym(string(bz));
    vz2 = subs(z2,sym('d'), soleq(2));
    
    sol = [[vx1;vy1;vz1;soleq(1)], [vx2;vy2;vz2;soleq(2)]];
end