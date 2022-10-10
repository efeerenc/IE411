function [x_opt, val_opt, iter] = gm_exact(A, x_init, epsilon)

    % f = xT A x, grad = 2 Ax

    x = x_init;
    grad = 2*A*x;
    iter = 0;

    while (norm(grad) > epsilon)
        iter = iter + 1;
        d = -grad/norm(grad); % compute optimal direction
        t = -(d.'*grad)/(2*d.'*A*d); % compute optimal stepsize
        x = x + t*d; % update solution

        grad = 2*A*x; % new gradient
        f = x.'*A*x; % new value
        fprintf("Iteration: %3d, Value: %2.6f, Gradient Norm: %2.6f \n", iter, f, norm(grad));
    end

    x_opt = x;
    val_opt = f;

end