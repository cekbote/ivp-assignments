% Function that returns the laplacian of a gaussian blur for a given
% filter_dim.

function [log] = log_filter(filter_dim, sigma)
    log = double(zeros(filter_dim, filter_dim));
    n = double(ceil(filter_dim/2));
    for i=1:filter_dim
        for j=1:filter_dim
            x = double(i-n);
            y = double(j-n);
            % The negative sign is added so that we get a mexican hat. Else
            % what happens is that at the center (0,0) the sign inverts and
            % we get a minimum at the center and a maximum everywhere else.
            % wont matter that much as we are only worried about zero
            % crossing but just putting it out there. 
            log(i,j) = -double((x^2+y^2-sigma^2)*...
                exp(-(x^2 + y^2)/(2*sigma^2))/sigma^4);
            
        end
    end
    
    
    