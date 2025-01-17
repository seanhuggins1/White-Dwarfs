% function [indepVar,state] = RK2Integrator(derivsRK, indepVarSpan,  step, initialState )
%
% RK2Integrator performs an integration of a system of coupled first order
% ODEs pertaining to a problem we wish to solve
%
% Required Input:
% ===============
%
% derivsRK	(:) the name of a function which returns derivatives of state
%               variables with respect to the independent variable, and pertains to the
%               problem we wish to solve
% indepVarSpan (:) the span of the independent variable that we are
%                  integrating over
% step (:) the size of the integration step (constant)
% initialState (:) the boundary/initial conditions of our problem
%  
% Output:
% =======
%
% indepVar	(:) returns an array of the time span divided by the step size
% state (:) returns a column matrix of each state variable over the entire integration              
%
% Requires: RK2Step.m
% =========
%
% Example Use: [indepVar,state] = RK2Integrator('ballrk', [1 10], 0.01, [5; 10; 0; 1]);
% ============
%
% Author:
% =======
%
% SHuggins 25 Nov. 2018
%
function [indepVar,state] = RK2Integrator(derivsRK, indepVarSpan,  step, initialState )

%Place the initial state in the first spot of the state array
state(:,1) = initialState;
%Place the initial independent variable in its first spot
indepVar(:,1) = indepVarSpan(1);

%Integrate over the entire independent variable span
for j = 1:(((indepVarSpan(end) - indepVarSpan(1))/step)-1)
    %Call RK2 step to advance the state forward
    [indepVar(:, j+1), state(:, j+1)] = RK2Step(derivsRK, indepVar(:,j), step, state(:, j));
end

%Transpose to return column vectors
indepVar = indepVar';
state = state';
end

