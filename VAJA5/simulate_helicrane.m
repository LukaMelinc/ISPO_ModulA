function [y] = simulate_helicrane(u, x0)

    x = x0;

    N = length(u);
    y = zeros(N, 1);

    for i = 1:N
        [fi_ fip_] = helicrane(u(i),x);

        x = [fip_ fi_];

        y(i) = fi_;
    end

end