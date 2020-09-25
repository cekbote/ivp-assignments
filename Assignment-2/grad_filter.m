% Function that returns the 3x3 grad filter for a given x or y direction.

function [grad_filt] = grad_filter(x_or_y)
    grad_filt = double(zeros(3,3));
    if (x_or_y == 'x')
        grad_filt(2,1) = 1;
        grad_filt(2,2) = -2;
        grad_filt(2,3) = 1;
    else
        grad_filt(1,2) = 1;
        grad_filt(2,2) = -2;
        grad_filt(3,2) = 1;
    end
        