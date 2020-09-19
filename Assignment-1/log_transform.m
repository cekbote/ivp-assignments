function [log_trans] = log_transform(image, c)
    log_trans = double(image);
    [~, dim] = size(size(image));
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