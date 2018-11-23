%set boundary conditions for state variables
centralMass = 0;
centralDensity = 1/10;
time = 1;
tau = 0.001;

j=1;

state(1, :) = [centralMass, centralDensity]

while state(j,2) > 0
    state(j+1, :) = RK2Integrator(state(j, :),time,tau,'dwarfrk',0)
    j = j+1;
end

