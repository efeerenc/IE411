%% Initialize
A = hilb(5);
x = [1;2;3;4;5];
epsilon = 1e-4;

%% Part a
[x_opt1, val_opt1, iter1] = gm_backtrack(A, x, 1, 0.5, 0.5, epsilon);

%% Part b
[x_opt2, val_opt2, iter2] = gm_backtrack(A, x, 1, 0.1, 0.5, epsilon);

%% Part c
[x_opt3, val_opt3, iter3] = gm_exact(A, x, epsilon);