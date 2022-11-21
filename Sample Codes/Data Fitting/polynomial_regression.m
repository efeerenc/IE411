%% Initialize
clear;
close all;

%% RNG
randn("seed", 100);

%% Interpreter
set(groot,'defaulttextinterpreter','latex');  
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex');

%% Parameters
order = 5;
fitting_order = 5;
n = 500;
x_min = 0;
x_max = 10; 
noise_weight = 5;

%% Generate data points

x_axis = linspace(x_min, x_max, n);
coeff = randn(1, order+1);

dpts = polyval(coeff, x_axis)/100 + noise_weight*randn(1, n);
data = [2, 3; 4.5, 7; 8, 1];

figure;
%plot(x_axis, dpts, "*");
plot(data(:, 1), data(:, 2), "*")
title("Polynomial regression to a given data");
xlabel("$x$");
ylabel("$y$");
hold on;

%% Fit to a line

%X = zeros(n, fitting_order+1);

for i = 1:(fitting_order+1)
    %X(:, i) = transpose(x_axis).^(fitting_order+1-i);
    X(:, i) = transpose(data(:, 1)).^(fitting_order+1-i);
end

%y = transpose(dpts);
y = data(:, 2);

p = (transpose(X)*X)\transpose(X)*y; % first term is the pseudoinverse

fit = polyval(p, x_axis);
plot(x_axis, fit);
legend(["Data: "+num2str(order), "Fit: "+num2str(fitting_order)]);