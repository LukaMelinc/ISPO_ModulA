function [u, t] = APRBS(N, amplitude, T, Th, padding)

    u = idinput(N,'prbs',[0 1 / (Th / T)],[-1 1]);
    d = diff(u);    % vrača razlike med zaporednimi vrednostmi arraya
    idx = find(d) + 1;  % diff vrne indekse neničelnih elementov arraya
    idx = [1;idx];
    for ii = 1:length(idx) - 1
         u(idx(ii):idx(ii+1)-1) = amplitude*rand;
    end
    u(idx(end):end) = amplitude*rand;
    u = [zeros(padding, 1); u];
    t = (0:padding+N-1)*T;
end