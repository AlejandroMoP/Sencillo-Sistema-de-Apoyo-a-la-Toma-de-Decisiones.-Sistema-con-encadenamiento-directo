function out = Activaciones(enc,alt,sprint)%enc:n° entero cuantas veces encesto, alt:entero en centimietros altura, 
%sprint:segundos en los que corrió
z = zeros(1,3);

if enc >= 12
    z(1) = 1;
end
if alt >= 170
    z(2) = 1;
end
if sprint <= 15
    z(3) = 1;
end

   
out = z;
end

