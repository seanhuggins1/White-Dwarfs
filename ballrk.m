% function dstatedt = ballrk(time, state)
%
% Function returns the two coupled first order derivatives for the motion of a
% ball through the air with a drag force with respect to time
%
% Required Input:
% ===============
%
% time	(:) current integration time
% state (:) state variables [vx; vy; rx; ry]
%  
% Output:
% =======
%
% dstatedt	(:) the rates of change of the state variables with respect to
%               time
%
% Requires: no external m-files
% =========
%
% Example Use: [dvdt,dxdt] = ballrk(5, [10; 2; 3; 2]);
% ============
%
% Author:
% =======
%
% SHuggins 25 Nov. 2018
%
function dstatedt = ballrk(time, state)
    %%Important constants
    %Baseball mass m (kg)
    m = 0.145;    
    %Baseball diameter d (m)
    d = 0.074;
    %Calculate baseball cross-sectional area knowing diameter
    A = pi*((d/2)^2);
    %Gravitational acceleration g (m/s^2)
    g = 9.81;
    %Density of air rho (kg/m^3)
    rho = 1.2;
    %Baseball drag coefficient Cd (Dimensionless)
    Cd = 0.35;
    
    %get state variables
    v = state(1:2);
    r = state(3:4);
    
    %Calculate drag force 
    Fd = -0.5*Cd*rho*A*sqrt(v(1)^2 + v(2)^2).*v;
    
    %Calculate acceleration
    dvxdt = (1/m)*Fd(1);
    dvydt = (1/m)*Fd(2) - g;
    dvdt = [dvxdt; dvydt];
    
    %Calculate velocity
    drdt = v;
    
    %Set dstate/dt
    dstatedt = [dvdt; drdt];   
end
