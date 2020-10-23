% Function that returns the inverse of the 2D DFT

function [inv_fft] = inv_dft2d(image)
    image = double(image);
    [M, N] = size(image);

    % m, n should go from -pi to pi for better interpretation.
    m = -(M-1)/2:1:(M-1)/2;
    n = -(N-1)/2:1:(N-1)/2;

    % Creates the X exponentials required to compute the DFT. 
    exponential_x = m' * m;
    exponential_x = exp(-2 * pi * 1i / M .* exponential_x);
    
    % Creates the Y exponentials required to compute the DFT.
    exponential_y = n' * n;
    exponential_y = exp(-2 * pi * 1i / N .* exponential_y);

    % Final FFT Computation. 
    inv_fft = inv(exponential_x) * image * inv(exponential_y);