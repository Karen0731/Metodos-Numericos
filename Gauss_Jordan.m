
n = input("Cuantas variables:");

for i=1:n
    for j=1:n
        fprintf("Cual es el valor de la posicion A(%d,%d):",i,j);
        A(i,j) = input("\n");
    end 
end 

for i=1:n
    fprintf("Cuales son los valores resultados:");
    B(i) = input("\n");
end

C = [A,B'];
[r,c] = size(C);                    %obtiene las filas y columnas de la matriz completa "C"

D = [A,B'];

for i=1:c-1  
    
  if(C(i,i)==0)
       C(i,:)=0;
  else
       C(i,:) = C(i,:)/C(i,i);       %divide la fila del numero i por el numero que se tiene que normalizar solo si el denominador != 0
  end  
    
    for j=i+1:r
    C(j,:) = C(j,:)-C(i,:)*C(j,i);    
    j = j+1;
    end
    
  i = i+1;
  
end 

for i=r:-1:2                          %%realiza lo mismo para la parte superior de la matriz
    
  for j=i-1:-1:1
    C(j,:) = C(j,:)-C(i,:)*C(j,i);   
    j = j-1;
  end
  
  i = i-1;
end

C
