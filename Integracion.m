close all
clear all
clc

fprintf("Este programa realiza integracion por metodos numericos")
fprintf("Cual metodo quieres usar")
fprintf("1.Metodo de trapecio:\n")
fprintf("2.Metodo de trapecio de aplicacion multiple:\n")
fprintf("3.Metodo de Simspson 1/3:\n")
fprintf("4.Metodo de Simspson 1/3 de aplicacion multiple:\n")
fprintf("5.Metodo de Simspson 3/8:\n")

metodo = input('');

syms x
f(x)=input('Cual es la funcoion a utilizar f(x):'); %%Obtener la funcion f(x)
a = input('Cual es el valor inferior:'); %%Obtener valor inferior de la integral
b = input('Cual es el valor superior:'); %%Obtener valor superior de la integral

switch(metodo)
    case 1
        n = 1;
        fx0 = f(a); 
        fxn = f(b); 
        
        fxi=0;
        interv = (b-a)/n; %%Obtener h
        X=zeros(1,n-1); %%Inicializar en ceros
        X(1) = a + interv;
        
        for j=1:n-1
            X(j+1) = X(j) + interv; %%Obtener los valores de a + h desde 1 hasta el numero de segmentos
        end
        for i=1:n-1
            fxi = fxi + 2*f(X(i)); %%Obtener fxi desde uno hasta el numero de segmentos
        end
        l=(b-a)*((fx0+fxi+fxn)/(2*n)); %%Aplicacion de la regla del trapecio
        fprintf('El valor de la integral es: %f',l)
    case 2
        n = input('Valor de n: \n') %%Obtener el numero de segmentos
        fx0 = f(a); 
        fxn = f(b); 
        
        fxi=0;
        interv = (b-a)/n; 
        X=zeros(1,n-1);
        X(1) = a + interv;
        
        for j=1:n-1
            X(j+1) = X(j) + interv;
        end
        for i=1:n-1
            fxi = fxi + 2*f(X(i));
        end
        l=(b-a)*((fx0+fxi+fxn)/(2*n)); %%Aplicacion de la regla del trapecio de aplicacion multiple
        fprintf('El valor de la integral es: %f',l)
    case 3
        n = 3;
        fx0 = f(a); 
        fxn = f(b); 
        
        fxi=0;
        fxj=0;
        interv = (b-a)/n;
        X=zeros(1,n-1);
        X(1) = a + interv;
        
        for j=1:n-1
            X(j+1) = X(j) + interv;
        end
        for i=1:2:n-1
            fxi = fxi + 4*f(X(i));
        end
        for k=2:2:n-1
            fxj = fxj + 2*f(X(k)); %%Multiplicar por dos por el polinomio de interpolacion de segundo grado
        end
        l=(b-a)*((fx0+fxi+fxj+fxn)/(3*n)); %%Aplicacion de la regla de simpson 1/3
        fprintf('El valor de la integral es: %f',l)
    case 4
        n = input('Valor de n: \n')
        fx0 = f(a); 
        fxn = f(b); 
        
        fxi=0;
        fxj=0;
        interv = (b-a)/n;
        X=zeros(1,n-1);
        X(1) = a + interv;
        
        for j=1:n-1
            X(j+1) = X(j) + interv;
        end
        for i=1:2:n-1
            fxi = fxi + 4*f(X(i));
        end
        for k=2:2:n-1
            fxj = fxj + 2*f(X(k));
        end
        l=(b-a)*((fx0+fxi+fxj+fxn)/(3*n)); %%Aplicacion de la regla de simpson 1/3 multiple
        fprintf('El valor de la integral es: %f',l)
    case 5
        n = 3
        fx0 = f(a); 
        fxn = f(b); 
        
        fxi=0;
        fxj=0;
        interv = (b-a)/n;
        X=zeros(1,n-1);
        X(1) = a + interv;
        
        for j=1:n-1
            X(j+1) = X(j) + interv;
        end
        for i=1:2:n-1
            fxi = fxi + 3*f(X(i));
        end
        for k=2:2:n-1
            fxj = fxj + 3*f(X(k));
        end
        l=(b-a)*((fx0+fxi+fxj+fxn)/(3*n)); %%Aplicacion de la regla de Simpson 3/8
        fprintf('El valor de la integral es: %f',l)
end