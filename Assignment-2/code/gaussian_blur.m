% Function that returns the gaussian blur, for nxn dimensions.

function [gauss_blur] = gaussian_blur(filter_dim, sigma)
    gauss_blur = double(zeros(filter_dim, filter_dim));
    n = double(ceil(filter_dim/2));
    for i=1:filter_dim
        for j=1:filter_dim
            x = double(i-n);
            y = double(j-n);
            gauss_blur(i,j) = exp(-(x^2 + y^2)/(2*sigma^2));
        end
    end
    
    % For getting a zero mean signal.
    gauss_blur = gauss_blur - mean(mean(gauss_blur));