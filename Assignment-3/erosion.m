% Function that performs the morphological operation erosion and returns 
% the processed image.

function [img] = erosion(image, struct_elem)
    % image: Contains the binary image
    % struct_elem: Contains the structuring element upon which the
    % morphological operation is being done. The assumption is that the
    % struct_elem is odd. 
    
    % The logic is that if we take the structuring element and multiply it
    % with the same window of the original image (element wise) and if the
    % sum of that is equal to the sum of all the values in the structuring
    % element then it meand A intersection B is true for the entire region.
    % Else it is false
    
    img = zeros(size(image));
    [row_img, col_img] = size(image);
    [row_struct_elem, col_struct_elem] = size(struct_elem);
    
    mid_row = uint8((row_struct_elem + 1) / 2);
    mid_col = uint8((col_struct_elem + 1) / 2);
    sum_struct_elem = sum(sum(struct_elem));
    
    for i = 1:(row_img - row_struct_elem + 1)
        for j = 1:(col_img - col_struct_elem + 1)
            sum_ = image(i:i+row_struct_elem-1, j:j+col_struct_elem-1) ... 
                .* struct_elem;
            sum_ = sum(sum(sum_));
            if (sum_==sum_struct_elem)
                img(i+mid_row-1, j+mid_col-1) = 1;
            end
        end
    end
    