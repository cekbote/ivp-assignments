% Function that smoothes the image using a low pass gaussian filter

function [img] = low_pass_gaussian_filter_smoothening(image, var)
    % image: We assume that it is a grayscale image.
    % var: Gives the variance of the 2D gaussian distribution.
    
    image = fftshift(fft2(image));
    [row, col] = size(dft_image);
    mid_row = (1 + row) / 2;
    mid_col = (1 + col) / 2;
    filter = zeros(size(dft_image));
    
    % Creates the low pass gaussian filter for smoothening.
    for i = 1:row
        for j = 1:col
            filter  = exp(-((mid_row - i)^2 + (mid_col-j)^2) / (2 * var^2));
        end
    end
    
    % ifftshift shifts the fft2d back and then perform the idft. 
    img = ifft2(ifftshift(filter .* image));
    
      