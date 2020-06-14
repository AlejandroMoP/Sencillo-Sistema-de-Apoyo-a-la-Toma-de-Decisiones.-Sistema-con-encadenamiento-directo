function out = Pertenencia(enc,alt,sprint,act)
x1 = 0:0.1:25;
x2 = 0:1:230;
x3 = 0:0.1:30;
BE = fuzzyTrap(x1,[12,17,25,25]);%Buen encestador
AL = fuzzyTrap(x2,[170,190,230,230]);%Alto
BS = fuzzyTrap(x3,[0,0,11,15]);%Buen sprint, se asume como maximo 30 segundos para los 100m

valores = zeros(1,3);
if act(1) == 1
    valores(1) = fuzymemb(enc,[12,17,25,25],'BE');
end
if act(2) == 1
    valores(2) = fuzymemb(alt,[170,190,230,230],'AL');
end
if act(3) == 1
    valores(3) = fuzymemb(sprint,[0,0,11,15],'BS');
end
    
out = valores;    
    
end

