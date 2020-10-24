% Function that returns the fedian Filtered Image.

function [img] = median_filter(image, window_row, window_col)
    % image: The orignal image.
    % window_row: The row size of the window.
    % window_col: The column size of the window.
    % Note: the window is assumed to have odd rows and columns.

    [row_img, col_img] = size(image);
    img = zeros(row_img, col_img);
    
    mid_row = double(uint8((window_row + 1) / 2));
    mid_col = double(uint8((window_col + 1) / 2));
    
    % Loop that gets the median of the window.
    for i = 1:(row_img - window_row + 1)
        for j = 1:(col_img - window_col + 1)
            window_array = reshape(image(i:i+window_row-1, j:j+window_col-1 ...
                ), 1, []);
            median_val = median(window_array);
            img(i+mid_row-1, j+mid_col-1) = median_val;
        end
    end
    