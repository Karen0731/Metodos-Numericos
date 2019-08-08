clear all
close all
clc

syms x

g = input('Grado del polinomio de newton:');
f(x) = input('\n Cual es la funcion f(x):');
Vx = input('Cual es el valor de x:');

for i=1:g+1
    fprintf('Valor de x%d:',i-1);   %%Obtener los valores de Xi
    X(i) = input('');
    F(i) = double(f(X(i)));
end

b(:,1)=F(:);

for j=2:g+1
    for i=1:g-1
        b(i,j)=(b(i+1,j-1)-b(i,j-1))/(X(i+j-1)-X(i)); %%Resolver para cada valor de b
    end
end

aux=1;
numi=b(1,1);

for j=1:g
  aux=aux.*(Vx-X(j)); %%Multiplicar cada posicion del arreglo Vx el cual es el valor de el numero a interpolar menos cada valor del arreglo Xi
  numi=numi+b(1,j+i)*aux; %%Resolver la funcion utilizando los valores del arreglo b y multiplicandolos por el auxiliar 
end

resultado=double(numi)

