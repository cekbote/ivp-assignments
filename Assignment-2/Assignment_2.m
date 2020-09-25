clc;
clear all;
close all;
cameraman = imread('C:\Chanakya\Projects\ivp-assignments\Assignment-1\images\cameraman.tif');
% image = add_padding(cameraman, 5, 0);
% filter = log_filter(3, 1);
% filter = filter -mean(mean(filter));
% x = correlation(image, filter);
% x = zero_crossing_enhanced_image(x, 10);
% image = add_padding(cameraman, 5, 0);
% imshow(uint8(x));
% image = add_padding(cameraman, 3, 0);
% g_x = grad_filter('x');
% g_y = grad_filter('y');
% grad_x = correlation(image, g_x);
% grad_y = correlation(image, g_y);
% x = non_maxima_supression_with_thresh(cameraman, grad_x, grad_y, 0);
% imshow(x);
dft2d = dft_2d(cameraman);
mag = abs(dft2d);
x = atan2(imag(dft2d), real(dft2d));
x = exp(1i*x);
imshow((im2uint8(mat2gray(real(inv_dft2d(x))))));

% min_ = min(min(x));
% max_ = max(max(x));
% x = (x-min_)*255/(max_-min_);
% imshow(uint8(x));


