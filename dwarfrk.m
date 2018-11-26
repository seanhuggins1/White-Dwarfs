% function dstatedr = dwarfrk(radius, state)
%
% Function returns the two coupled first order derivatives for density and mass in
% the interior of a White Dwarf star with respect to radius
%
% Required Input:
% ===============
%
% radius (:) the current integration radius
% state (:) the state variables [mass, density]
%
% Output:
% =======
%
% dstatedr	(:) the rates of change of the state variables with respect to
%               radius          
%
% Requires: no external m-files
% =========
%
% Example Use: dstatedr = dwarfrk(10, [1000; 4250])
% ============
%
% Author:
% =======
%
% SHuggins 25 Nov. 2018
%
function dstatedr = dwarfrk(radius, state)
    %get state variables
    mass = state(1);
    density = state(2);
    
    %Define a function for gamma to make life easier
    gamma = @(x) (x^2)/(3*(1+x^2)^(1/2));
    
    %Calculate our derivitaves
    %d(mass)/dr
    dmdr = (radius^2)*density;
    %d(density)/dr
    dpdr = -(((mass)*density)/((gamma(density^(1/3)))*(radius^2)));

    %Set dstate/dr
    dstatedr = [dmdr; dpdr];  
end

