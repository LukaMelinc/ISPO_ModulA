function [Y] = TS_eval(C, O, W, b, X)

    N = size(X, 2);
    n = size(X, 1);

    Y = zeros(1, N);

    for i = 1:N
        mu = exp(-0.5 * sum((X(3:4, i)' - C).^2 ./ (O.^2) , 2));
        s = W * X(:, i) + b;
        mu = mu / sum(mu);
        y = sum(mu .* s);


        Y(:, i) = y;
    end

end
