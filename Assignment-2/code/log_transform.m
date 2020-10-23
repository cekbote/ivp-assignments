% Function that computes the log transform for an image.

function [log_trans] = log_transform(image, c)
    log_trans = double(image);
    [~, dim] = size(size(image));
    
    % If conditional is used to check whether the image is 2D or 3D.
    if dim == 2
        [row, col] = size(image);
        for i = 1:row
            for j = 1:col
                log_trans(i, j) = c * log( 1+ (log_trans(i, j)));
            end
        end
    else
        [row, col, channels] = size(image);
        for i = 1:row
            for j = 1:col
                for k = 1: channels
                    log_trans(i, j, k) = c * log(1 + (log_trans(i, j, k)));
                end
            end
        end
    end