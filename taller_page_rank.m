n = 15;
%Matriz de adyacencia A
A = zeros(n,n);
A(5,1)=1;
A(1,2)=1;
A(3,2)=1;
A(2,3)=1;
A(4,3)=1;
A(8,4)=1;
A(2,5)=1;
A(9,5)=1;
A(3,6)=1;
A(9,6)=1;
A(2,7)=1;
A(12,7)=1;
A(3,8)=1;
A(12,8)=1;
A(1,9)=1;
A(13,9)=1;
A(5,10)=1;
A(6,10)=1;
A(7,10)=1;
A(9,10)=1;
A(14,10)=1;
A(6,11)=1;
A(7,11)=1;
A(8,11)=1;
A(12,11)=1;
A(14,11)=1;
A(4,12)=1;
A(15,12)=1;
A(10,13)=1;
A(14,13)=1;
A(13,14)=1;
A(15,14)=1;
A(11,15)=1;
A(14,15)=1;

%{
   Matriz de adyacencia A:
   fila i: arcos salientes desde el nodo i
   columna j: arcos entrantes al nodo i
%}

%punto 1
%{
    Una matriz A es estocastica si (I) cada una de sus entradas a_i,j >= 0 
    y (II) la suma de cada una de sus columnas es 1.

    (I) Como G es una matriz que se obtiene a partir de probabilidades cada
    una de sus entradas g_i,j >= 0, pues no hay probabilidades negativas
    
    (II) Cada columna i fija de G indica la probabilidad de que desde la
    pagina i salte a la pagina j. Por tanto la columna i indica todas las
    probabilidades de posibles opciones de salto a a las n paginas de la red,
    por lo que si sumamos todas esas probabilidades obtendremos 100%, lo que
    es equivalente a 1, es decir, cada columna i suma 1.
%}

%punto 2
q = 0.15;
G = construct_G(A, q, n);
[eigenvec_p, lambda] = metodo_potencias(G, 500);
Gp = G * eigenvec_p; %G*p = lambda*p

%punto 3
%{
   q hace referencia a la probabilidad de 'saltos aleatrios', es decir, 
   q es la probabilidad de que el surfista se quede estatico en una pagina,
   y (1-q) es la probabilidad de que el surfista haga click para cambiar a 
   una pagina aleatoria
%}
%punto 3a
q = 0;
G2 = construct_G(A, q, n);

%punto 3b
q = 0.5;
G3 = construct_G(A, q, n);

%{
    A menor valor de q, la probabilidad de salto de pagina a una aleatoria 
    (q/n + A_ji(1-q)/nj) aumenta para las paginas j que tienen enlaces
    directos en la pagina i (basandose en la matriz de adyacencia A), ya
    que la probabilidad de salto de las otras paginas (las que no poseen link directo)
    se va acercando a 0
%}

%punto 4
A(2,7) = 2;
A(12,7) = 2;
q = 0.15;
G4 = construct_G(A, q, n);
%{
    La estrategia si tiene exito pues se esta aumentamdo la cantidad de links
    directos (a 2) de la pagina 7 en la pagina 2 y 12, lo que en la matriz G
    se verifica que en las respectivas columnas 2 y 12 en la fila 7 la
    probabilidad aumento, (al haber mas links directos a una misma pagina
    la probabilidad de llegar a esta aumenta, y claramente las otras disminuyen, 
    cabe resaltar que disminuye la probabilidad de las paginas que tienen arcos
    con 2 y 12, porque las que no tienen arcos, la probabilidad sique siendo q/n)
%}

%punto 5
%Volvemos la matriz A como estaba
A(2,7) = 1;
A(12,7) = 1;
%Eliminamos las entradas relacionadas a la pagina 10
A(10,:) = zeros(1,n); %eliminamos las entradas de la fila 10
A(:,10) = zeros(n,1); %eliminamos las entradas de la columna 10
q = 0.15;
G5 = construct_G(A, q, n);
%{
    Al remover la pagina 10 de la red la fila 10 de la matriz G no tendra
    valores pues no puedo moverme a otra pagina desde una pagina que no
    existe. Tambien, la probabilidad de las paginas j que tienen links en
    la pagina i, y en la pagina i estaba la pagina 10, aumentan su
    probabilidad, pues al ya no estar la pagina 10 la probabilidad para las
    demas paginas j aumenta, veamos un ejemplo. La pagina 5 tenia links a
    la pagina 1 y 10 con probabilidad 0.435 cada una, al elimar la pagina
    10 de la red la probabilidad de saltar desde la pagina 5 a la 1 subio a 
    0.86, las demas que no tienen un arco directo se mantienen en
    probabilidad q/n.
%}

%punto 6
%Mi red se representa por la matriz de adyacencia A_
A_ = [0 1 1 1 0 0; 0 0 1 0 0 1; 0 0 0 1 0 0; 0 0 0 0 1 0; 0 0 0 1 0 0; 1 0 0 0 0 0];
n = 6;
q = 0.15;
G_ = construct_G(A_, q, n);
[eigenvec_p2, lambda2] = metodo_potencias(G_, 200);
Gp2 = G_ * eigenvec_p2; %G*p = lambda*p

%{
   Las paginas a las que puedo llegar desde la pagina 1, son las que tienen 
   menor probabilidad (como se ve en la columna 1 de G_) a comparacion de 
   las demas, esto ocurre debido a que desde la apgina tengo 3 paginas con
   link directo (2,3,4) siendo este el mayor grado de un nodo en la red, el
   resto de probabilidad son mas altas debido a que los nodos tienen grados
   de salida de 1 y 2 (a excepcion de la pagina 1).
%}
