function [C, O , W, b, e] = TS_train(C, O, W, b, X, Y, alpha, epochs)
    % X - matrix
    % Y - row vector
for i = 1:epochs
    e_avg = 0;
    for j = 1:size(X, 2)
       
        [C, O, W, b, e] = TS_train_single(C, O, W, b, X(:, j), Y(j), alpha);
        e_avg = e_avg + e;
        % fprintf("Error: %f\n", e);
    end
    e_avg = e_avg / size(X, 2);
    
    if(rem(i, 100) == 1)
        fprintf("Epoch %d: Error: %f\n", i, e_avg);
    end
end

fprintf("Final error: %f\n", e_avg);


end

