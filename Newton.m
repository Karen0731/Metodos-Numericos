syms x

op=input("Opcion 1. Newton-Rhapson, Opcion 2 Secante (Seleccione el metodo que requiera):");

%%Newton Rhapson
if(op==1)
    xi(1)=input("Dame valor para x inicial:");
    f(x)=input("Dame la funcion f(x):");
    F(x)=diff(f);

    eS=input("Dame el error eS:");

    aux=100;
    i=1;

     while aux > eS
          
        xi(i+1)=xi(i)-(f(xi(i))/F(xi(i)));
        
        if i-1==0
            eA(i) = abs((xi(i)-0)+100);
        else
            eA(i) = abs((xi(i+1)-xi(i))*100/xi(i+1));
        end
         
        aux=eA(i);
        i = i+1;
     end
     
     
xi=xi(1:length(xi)-1);

T= table(xi',eA','VariableNames',{'xi','eA'});
    
end

%%secante
if(op==2)
    xi(1)=input("Dame valor para xi (inicial):");
    xA = input("Dame un valor para xi-1:")
    f(x)=input("Dame la funcion f(x):");
    
    eS=input("Dame el error eS:");

    aux=100;
    i=1;

     while aux > eS
            if(i==1)
                xi(i+1)=xi(i)-((f(xi(i))*(xA-xi(i)))/(f(xA)-f(xi(i))));
            elseif(i>1)
                xi(i+1)=xi(i)-((f(xi(i))*(xi(i-1)-xi(i)))/(f(xi(i-1))-f(xi(i))));
            end
            

            if i-1==0
                eA(i) = abs((xi(i)-0)+100);
            else
                eA(i) = abs((xi(i+1)-xi(i))*100/xi(i+1));
            end
         
            aux=eA(i);
            i = i+1;
     end
     
     
xi=xi(1:length(xi)-1);

T= table(xi',eA','VariableNames',{'xi','eA'});
    
end


    