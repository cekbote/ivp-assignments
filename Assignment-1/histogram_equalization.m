function [histeqimage] = histogram_equalization(image)
    [row, col] = size(image);
    keys = [];
    histeqimage = image;
    
    hist_map = containers.Map();
    cdf_map = containers.Map();
    hist_eq_map = containers.Map();
    
    for i=1:row
        for j=1:col
            key = char(image(i, j));
            if isKey(hist_map, key)
                hist_map(key) = hist_map(key) + 1;
            else
                hist_map(key) = 1;
                keys = [keys; key]; 
            end
        end
    end
    
    keys = sort(keys);
    sum = 0;
    cdf_min = hist_map(keys(char(1)));
    
    [key_length, ~] = size(keys);
    
    for i=1:key_length
        sum = sum + hist_map(keys(i));
        cdf_map(keys(i)) = sum;
    end
    
    for i=1:key_length
        hist_eq_map(keys(i)) = round((cdf_map(keys(i))-cdf_min)*255/(row*col-cdf_min));
    end
    
    for i=1:row
        for j=1:col
            key = char(image(i, j));
            histeqimage(i,j) = hist_eq_map(key);
        end
    end
    
    
    
    
    
    
    
    
            
            
            
            
    