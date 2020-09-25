% Function that returns a non_maxima_supressed image. The inputs are the
% image, the gradient of the image in x, the gradient of the image in y,
% and the threshold above which pixels would be considered.

function [img] = non_maxima_supression_with_thresh(image, grad_x, grad_y, thresh)
    image = double(image);
    mag = sqrt(grad_x.^2 + grad_y.^2);
    angle = atan2(grad_y, grad_x) * 180/pi;
    angle = angle + (angle>180)*(-180) + (angle<0)*(180);
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
        for j=1:(col)
            v = image(i:i+2,j:j+2) .* vert_filter;
            h = image(i:i+2,j:j+2) .* horz_filter;
            pos_45 = image(i:i+2,j:j+2) .* pos_45_deg_filter;
            neg_45 = image(i:i+2,j:j+2) .* neg_45_deg_filter;
            ang = angle(i, j);
            sector = 0;
            
            % Checking which bucket the angle lies in.
            if ((ang>0 && ang<22.5) || (ang>157.5 && ang<180))
                sector = 1;
            elseif (ang>22.5 && ang<67.5)
                sector = 2;
            elseif (ang>67.5 && ang<112.5)
                sector = 3;
            elseif (ang>112.5 && ang<157.5)
                sector = 4;
            end
            
            value = 0;
            
            % Assigning a value to the corresponsing pixel depending on
            % the internsity of the original image.
            switch sector
                case 1
                    if (h(2,1)>mag(i,j) && h(2,3)>mag(i,j))
                        value = mag(i,j);
                    end
                case 2 
                    if (pos_45(3,1)>mag(i,j) && pos_45(1,3)>mag(i,j))
                        value = mag(i,j);
                    end
                case 3 
                    if (v(1,2)>mag(i,j) && v(3,2)>mag(i,j))
                        value = mag(i,j);
                    end
                case 4
                    if (neg_45(1,1)>mag(i,j) && neg_45(1,1)>mag(i,j))
                        value = mag(i,j);
                    end
            end
            
            img(i,j)=value;
            
        end
    end
    
    img = img.*(img>thresh);
    