function out = Activaciones(enc,alt,sprint)
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

