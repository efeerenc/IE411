function [x_opt, val_opt, iter] = gm_backtrack(A, x_init, s, alpha, beta, epsilon)

    x = x_init;
    f = x.'*A*x;
    grad = 2*A*x;
    iter=0;

    while (norm(grad)>epsilon)
        iter=iter+1;
        d = -grad;
        t=s;
            while (f - ((x + t*d).'*(A)*(x + t*d)) < -alpha*t*grad.'*d) 
                t=beta*t;
            end
        x = x + t*d; % update solution
        f = x.'*A*x; % new value
        grad = 2*A*x; % new gradient
        fprintf("Iteration: %3d, Value: %2.6f, Gradient Norm: %2.6f \n", iter, f, norm(grad));
    end

    x_opt = x;
    val_opt = f;

end