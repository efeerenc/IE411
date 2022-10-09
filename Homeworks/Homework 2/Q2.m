rand("seed", 314);
x = linspace(0, 1, 30).';
y = 2*x.^2 - 3*x + 1 + 0.05*randn(size(x));

A = zeros(size(x, 1), size(x, 2)+2);

for i = 1:3
    A(:, i) = x.^(3-i);
end

params = (A.'*A)\A.'*y;
fit = polyval(params, x);

figure;
xlabel("Data Index");
ylabel("Data Value");
plot(x, y, "*");
hold on;
plot(x, fit);
legend("Data", "Fit");