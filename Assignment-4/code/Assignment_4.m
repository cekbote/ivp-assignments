%% IVP Assignment 4

% Name: Chanakya Ajit Ekbote
% Institute: IIT, Bhubaneswar
% Date: 24.10.2020
% Degree: Btech
% Branch: Electronics and Communication
% Roll Number: 17EC01041

%% Creating a new environment.

clc; 
clear all;
close all;

%% Functions Created: median_filter
% <include>median_filter.m</include>

%% Functions Created: contraharmonic_filter
% <include>contraharmonic_filter.m</include>

%% Image Imports

orig_fingerprint = imread('C:\Chanakya\Projects\ivp-assignments\Assignment-3\images\fingerprint.jpg');
fingerprint = rgb2gray(orig_fingerprint);

%% Adding Noise to the image
% Noise is added to the image via the following distribution:
%
% $$P(a)$$   $$if$$   $$a$$
%
% $$P(b)$$   $$if$$   $$b$$
% 
% $$else$$   $$1-P(a)-P(b)$$

[row, col] = size(fingerprint);
noise = randi(255, row, col);
noisy_image = fingerprint;
noisy_image(noise<=15)=0;
noisy_image(noise>=240) = 255;

% Plotting the images
figure('Name', 'Adding Noise to the Image', 'units', ... 
    'normalized','outerposition', [0 0 1 1]);

subplot(1, 2, 1)
imshow(fingerprint);
title('Original Image');

subplot(1, 2, 2)
imshow(mat2gray(noisy_image));
title('Salt and Pepper added Noisy Image');

%% Using the Median Filter
% The median filtered image is obtained by the following expression:
%
% $$f(x,y) = median_{(s,t) \in S_{x,y}}(g(s,t))$$

median_filtered_image = median_filter(noisy_image, 3, 3);

figure('Name', 'Median Filtering', 'units', ... 
    'normalized','outerposition', [0 0 1 1]);

subplot(1, 2, 1)
imshow(mat2gray(noisy_image));
title('Salt and Pepper added Noisy Image');

subplot(1, 2, 2)
imshow(mat2gray(median_filtered_image));
title('Median Filtered Image');

%% Using the Contraharmonic Filter
% The contraharmonic filtered image is obtained via the following
% expression:
%
% $$f(x,y) = \frac{\sum_{(s,t) \in S_{x,y}}^{} g(s,t)^{(Q+1)}}{\sum_{(s,t) \in S_{x,y}}^{} g(s,t)^{(Q)}}$$


contraharmonic_image_pos = contraharmonic_filter(noisy_image, 3, 3, 1);
contraharmonic_image_neg = contraharmonic_filter(noisy_image, 3, 3, -1);

figure('Name', 'Contraharmonic Filtering', 'units', ... 
    'normalized','outerposition', [0 0 1 1]);

subplot(1, 3, 1)
imshow(mat2gray(noisy_image));
title('Salt and Pepper added Noisy Image');

subplot(1, 3, 2)
imshow(mat2gray(contraharmonic_image_pos));
title('Contraharmonic Filtering (Q=1)');

subplot(1, 3, 3)
imshow(mat2gray(contraharmonic_image_neg));
title('Contraharmonic Filtering (Q=-1)');

%% Conclusion
% Through this assignment, we observed how salt and pepper noise can be
% generated. We also observerved that the median filter is useful for
% elimating salt and pepper noise and the contraharmonic filter with a 
% positive Q value elminates only pepper noise and with a negative Q value,
% elimanates only salt noise.
