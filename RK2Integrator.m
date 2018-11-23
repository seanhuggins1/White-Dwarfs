function newstate = RK2Integrator(state,time,tau,derivsRK,param)

    %Calculate xstar
    xstar = state + ((1/2)*tau).*feval(derivsRK, state, time, param);
    %Update the state using 2nd order Runge Kutta
    newstate = state + tau.*feval(derivsRK, xstar, time + (1/2)*tau, param);
    
    
end
