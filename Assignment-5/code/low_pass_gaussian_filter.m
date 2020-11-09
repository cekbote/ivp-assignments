% Function that uses a low pass radial filter to remove the blurr in the
% original image.

function [img] = low_pass_gaussian_filter(image, var)

    % image: We assume that it is a grayscale image.
    % var: Gives the variance of the 2D gaussian distribution.
    
    dft_image = fftshift(fft2(image));
    [row, col] = size(dft_image);
    mid_row = (1 + row) / 2;
    mid_col = (1 + col) / 2;
    filter = zeros(size(dft_image));
    
    % Creates the low pass gaussian filter for smoothening.
    for i = 1:row
        for j = 1:col
            filter(i, j) = exp(-((mid_row - i)^2 + (mid_col-j)^2) / (2 * var^2));
        end
    end
    
    % ifftshift shifts the fft2d back and then perform the idft. 
    img = mat2gray(real(ifft2(ifftshift(filter .* dft_image))));