function [newstate,newIndepVar] = RK2Step(state,indepVar,step,derivsRK,param)

    %Calculate xstar
    xstar = state + ((1/2)*step).*feval(derivsRK, indepVar, state, param);
    %Update the state using 2nd order Runge Kutta
    newstate = state + step.*feval(derivsRK,indepVar + (1/2)*step, xstar , param);

    %Return our independent variable along with the state
    newIndepVar = indepVar + step;
    
    
   
end

