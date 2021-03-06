% Function that performs an affine transformation on an image.

function [img] = affine_transformation(image, T)
    
    % image: Input Image.
    % T: Transformation Matrix (3x3).
    
    [row, col] = size(image);
    
    % Computing the New Image Dimensions
    % The logic is that you traverse the entire array and get the minimum
    % and maximum values that the x, y of the original image can be
    % transformed to. Then you know the range and can compute the
    % dimensions of the new image accordingly.
    
    min_x = 0;
    max_x = 0;
    min_y = 0;
    max_y = 0;
    
    for i=1:row
        for j=1:col
            offset_mat = round([i, j, 1] * T);
            min_x = min(offset_mat(1), min_x);
            max_x = max(offset_mat(1), max_x);
            min_y = min(offset_mat(2), min_y);
            max_y = max(offset_mat(2), max_y);
        end
    end  
    
    img = zeros(max_x-min_x, max_y-min_y);
    
    % Finds out if you need to add an offset if negative values are being
    % generated. If only positive values are being generated then there is
    % no need for an offset.
    shift_x = (1 + abs(min_x))*(min_x<0);
    shift_y = (1 + abs(min_y))*(min_y<0);
    
    for i=1:row
        for j=1:col
            offset_mat = round([i, j, 1] * T);
            img(offset_mat(1) + shift_x, offset_mat(2) + shift_y) = ...
                image(i, j);
        end
    end
    
    img = mat2gray(img);