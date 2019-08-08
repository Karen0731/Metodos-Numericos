clear all
close all
clc

syms x

g = input('Grado del polinomio de lagrange:');
f(x) = input('\n Cual es la funcion f(x):');
Vx = input('Cual es el valor de x:');

for i=1:g+1
    fprintf('Valor de x%d:',i-1);   %%Obtener los valores de Xi
    X(i) = input('');
    F(i) = f(X(i));
end

Inter=0; %%Inicializar en cero

for j=1:g+1
    Lagr=1; %%Inicializar en 1 para no multiplicar por cero
    for k = 1:g+1 %%Se inicializa desde 1 para no generar problema a la hora de multiplicar
        if j ~= k %%Mientras j deas diferente de k
            Lagr = Lagr * (Vx-X(k))/(X(j)-X(k)); %%Multiplicacion con valores sustituidos en la formula
        end
    end
    Inter = Inter + Lagr * f(X(j)); %%La multiplicacion anterior de multiplica por los valores que da el usuario evaluados en la funcion
end

fprintf('Resultado:')
double(Inter) %%Imprirmir el resultado