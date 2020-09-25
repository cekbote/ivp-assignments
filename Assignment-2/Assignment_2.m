%% IVP Assignment 2

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

%% Functions Created for the Assignment: add_padding
% <include>add_padding.m</include>

%% Functions Created for the Assignment: log_filter
% <include>log_filter.m</include>

%% Functions Created for the Assignment: correlation
% <include>correlation.m</include>

%% Functions Created for the Assignment: zero_crossing_enhanced_image
% <include>zero_crossing_enhanced_image.m</include>

%% Functions Created for the Assignment: gaussian_blur
% <include>gaussian_blur.m</include>

%% Functions Created for the Assignment: non_maxima_supression_with_thresh
% <include>non_maxima_supression_with_thresh.m</include>

%% Functions Created for the Assignment: grad_filter
% <include>grad_filter.m</include>

%% Functions Created for the Assignment: inv_dft2d
% <include>inv_dft2d.m</include>

%% Functions Created for the Assignment: log_transform
% <include>log_transform.m</include>

%% Functions Created for the Assignment: dft_2d
% <include>dft_2d.m</include>

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
figure('Name', 'Maar-Hilderith Edge Detection 1');
subplot(1,2,1);
imshow(cameraman);
title('Original Image');

subplot(1,2,2);
imshow(correlated_image);
title('Image Correlated with LOG Filter');

figure('Name', 'Maar-Hilderith Edge Detection 2');
subplot(1,2,1);
imshow(mh_final_image_0);
title('MH Filtered (Threshold=0)');

subplot(1,2,2);
imshow(mh_final_image_3);
title('MH Filtered (Threshold=3)');

figure('Name', 'Maar-Hilderith Edge Detection 3');
subplot(1,2,1);
imshow(mh_final_image_6);
title('MH Filtered (Threshold=6)');

subplot(1,2,2);
imshow(mh_final_image_9);
title('MH Filtered (Threshold=9)');

%% Question 2: Use the Canny Edge Detection Technique to obtain the edges of the image.

% Padding the image so that the correlation does not reduce the dimensions.
ce_image = add_padding(cameraman, 5, 0);

% Getting the Gaussian Blur Kernel
gaus_blur = gaussian_blur(5, 1);

% Correlation of the blur and the padded image.
gaussing_blurred_image = correlation(ce_image, gaus_blur);

% Getting the gradient filters 
g_x = grad_filter('x');
g_y = grad_filter('y');

% Padding the image so that the correlation does not reduce the dimensions.
gaussing_blurred_image_padded = add_padding(gaussing_blurred_image, 3, 0);

% Getting the gradients of the gaussian blurred image.
grad_x = correlation(gaussing_blurred_image_padded , g_x);
grad_y = correlation(gaussing_blurred_image_padded , g_y);

% Performing Non Maxima Supression.
nms_1 = non_maxima_supression_with_thresh(gaussing_blurred_image, grad_x, grad_y, 0);
nms_2 = non_maxima_supression_with_thresh(gaussing_blurred_image, grad_x, grad_y, 2);

%Plotting the images.
figure('Name', 'Canny Edge Detection 1');
subplot(1,2,1);
imshow(gaussing_blurred_image);
title('Image Corr with the Gaussian Blur');

subplot(1,2,2);
imshow(grad_x);
title('Grad of the Gauss Blur in X');

figure('Name', 'Canny Edge Detection 2');
subplot(1,2,1);
imshow(grad_y);
title('Grad of the Gauss Blur in Y');

subplot(1,2,2);
imshow(nms_1);
title('Nonmax Supress (Thresh=0.1)');

figure('Name', 'Canny Edge Detection 3');
subplot(1,2,1);
imshow(abs(nms_2));
title('Nonmax Supress (Thresh=2)');

subplot(1,2,2);
imshow(abs(nms_2-nms_1));
title('Diff of the Nonmax Suppressions');

%% Question 3: Phase only reconstruction of the image from the Fourier Domain.

% Computing the DFT of the image.

% Computing the DFT.
dft2d = dft_2d(cameraman);

% Getting the magnitude and phase.
mag = abs(dft2d);
phase = atan2(imag(dft2d), real(dft2d));
phase_response = exp(1i*phase);

figure('Name', '2D DFT Reconstruction Phase Response');
subplot(1,2,1);
imshow(cameraman);
title('Original Image');

subplot(1,2,2);
imshow((im2uint8(mat2gray(real(inv_dft2d(phase_response)))))*3);
title('Phase Response');

%% Question 4: Phase only reconstruction of the image from the Fourier Domain.

% Comparing the image, the 2D-DFT and the log transform of the 2D DFT.
figure('Name', 'Computing the 2D-DFT of the image.');
subplot(1,3,1);
imshow(cameraman);
title('Original Image');

subplot(1,3,2);
imshow(uint8(abs(dft2d)));
title('2D DFT');

subplot(1,3,3)
imshow(uint8(log_transform(abs(dft2d), 10)));
title('2D DFT with Log Transform');