function alpha = fuzzyTrap(x,p)
[n,m] = size(x);
if n>1 && m >1
    error('Las matrices no son soportadas por esta funcion, cambie x')
end
if length(p)~= 4
    error('Los parametros tienen que ser 4')
end

alpha= zeros(n,m);

if p(1)>p(2) || p(2)>p(3) || p(3)>p(4) 
    error('Los Parametros deben estar ordenados')
end

for i = 1:max(n,m)
    if x(i) >=p(1) && x(i)<=p(2)
        alpha(i)= 1/(p(2)-p(1))*(x(i)-p(1));
    elseif x(i)>=p(2) && x(i) <=p(3)
        alpha(i)=1;
    elseif x(i) >=p(3) && x(i) <=p(4)
        alpha(i)=1/(p(3)-p(4))*(x(i)-p(4));
    else
        alpha(i)=0;
    end
    if isnan(alpha(i))
        alpha(i) = 1;
    end
end

