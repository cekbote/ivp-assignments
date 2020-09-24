% Function that returns the laplacian of a gaussian blur for a given
% filter_dim.

function [log] = log_filter(filter_dim, sigma)
    log = double(zeros(filter_dim, filter_dim));
    n = double(ceil(filter_dim/2));
    for i=1:filter_dim
        for j=1:filter_dim
            x = double(i-n);
            y = double(j-n);
            log(i,j) = double((x^2+y^2-sigma^2)*...
                exp(-(x^2 + y^2)/(2*sigma^2))/sigma^4);
        end
    end
    
    % The problem with this is that the sum of all the coefficients is not
    % zero. This causes an issue when we have to find the zero
    % crossings. Causing us to renormalize it in the end. Moreover, what 
    % happens is that since the total is a positive number, it basically 
    % enhances values that are similar in nature. For example, brighter 
    % spots become brighter and darker spots become brighter because of 
    % the fact that the total is positive. Instead, lets normalise this 
    % filter itself such that the total sum is 0.
    
    log = log - mean(mean(log));
    
    
    