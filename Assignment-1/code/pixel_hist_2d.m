% Function that computes the frequency of pixels of a particular 
% intensity in an image.

function [pixel_hist_] = pixel_hist_2d(image)
    pixel_hist_ = zeros(1, 256);
    [row, col] = size(image);
    for i = 1:row
        for j = 1:col
            % Statement that adds one value to each array position where
            % the pixel intensities lie.
            pixel_hist_(image(i, j)+1) = pixel_hist_(image(i, j)+1) + 1;
        end
    end