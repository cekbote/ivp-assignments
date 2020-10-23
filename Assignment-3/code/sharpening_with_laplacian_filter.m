% Function that sharpens the image using Laplacian via the Frequency Domain

function [img] = sharpening_with_laplacian_filter(image)
    % image: We assume that it is a grayscale image. 
    
    dft_image = fftshift(fft2(image));
    [row, col] = size(dft_image);
    mid_row = (1 + row) / 2;
    mid_col = (1 + col) / 2;
    filter = zeros(size(dft_image));
    
    % Creates the laplacian filter for image sharpening.
    for i = 1:row
        for j = 1:col
            filter(i, j)  = 1 + 4*pi^2*((mid_row - i)^2 + (mid_col-j)^2);
        end
    end
    
    % ifftshift shifts the fft2d back and then perform the idft. 
    img = real(ifft2(ifftshift(filter .* double(dft_image))));
    
      