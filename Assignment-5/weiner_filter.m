% Function that implements filters an motion blurred image, using a weiner
% filter.

function [img] = weiner_filter(image, a, b, T, K)
    
    % image: Input image.
    % a: Rate of motion in x.
    % b: Rate of motion in y.
    % T: Duration of Exposure.
    % K: Constant used in the Weiner Filter.
    
    [row, col] = size(image);
    
    u = (0:1:(row-1)) + 1e-16;
    v = (0:1:(col-1)) + 1e-16;
    
    % Creates repetative rows and columns to get the entire matrix.
    u = repelem(u, row, 1);
    v = repelem(v', 1, col);
    
    angle = u*a + v*b;
    H = (sin (angle) .* exp(-1i * pi * angle) ./ angle) * T / pi;
    
    weiner_filt = abs(H).^2 ./ ((abs(H).^2 + K).*H);
    
    img = mat2gray(real(ifft2(fft2(image) .* weiner_filt)));