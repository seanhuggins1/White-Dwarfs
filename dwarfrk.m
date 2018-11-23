%input state as [mass, density]
function dstatedr = dwarfrk(state, radius, param)

    %get state variables
    mass = state(1);
    density = state(2);
    

    gamma = @(x) (x^2)/(3*(1+x^2)^(1/2));
    
  
    dmdr = (radius^2)*density
    dpdr = -(((mass)*density)/((gamma(density^(1/3)))*(radius^2)));

    
    
    %Set dstate/dr
    dstatedr = [dmdr, dpdr];

    
end

