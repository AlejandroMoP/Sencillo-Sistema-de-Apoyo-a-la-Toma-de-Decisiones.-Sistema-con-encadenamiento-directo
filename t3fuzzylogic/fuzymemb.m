function y = fuzymemb(n,CD,nombre)
% n numero, CD conjunto difuso, nombre es el nombre de la caracteristica a analizar
x1 = 0:0.1:25;
x2 = 0:1:230;
x3 = 0:0.1:30;



%n=round(n,2); 

if nombre == 'BE'
    A = fuzzyTrap(x1,CD);
    for i = 1:1:max(size(x1))
        bool=ismembertol(x1(i),n);
        if bool == true
            y=A(i);
        end
    end

elseif nombre == 'AL'
    A = fuzzyTrap(x2,CD);
    for i = 1:1:max(size(x2))
        bool=ismembertol(x2(i),n);
        if bool == true
            y=A(i);
        end
    end


elseif nombre == 'BS'
    A = fuzzyTrap(x3,CD);
    for i = 1:1:max(size(x3))
        bool=ismembertol(x3(i),n);
        if bool == true
            y=A(i);
        end
    end
    
end
    
end

