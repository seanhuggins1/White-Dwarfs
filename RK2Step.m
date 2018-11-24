function [newIndepVar, newState] = RK2Step(derivsRK, indepVar, step, state)

    %Calculate xstar
    xstar = state + ((1/2)*step).*feval(derivsRK, indepVar, state);
    %Update the state using 2nd order Runge Kutta
    newState = state + step.*feval(derivsRK,indepVar + (1/2)*step, xstar);

    
    %Return our independent variable along with the state
    newIndepVar = indepVar + step;
    
   
    
   
end

