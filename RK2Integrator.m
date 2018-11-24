function [indepVar,state] = RK2Integrator(derivsRK, indepVarSpan,  step, initialState )


state(:,1) = initialState;
indepVar(:,1) = indepVarSpan(1);

for j = 1:((indepVarSpan(end) - indepVarSpan(1))/step)

    size(RK2Step(derivsRK, indepVar(:,j), step, state(:, j)));
    [indepVar(:, j+1), state(:, j+1)] = RK2Step(derivsRK, indepVar(:,j), step, state(:, j));
    
    
    
end

indepVar = indepVar';
state = state';
end

