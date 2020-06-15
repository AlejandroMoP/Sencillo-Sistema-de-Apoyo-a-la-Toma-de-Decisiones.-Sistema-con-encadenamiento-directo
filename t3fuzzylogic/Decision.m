function out= Decision()
global vect %Variable solo para guardar los 10 ejemplos con datos en una tabla
vect = [0 0 0 0];
while true %bucle
    prompt = '¿Cuántas veces encestó el jugador al lanzar 25 tiros libres? \n ';%preguntas
    enc = input(prompt);

    if enc < 0 || enc > 25%dominio de la var enc
        fprintf('Dato no admisible como entrada.\n');
        return;
    end

    prompt2 = '¿Cual es la altura del jugador en centímetros? \n';
    alt = input(prompt2);
    
    if alt < 0 || alt > 230%dominio de la var alt
        fprintf('Dato no admisible como entrada.\n');
        return;
    end

    prompt3 = '¿En cuantos segundos corrió el jugador los 100 metros planos? \n';
    sprint = input(prompt3);
    
    if sprint < 0 || sprint > 30%dominio de la var sprint
        fprintf('Dato no admisible como entrada.\n');
        return;
    end

    act = Activaciones(enc,alt,sprint);
    if act(1) == 0 && act(2) == 0 && act(3) == 0%caso de no gatillar niinguna regla
        vect = [vect;[enc, alt, sprint, 0.0]];
        fprintf('El candidato es adecuado para el equipo con certeza 0.0,\n');
        promptf = 'Si desea evaluar a otro jugador escriba "Si", si desea salir escriba "No" \n';
        fin = input(promptf,'s');
        if fin == 'Si'
            continue;
        elseif fin == 'No'
            break;
        end
    end

    pert = Pertenencia(enc,alt,sprint,act);%grado de pertenencia de cada regla 

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

    rf = max(r1, max(r2, r3));%maximo de los consecuentes
    
    vect = [vect;[enc, alt, sprint, rf]];
    fprintf('El candidato es adecuado para el equipo con una certeza de ' + string(rf) +',\n')
    fprintf('porque se evaluó como "alto" con un valor de certeza '+ string(pert(2)) + '(mide '+ string(alt)+ ' cm),\n') 
    fprintf('como "buen encestador" con certeza '+ string(pert(1))+' (encestó '+string(enc) +' tiros libres en 25 intentos)\n')
    fprintf('y como "rapido" con certeza ' + string(pert(3)) +' (corrió 100 metros planos en ' + string(sprint) +' segundos\n');

    promptf = 'Si desea evaluar a otro jugador escriba "Si", si desea salir escriba "No" \n';
    fin = input(promptf,'s');

    if fin == 'Si'
        continue;
    elseif fin == 'No'
        break;
    end
end

end