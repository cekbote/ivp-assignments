% Function that computes the gamma transform for an image.

function [gamma_trans] = gamma_transform(image, c, gamma)
    gamma_trans = double(image);
    [~, dim] = size(size(image));
    
    % If conditional is used to check whether the image is 2D or 3D. 
    if dim == 2
        [row, col] = size(image);
        for i = 1:row
            for j = 1:col
                gamma_trans(i, j) = c * (gamma_trans(i, j))^(gamma);
            end
        end
    else
        [row, col, channels] = size(image);
        for i = 1:row
            for j = 1:col
                for k = 1: channels
                    gamma_trans(i, j, k) = c * (gamma_trans(i, j, k))^(gamma);
                end
            end
        end
    end