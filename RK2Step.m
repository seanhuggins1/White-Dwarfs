% function [newIndepVar, newState] = RK2Step(derivsRK, indepVar, step, state)
%
% RK2Step performs a single forward step of a numerical integration using
% the second order Runge Kutta scheme
%
% Required Input:
% ===============
%
% derivsRK (:) the name of a function which returns derivatives of state
%               variables with respect to the independent variable, and pertains to the
%               problem we wish to solve
% indepVar (:) the current value of the independent variable
% step (:) the size of the integration step (constant)
% state (:) the current state variables
%  
% Output:
% =======
%
% newIndepVar (:) returns the value of the independent variable at a
%                   forward integration step
% newState (:) returns the value of the state variables at a forward integration step            
%
% Requires: no external m-files
% =========
%
% Example Use: [newIndepVar,newState] = RK2Step('ballrk', 6, 0.01, [5; 8; 3; 7]);
% ============
%
% Author:
% =======
%
% SHuggins 25 Nov. 2018
%
function [newIndepVar, newState] = RK2Step(derivsRK, indepVar, step, state)

    %Calculate xstar
    xstar = state + ((1/2)*step).*feval(derivsRK, indepVar, state);
    
    %Update the state using 2nd order Runge Kutta
    newState = state + step.*feval(derivsRK,indepVar + (1/2)*step, xstar);
 
    %Return our updated independent variable along with the updated state
    newIndepVar = indepVar + step;
     
end

