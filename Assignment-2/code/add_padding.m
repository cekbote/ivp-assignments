% Function that pads a specific value to the image. The value us user
% entered. The filter_dim is assumed to be odd and the filter is assumed to
% be a square filter.

function [img] = add_padding(image, filter_dim, value)
    img = image;
    [~, cols] = size(image);
    n = uint8(floor(filter_dim/2));
    % Horizontal padding is to be added on the top and bottom of the image
    horizontal_padding = zeros(n, cols) + value;
    img = [horizontal_padding; img; horizontal_padding];
    [row, ~] = size(img);
    % Vertical padding is to be added on the left and the right. The 2*n
    % additional rows is for the horizontal padding added on the top and
    % bottom.
    vertical_padding = zeros(row, n) + value;
    img = [vertical_padding img vertical_padding];