clear all;
syms x y z;
clc;

error = input("Deme el error:");

fprintf("Primera ecuacion\n");

uno = input("Dame un valor para x1:");
dos = input("Dame un valor para x2:");
tres = input("Dame un valor para x3:");
igual1 = input("Dame el numero al cual sera igualada la primera ecuacion:");

primera(x,y,z) = uno*x + dos*y + tres*z - igual1;

fprintf("Segunda ecuacion\n");

uno = input("Dame un valor para x1:");
dos = input("Dame un valor para x2:");
tres = input("Dame un valor para x3:");
igual2 = input("Dame el numero al cual sera igualada la segunda ecuacion:");

segunda(x,y,z) = uno*x + dos*y + tres*z - igual2;

fprintf("\nTercera ecuacion\n");

uno = input("Dame un valor para x1:");
dos = input("Dame un valor para x2:");
tres = input("Dame un valor para x3:");
igual3 = input("Dame el numero al cual sera igualada la tercera ecuacion:");

tercera(x,y,z) = uno*x + dos*y + tres*z - igual3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=1;

Y(i)=0;
Z(i)=0;

S1 = abs(double(solve(primera(x,Y(i),Z(i)),x)));

array(i) =  S1;
X(i)=array(i);    
cont=0;

aux1=100;
aux2=100;
aux3=100;

while aux1 > error || aux2 > error || aux3 > error
    S2 = double(solve((segunda(X(i),y,Z(i))),y));
    Y(i+1) = S2
    S2 = double(solve((tercera(X(i),Y(i),z)),z));
    Z(i+1) = S2;
    S2 = double(solve((primera(x,Y(i),Z(i+1))),x));
    X(i+1) = S2;
    i = i + 1;
    
    if i-1==0
            eA1(i) = abs((X(i)-0)+100);
            eA2(i) = abs((Y(i)-0)+100);
            eA3(i) = abs((Z(i)-0)+100);
    else
            eA1(i) = abs((X(i)-X(i-1))*100/X(i));
            eA2(i) = abs((Y(i)-Y(i-1))*100/Y(i));
            eA3(i) = abs((Z(i)-Z(i-1))*100/Z(i));
    end
         
    aux1=eA1(i);
    aux2=eA2(i);
    aux3=eA3(i);
end



T = table(X',Y',Z',eA1',eA2',eA3','VariableNames',{'X','Y','Z','eAX','eAY','eAZ'});

T