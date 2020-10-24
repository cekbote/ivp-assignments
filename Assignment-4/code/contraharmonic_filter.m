% Function that uses a contraharmonic filter to filter the image.

function [img] = contraharmonic_filter(image, filter_row, filter_col, q)
    % image: The orignal image.
    % window_row: The row size of the window.
    % window_col: The column size of the window.
    % q: Q value of the contraharmonic filter.
    % Note: the window is assumed to have odd rows and columns.

    
    [row_img, col_img] = size(image);
    img = zeros(row_img, col_img);
    
    mid_row = double(uint8((filter_row + 1) / 2));
    mid_col = double(uint8((filter_col + 1) / 2));
    
    % Loop that gets the contraharmonic value of the window.
    for i = 1:(row_img - filter_row + 1)
        for j = 1:(col_img - filter_col + 1)
            window_array = double(reshape(image(i:i+filter_row-1, j:j+filter_col-1 ...
                ), 1, []));
            num = 0;
            den = 0;
            for k = 1:(filter_row*filter_col)
                num = num + window_array(1, k)^(q+1);
                den = den + window_array(1, k)^(q);
            end
            img(i+mid_row-1, j+mid_col-1) = num / den;
        end
    end