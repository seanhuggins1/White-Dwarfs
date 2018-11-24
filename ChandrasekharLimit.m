%set boundary conditions for state variables



%Set constants for the problem we're trying to solve
ue = 2;    %number

%Setup initial conditions
centralMass = 0;
centralDensity = 20000;

%Setup radius step
radStep = 0.01;




[scaledRadius, scaledState] = RK2Integrator('dwarfrk', [eps,4], radStep, [centralMass centralDensity]);

%Remove imaginary parts
scaledState = real(scaledState);
%Remove negatives
negatives = find((scaledState(:,1)<0)|(scaledState(:,2)<0));
scaledRadius(negatives(2):end,:) = [];
scaledState(negatives(2):end,:) = [];

%Initialize new unscaled arrays
state = [];
radius = [];
%Unscale the masses
state(:,1) = ((5.67*(10^33))/(ue^2)).*scaledState(:,1);
%Unscale the densities
state(:,2) = (9.74*(10^5)*ue).*scaledState(:,2);
%Unscale the radii
radius(:,1) = ((7.72*(10^8))/(ue)).*scaledRadius(:,1);

%Interpolate to find the Chandrasekhar limit
[x, index] = unique(state(:,2)); 
RKclimitR = interp1(x, radius(index,1), 0, 'pchip');
RKclimitM = interp1(x, state(index,1), 0, 'pchip');
hold on
plot([0 max(state(:,1))], [RKclimitR RKclimitR] , 'k--');
plot([RKclimitM RKclimitM],[0 max(radius(:,1))]  , 'k--');

disp(RKclimitR);

%Plot R vs M 
plot(state(:,1),radius(:,1),'b');


%Do the same thing, just now with ode45
[scaledRadius, scaledState] = ode45(@dwarfrk,[eps,4],[centralMass, centralDensity]);

%Remove imaginary parts
scaledState = real(scaledState);
%Remove negatives
negatives = find((scaledState(:,1)<0)|(scaledState(:,2)<0));
scaledRadius(negatives(2):end,:) = [];
scaledState(negatives(2):end,:) = [];

%Initialize new unscaled arrays
state = [];
radius = [];
%Unscale the masses
state(:,1) = ((5.67*(10^33))/(ue^2)).*scaledState(:,1);
%Unscale the densities
state(:,2) = (9.74*(10^5)*ue).*scaledState(:,2);
%Unscale the radii
radius(:,1) = ((7.72*(10^8))/(ue)).*scaledRadius(:,1);

%Interpolate to find the Chandrasekhar limit
[x, index] = unique(state(:,2)); 
ODEclimitR = interp1(x, radius(index,1), 0, 'pchip');
ODEclimitM = interp1(x, state(index,1), 0, 'pchip');
plot([0 max(state(:,1))], [ODEclimitR ODEclimitR] , 'r--');
plot([ODEclimitM ODEclimitM],[0 max(radius(:,1))]  , 'r--');

hold on
%Plot R vs M 
plot(state(:,1),radius(:,1),'r.');


xlabel('White Dwarf Mass (g)');
ylabel('White Dwarf Radius (cm)');

