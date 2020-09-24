% Function that convolves an image with a filter. The assumption is that
% the filter is a square and has odd dimensions. If it is required that the 
% image does not loose its dimentsions due to the convolution process it is 
% required that the image should be padded.

function [img] = correlation(image, filter)
[f_row, f_col] = size(filter);
[i_row, i_col] = size(image);
image = double(image);
img=double(zeros(i_row-f_row+1, i_col-f_col+1));
for i=1:(i_row-f_row+1)
    for j=1:(i_col-f_col+1)
        img(i,j) = sum(sum(image(i:i+f_row-1,j:j+f_col-1).*filter));
    end
end