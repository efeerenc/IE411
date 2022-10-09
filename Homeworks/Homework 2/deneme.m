A = [1, 0; 0, 2];
x = [2;1];
epsilon = 1e-5;
alpha = 0.25;
beta = 0.5;
s = 2;

% [x_opt, f_opt] = gm_exact(A, x, epsilon);
% disp(x_opt);

[x_opt2, f_opt2] = gm_backtrack(A, x, alpha, beta, s, epsilon);
disp(x_opt2);