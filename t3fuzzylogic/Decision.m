function out= Decision()
x1 = 0:0.1:25;
x2 = 0:1:230;
x3 = 0:0.1:30;
BE = fuzzyTrap(x1,[12,17,25,25]);%Buen encestador
Al = fuzzyTrap(x2,[170,190,230,230]);%Alto
BS = fuzzyTrap(x3,[0,0,11,15]);%Buen sprint, se asume como maximo 30 segundos para los 100m


prompt = '¿Cuántas veces encestó el jugador al lanzar 25 tiros libres? ';
enc = input(prompt);

if enc < 0 || enc > 25
    fprintf('Dato no admisible como entrada.\n');
    return;
end

prompt2 = '¿Cual es la altura del jugador en centímetros? ';
alt = input(prompt2);

prompt3 = '¿En cuantos segundos corrió el jugador los 100 metros planos? ';
sprint = input(prompt3);

act = Activaciones(enc,alt,sprint);
if act(1) == 0 && act(2) == 0 && act(3) == 0
    fprintf('El candidato es adecuado para el equipo con certeza 0.0,\n');
    promptf = 'Si desea evaluar a otro jugador escriba "Si", si desea salir escriba "No" ';
    fin = input(promptf,'s');
    if fin == 'Si'
        Decision();
    elseif fin == 'No'
        return;
    end
    return;
end

pert = Pertenencia(enc,alt,sprint,act);

%Reglas
r1 = 0;
if act(1) > 0 && act(2) > 0
    m1 = min(pert(1),pert(2));
    r1 = m1*0.75;
end

r2 = 0;
if act(1) > 0 && act(3) > 0
    m2 = min(pert(1),pert(3));
    r2 = m2*0.9;
end

r3 = 0;
if act(2) > 0 && act(3) > 0
    m3 = min(pert(2),pert(3));
    r3 = m3*0.75;
end

rf = max(r1, max(r2, r3));


fprintf('El candidato es adecuado para el equipo con una certeza de ' + string(rf) +',\n')
fprintf('porque se evaluó como "alto" con un valor de certeza '+ string(pert(2)) + '(mide '+ string(alt)+ ' cm),\n') 
fprintf('como "buen encestador" con certeza '+ string(pert(1))+' (encestó '+string(enc) +' tiros libres en 25 intentos)\n')
fprintf('y como "rapido" con certeza ' + string(pert(3)) +' (corrió 100 metros planos en ' + string(sprint) +' segundos\n');

promptf = 'Si desea evaluar a otro jugador escriba "Si", si desea salir escriba "No" ';
fin = input(promptf,'s');
if fin == 'Si'
    Decision();
elseif fin == 'No'
    return;
end

end

