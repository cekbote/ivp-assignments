% Function that returns the laplacian of a gaussian blur for a given
% filter_dim.

function [log] = log_filter(filter_dim, sigma)
    log = double(zeros(filter_dim, filter_dim));
    n = double(ceil(filter_dim/2));
    for i=1:filter_dim
        for j=1:filter_dim
            x = double(i-n);
            y = double(j-n);
            % The negative sign is added so that 
            log(i,j) = -double((x^2+y^2-sigma^2)*exp(-(x^2 + y^2)/(2*sigma^2))/sigma^4);
            
        end
    end
    
    
    