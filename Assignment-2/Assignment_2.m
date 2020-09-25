%% IVP Assignment 1

% Name: Chanakya Ajit Ekbote
% Institute: IIT, Bhubaneswar
% Date: 25.09.2020
% Degree: Btech
% Branch: Electronics and Communication
% Roll Number: 17EC01041

%% Creating a new environment.

clc; 
clear all;
close all;

%% Image Imports

cameraman = imread('C:\Chanakya\Projects\ivp-assignments\Assignment-1\images\cameraman.tif');
lena_color = imread('C:\Chanakya\Projects\ivp-assignments\Assignment-1\images\lena_color_256.tif');

%% Question 1: Use the Marr-Hilderith filter to obtain the edges of the image.

% Padding the image so that the correlation does not reduce the dimensions.
mh_image = add_padding(cameraman, 5, 0);

% Generating the LOG Filter
log_filt = log_filter(5, 1);

% Correlation of the image and the LOG filter.
correlated_image = correlation(mh_image, log_filt);

% Enhancing the zero crossings.
mh_final_image_0 = zero_crossing_enhanced_image(correlated_image, 0);
mh_final_image_3 = zero_crossing_enhanced_image(correlated_image, 3);
mh_final_image_6 = zero_crossing_enhanced_image(correlated_image, 6);
mh_final_image_9 = zero_crossing_enhanced_image(correlated_image, 9);

%Plotting the images.
figure('Name', 'Maar-Hilderith Edge Detection');
subplot(2,3,1);
imshow(cameraman);
title('Original Image');

subplot(2,3,2);
imshow(correlated_image);
title('Image Correlated with LOG Filter');

subplot(2,3,3);
imshow(mh_final_image_0);
title('MH Filtered (Threshold=0)');

subplot(2,3,4);
imshow(mh_final_image_3);
title('MH Filtered (Threshold=3)');

subplot(2,3,5);
imshow(mh_final_image_6);
title('MH Filtered (Threshold=6)');

subplot(2,3,6);
imshow(mh_final_image_9);
title('MH Filtered (Threshold=9)');

%% Question 2: Use the Canny Edge Detection Technique to obtain the edges of the image.
% image = add_padding(cameraman, 5, 0);
% imshow(uint8(x));
% image = add_padding(cameraman, 3, 0);
% g_x = grad_filter('x');
% g_y = grad_filter('y');
% grad_x = correlation(image, g_x);
% grad_y = correlation(image, g_y);
% x = non_maxima_supression_with_thresh(cameraman, grad_x, grad_y, 0);
% imshow(x);
% dft2d = dft_2d(cameraman);
% mag = abs(dft2d);
% x = atan2(imag(dft2d), real(dft2d));
% x = exp(1i*x);
% imshow((im2uint8(mat2gray(real(inv_dft2d(x))))));

% min_ = min(min(x));
% max_ = max(max(x));
% x = (x-min_)*255/(max_-min_);
% imshow(uint8(x));


