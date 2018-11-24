%set boundary conditions for state variables



%Set constants for the problem we're trying to solve
ue = 2;    %number

%Setup initial conditions
centralMass = 0;
centralDensity = 2.5;

%Setup radius step
radStep = 0.01;




[scaledRadius, scaledState] = RK2Integrator('dwarfrk', [eps,4], radStep, [centralMass centralDensity]);


%Remove imaginary parts
scaledState = real(scaledState);

state = [];
radius = [];
%Unscale the masses
state(:,1) = ((5.67*(10^33))/(ue^2)).*scaledState(:,1);
%Unscale the densities
state(:,2) = (9.74*(10^5)*ue).*scaledState(:,2);
%Unscale the radii
radius(:,1) = ((7.72*(10^8))/(ue)).*scaledRadius(:,1);

hold on
%Plot R vs M 
plot(radius(:,1),state(:,2));

[x, index] = unique(x); 
yi = interp1(x, y(index), xi);
cLimit = interp1(state(:,2),radius(:,1), 0,'spline');


[scaledRadius, scaledState] = ode45(@dwarfrk,[eps,4],[centralMass, centralDensity]);

%Remove imaginary parts
scaledState = real(scaledState);

state = [];
radius = [];
%Unscale the masses
state(:,1) = ((5.67*(10^33))/(ue^2)).*scaledState(:,1);
%Unscale the densities
state(:,2) = (9.74*(10^5)*ue).*scaledState(:,2);
%Unscale the radii
radius(:,1) = ((7.72*(10^8))/(ue)).*scaledRadius(:,1);

%Plot R vs M 
%plot(state(:,1),radius(:,1),'ro');
