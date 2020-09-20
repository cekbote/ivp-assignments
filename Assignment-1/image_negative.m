% Function that computes the negative of an image.

function [negative] = image_negative(image)
    negative = image;
    [~, dim] = size(size(image));
   
    % If conditional is used to check whether the image is 2D or 3D. 
    if dim == 2
        [row, col] = size(image);
        for i = 1:row
            for j = 1:col
                negative(i, j) = 255 - negative(i, j);
            end
        end
    else
        [row, col, channels] = size(image);
        for i = 1:row
            for j = 1:col
                for k = 1: channels
                    negative(i, j, k) = 255 - negative(i, j, k);
                end
            end
        end
    end
        
          
                
    