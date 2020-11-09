% Function that tries to get back the original image using the knowledge
% that we have an idea of the degradation function.

function [img] = inv_motion_blur(image, a, b, T)
    
    % Input image.
    % a: Rate of motion in x.
    % b: Rate of motion in y.
    % T: Duration of Exposure.
    
    [row, col] = size(image);
    
    % Here the shifting the 
    u = (0:1:(col-1)) + 1e-16;
    v = (0:1:(row-1)) + 1e-16;
    
    % Creates repetative rows and columns to get the entire matrix.
    u = repelem(u, row, 1);
    v = repelem(v', 1, col);
    
    angle = u*a + v*b;
    H = (sin (angle) .* exp(-1i * pi * angle) ./ angle) * T / pi;
    
    img = mat2gray(real(ifft2(fft2(image) ./ H)));