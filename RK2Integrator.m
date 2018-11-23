function [newstate,newIndepVar] = RK2Integrator(state,indepVar,step,derivsRK,param)

    %Calculate xstar
    xstar = state + ((1/2)*step).*feval(derivsRK, state, indepVar, param);
    %Update the state using 2nd order Runge Kutta
    newstate = state + step.*feval(derivsRK, xstar, indepVar + (1/2)*step, param);

    %Return our independent variable along with the state
    newIndepVar = indepVar + step;
    
    
   
end

