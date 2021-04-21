
function [S,I,R] = sir(B,G,D,N,I0,T,dt)
    S = zeros(1,T);
    S(1) = N;
    I = zeros(1,T);
    I(1) = I0;
    R = zeros(1,T);
    for t = 1:T-1
        % Equations of the model
        dS = (-B*I(t)*S(t)/N + D*R(t)) * dt;
        dI = (B*I(t)*S(t)/N - G*I(t)) * dt;
        dR = (G*I(t) - D*R(t)) * dt;
        S(t+1) = S(t) + dS;
        I(t+1) = I(t) + dI;
        R(t+1) = R(t) + dR;
    end
end
