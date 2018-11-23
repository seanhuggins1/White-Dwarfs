%set boundary conditions for state variables



%Set constants for the problem we're trying to solve
ue = 2;    %number

centralMass = 0;
centralDensity = 1/10;
radStep = 0.01;





%Setup the initial scaled state
scaledState(1, :) = [centralMass, centralDensity];
%Setup the initial scaled radius
scaledRadius(1,:) = eps;

ode45(@dwarfrk,[eps,4],scaledState(1, :))


j=1;
while scaledState(j,2) > 0
    [scaledState(j+1, :), scaledRadius(j+1,:)] = RK2Step(scaledState(j, :),scaledRadius(j),radStep,'dwarfrk',0);
    j = j+1;
end

%Remove imaginary parts
scaledState = real(scaledState);

%Unscale the masses
state(:,1) = ((5.67*(10^33))/(ue^2)).*scaledState(:,1);
%Unscale the densities
state(:,2) = (9.74*(10^5)*ue).*scaledState(:,2);

%Unscale the radii
radius(:) = ((7.72*(10^8))/(ue)).*scaledRadius(:);


