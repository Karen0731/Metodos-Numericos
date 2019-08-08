syms x

xl = input("Dame valor para xl:");
xu = input("Dame valor para xu:");

f(x)=input("Dame la funcion f(x):");

eS=input("Dame el error eS:");
eA = 10000;
xrAnt=0;

if f(xl)*f(xu)<0
    while(eA > eS)
        xr=(xl+xu)/2;
        if f(xl)*f(xr)<0
            xu=xr;
        elseif f(xl)*f(xr)>0
            xl=xr;
        else
            fprintf("La raiz es: %d",xr);
        end 
        %seguimos
        eA=abs((xr-xrAnt)*100/xr);
        xrAnt=xr;
    end
else
    fprintf("No existe la raiz en ese intervalo")
end