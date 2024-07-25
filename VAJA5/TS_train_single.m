function [C, O , W, b, e] = TS_train_single(C, O, W, b, X, Y, alpha)
%TS_TRAIN training function for the TS model
%  C: matrix of centers RxN
%  O: matrix of standard deviations RxN
%  W: matrix of weights 
%  b: matrix of biases
%  X: train input matrix - column vector
%  Y: train output matrix - scalar
%  alpha: learning rate - scalar

mu = exp(-0.5 * sum((X(3:4)' - C).^2 ./ (O.^2) , 2)); % mu - column vector

if(sum(mu) <0.001)
    %fprintf("%f\n", sum(mu));
end

%mu = mu  / sum(mu);




dmu_dC = (X(3:4)' - C) ./ (O.^2) .* mu;
dmu_dO = (X(3:4)' - C).^2 ./ (O.^3) .* mu;

s = W * X + b;
y = sum(mu / sum(mu) .* s);
dy_dC = dmu_dC .* (s - sum(s .* mu)) ./ (sum(mu).^2); % if anything is wrong, this is probably the culprit
dy_dO = dmu_dO .* (s - sum(s .* mu)) ./ (sum(mu).^2); % if anything is wrong, this is probably the culprit

dy_db = mu;
dy_dW = mu * X';

e = (Y - y).^2;
de_dC = -2 * (Y - y) * dy_dC;
de_dO = -2 * (Y - y) * dy_dO;

de_db = -2 * (Y - y) * dy_db;
de_dW = -2 * (Y - y) * dy_dW;


C = C - alpha .* de_dC;
O = O - alpha .* de_dO;

b = b - alpha .* de_db;
W = W - alpha .* de_dW;

end

