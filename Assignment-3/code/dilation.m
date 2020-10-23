% Function that performs the morphological operation dilation and returns 
% the processed image.

function [img] = dilation(image, struct_elem)
    % image: Contains the binary image
    % struct_elem: Contains the structuring element upon which the
    % morphological operation is being done. The assumption is that the
    % struct_elem is odd. 
    
    % The logic is that if we take the structuring element and multiply it
    % with the same window of the original image (element wise) and if the
    % sum of that is greater than 0, then it means that A intersection B
    % lies in A. 
    
    img = zeros(size(image));
    [row_img, col_img] = size(image);
    [row_struct_elem, col_struct_elem] = size(struct_elem);
    
    mid_row = double(uint8((row_struct_elem + 1) / 2));
    mid_col = double(uint8((col_struct_elem + 1) / 2));
    
    for i = 1:(row_img - row_struct_elem + 1)
        for j = 1:(col_img - col_struct_elem + 1)
            sum_ = image(i:i+row_struct_elem-1, j:j+col_struct_elem-1) ... 
                .* struct_elem;
            sum_ = sum(sum(sum_));
            if (sum_ > 0)
                img(i+mid_row-1, j+mid_col-1) = 1;
            end
        end
    end
    
end
    