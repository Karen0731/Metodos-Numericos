syms x

xl(1) = input("Dame valor para xl:");
xu(1) = input("Dame valor para xu:");

f(x)=input("Dame la funcion f(x):");

eS=input("Dame el error eS:");
xrAnt=0;



if f(xl(1))*f(xu(1)) < 0
    i = 1;
        aux=100;
    while aux > eS
        
        xr(i)=(xl(i)+ xu(i))/2;
        
        if f(xl(i))*f(xr(i)) < 0
            xu(i+1) = xr(i);
            xl(i+1) = xl(i);
        elseif f(xl(i)) * f(xr(i)) > 0
            xl(i+1) = xr(i);
            xu(i+1) = xu(i);
        else
            fprintf("La raiz es: %d",xr(i));
            %%%%%%%
        end 
        
        if i-1==0
            eA(i) = abs((xr(i)-0)*100/xr(i));
        else
            eA(i) = abs((xr(i)-xr(i-1))*100/xr(i));
            %%%xrAnt=xr;
        end
            
        aux=eA(i);
        i = i+1;
    end
else
    fprintf("No existe la raiz en ese intervalo")
end


xl=xl(1:length(xl)-1);
xu=xu(1:length(xu)-1);

T= table(xl',xr',xu',eA','VariableNames',{'xl','xr','xu','eA'});
