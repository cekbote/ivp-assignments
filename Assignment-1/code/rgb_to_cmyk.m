% Function that converts RBG to CMYK

function [img] = rgb_to_cmyk(image)
    img = image;
    img(:,:,1) = (1 - img(:,:,1) ./ 255) .* 255;
    img(:,:,2) = (1 - img(:,:,2) ./ 255) .* 255;
    img(:,:,3) = (1 - img(:,:,3) ./ 255) .* 255;
    