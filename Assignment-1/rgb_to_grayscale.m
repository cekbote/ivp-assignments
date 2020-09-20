% Function that Converts an RBG image to a grayscale by averaging across channels

function [img] = rgb_to_grayscale(image)
    img = (image(:,:,1) + image(:,:,2) + image(:,:,3)) ./ 3 ;