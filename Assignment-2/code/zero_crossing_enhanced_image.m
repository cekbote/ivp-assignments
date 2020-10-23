% Function that uses zero crossing to enhance the log (Laplacian of
% Gaussian) image. Whereever there is a zero crossig, thats the point where
% the edge is present. A threshold is added so that we can control what
% edges we want to preserve and what edges we don't. Zeros crossing can be
% found out taking a 3x3 square and then checking the opposite pixels.

function [img] = zero_crossing_enhanced_image(image, thresh)
    [row, col] = size(image);
    image = add_padding(image, 3, 0);
    % Vertical filter is used to the center top and bottom pixels.
    vert_filter = zeros(3,3);
    vert_filter(1,2) = 1;
    vert_filter(3,2) = 1;
    % Horizontal filter is used to the horizontal middle pixels.
    horz_filter = zeros(3,3);
    horz_filter(2,1) = 1;
    horz_filter(2,3) = 1;
    % Positive 45 degree filter is used to the pixels on the positive 
    % diagonal barring the center.
    pos_45_deg_filter = zeros(3,3);
    pos_45_deg_filter(3,1) = 1;
    pos_45_deg_filter(1,3) = 1;
    % Negative 45 degree filter is used to the pixels on the negative 
    % diagonal barring the center.
    neg_45_deg_filter = zeros(3,3);
    neg_45_deg_filter(1,1) = 1;
    neg_45_deg_filter(3,3) = 1;
    img = double(zeros(row, col));
    for i=1:(row)
        for j=1:(row)
            v = image(i:i+2,j:j+2) .* vert_filter;
            h = image(i:i+2,j:j+2) .* horz_filter;
            pos_45 = image(i:i+2,j:j+2) .* pos_45_deg_filter;
            neg_45 = image(i:i+2,j:j+2) .* neg_45_deg_filter;
            check = 0;
            if (v(1,2)*v(3,2)<-1 && abs(v(1,2)-v(3,2))>thresh)
                check = 1;
            elseif (h(2,1)*h(2,3)<-1 && abs(h(2,1)-v(2,3))>thresh)
                check = 1;
            elseif (pos_45(3,1)*pos_45(1,3)<-1 && abs(pos_45(3,1)-pos_45(1,3))>thresh)
                check = 1;
            elseif (neg_45(1,1)*neg_45(3,3)<-1 && abs(neg_45(3,1)-neg_45(1,3))>thresh)
                check = 1;
            end
            
            if (check == 1)
                img(i,j) = 255;
            else
                img(i,j) = 0;
            end
        end
    end  