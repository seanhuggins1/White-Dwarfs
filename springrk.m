% function dstatedt = springrk(time, state)
%
% Function returns the two coupled first order derivatives for the motion of a
% damped harmonic oscillator with respect to time
%
% Required Input:
% ===============
%
% time	(:) current integration time
% state (:) state variables [velocity; position]
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
% Example Use: [dvdt,dxdt] = springrk(5, [10; 2]);
% ============
%
% Author:
% =======
%
% SHuggins 25 Nov. 2018
%
function dstatedt = springrk(time, state)
    %get state variables
    v = state(1);
    x = state(2);
    
    %set constants
    k = 15;
    m = 2;
    c = 0.5;
  
    %Calculate acceleration
    dvdt = (-k/m)*x - (c/m)*v;
    
    %Calculate velocity
    dxdt = v;

    %Set dstate/dt
    dstatedt = [dvdt; dxdt]; 
end


