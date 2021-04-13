function sol = Df(x, y)
    %Funcion para el Jacobiano
    f1 = [(x+1)/sqrt((x+1)^2 + (y)^2), (y)/sqrt((x+1)^2 + (y)^2)];
    f2 = [(x-1)/sqrt((x-1)^2 + (y-0.5)^2), (y-0.5)/sqrt((x-1)^2 + (y-0.5)^2)];
    f3 = [(x-1)/sqrt((x-1)^2 + (y+0.5)^2), (y+0.5)/sqrt((x-1)^2 + (y+0.5)^2)];
    sol = [f1; f2; f3];
end