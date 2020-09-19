function [dft2d] = dft_2d(image)
image = double(image);
dft2d = image;
[~, dim] = size(size(image));
 if dim == 2
     [row, col] = size(image);
     for x = 1:row
         for y = 1: col
             for m = 1:row
                 y_fft = 0;
                 for n = 1:col
                     y_fft = y_fft + image(m, n) * exp(-2*pi*1i*(y-1)*(n-1)/col);
                 end
                 dft2d(x, y) = y_fft * exp(-2*pi*1i*(x-1)*(m-1)/row);
             end
        end
     end
 end