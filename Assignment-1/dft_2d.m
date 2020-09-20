function [dft2d] = dft_2d(image)
image = double(image);
[M, N] = size(image);

m = -(M-1)/2:1:(M-1)/2;
n = -(N-1)/2:1:(N-1)/2;

exponential_x = m' * m;
exponential_x = exp(-2 * pi * 1i / M .* exponential_x);

exponential_y = n' * n;
exponential_y = exp(-2 * pi * 1i / N .* exponential_y);

dft2d = exponential_x * image * exponential_y;