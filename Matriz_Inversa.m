
n = input("Cuantas variables:");

for i=1:n
    for j=1:n
        fprintf("Cual es el valor de la posicion A(%d,%d):",i,j);
        A(i,j) = input("\n");
    end 
end 

C = [A,eye(n)];  %% crea la matriz C con la matriz del usuario y despues con ceros y unos
flag = 0;

for k=1:n*n
    D(:,:,k) = eye(n);  %% Crea la matriz D del tamaño n*n con ceros y unos
end

k = n*n;    %% K es igual a la ultima posicion del arreglo

for j=1:n
    cont = 0;   %% reinicia el contador
    while cont < n %% mientras el contador sea menor a n
        for i=1:n
            if i==j && cont<n   %%revisa si las pasiciones del arrego son iguales
                
                if((C(i,j))==0) %%revisa si la posicion en D no se esta dividiendo entre 0
                    D(i,:,k)= 0;    %%Si se dicide entre cero esa posicion es igual a cero
                    C(i,:)=0;       %%Lo mismo para C
                    flag = 1;       %%flag se vuelve 1 para pasar a lo siguiente del arreglo
                    cont = cont +1; %%contador aumenta
                    k = k-1;        %% k disminuye para pasar a la anterior posicion del arreglo
                else
                    D(i,:,k)= (1/C(i,j))*D(i,:,k);  %%divide la posicion del arreglo entre el mismo y lo multiplica por todo el renglon
                    C(i,:)=(1/C(i,j))*C(i,:);       %%Lo mismo para C
                    flag = 1;
                    cont = cont +1;
                    k = k-1;
                end
                
            elseif flag == 1 && cont<n  %%si las posiciones del arreglo no son iguales 
                D(i,:,k)= -C(i,j)*D(j,:,k)+D(i,:,k);    %realiza la suma del inverso de la posicion del arreglo
                C(i,:)=-C(i,j)*C(j,:)+C(i,:);           %lo mismo para C
                cont = cont + 1;
                k = k-1;
            end
        end
    end
    flag = 0;
end

DD=eye(n);      %%inicializa la matriz DD con ceros y unos
for m=1:n*n
    DD(:,:)=DD(:,:)*D(:,:,m);   %%Corrobora que la multiplicacion de cada operacion realizada es la inversa de C
end

