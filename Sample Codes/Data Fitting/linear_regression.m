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
n = 200;
x_min = -4;
x_max = 6;
m = 9;
c = 43;  
noise_weight = 3;

%% Generate data points

x_axis = linspace(x_min, x_max, n);
dpts = m*x_axis + c + noise_weight*randn(1, n);

figure;
plot(x_axis, dpts, "*");
title("Linear regression to a given data");
xlabel("$x$");
ylabel("$y$");
hold on;

%% Fit to a line

X = [transpose(x_axis), ones(n, 1)];
y = transpose(dpts);

r = (transpose(X)*X)\transpose(X)*y; % first term is the pseudoinverse
a = r(1);
b = r(2);

fit = a*x_axis + b;
plot(x_axis, fit);
legend(["Data", "Fit"]);