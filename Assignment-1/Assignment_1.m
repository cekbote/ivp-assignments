%% IVP Assignment 1




%% Creating a new environment.

clc; 
clear all;
close all;

%% Functions Created for the Assignment

% <include>log_transform.m</include>

%% Image Imports

cameraman = imread('C:\Chanakya\Projects\ivp-assignments\Assignment-1\images\cameraman.tif');
lena_color = imread('C:\Chanakya\Projects\ivp-assignments\Assignment-1\images\lena_color_256.tif');

%% Question 1: Seperate an RGB image into its constituent colours and then convert the RGB to HSI format.

% Decomposing the image to its constituent colors.
red = lena_color(:,:,1);
green = lena_color(:,:,2);
blue = lena_color(:,:,3);

% Plotting the image and its constituent RGB Colors.
figure('Name', 'Decomposing an RBG Image to its Constituent Colours');
subplot(2,2,1);
imshow(lena_color);
title('Original Image');

subplot(2,2,2);
imshow(red);
title('Red Channel');

subplot(2,2,3);
imshow(blue);
title('Blue Channel');

subplot(2,2,4);
imshow(green);
title('Green Channel');

% Calling the rgb_to_hsi function.
[hue, sat, int] = rgb_to_hsi(double(red), double(green), double(blue), double(lena_color));

% Comparing the hue, saturation and intensity to the original image.
figure('Name', 'Decomposing an RBG Image to HSI');
subplot(2,3,1);
imshow(lena_color);
title('Original Image');

subplot(2,3,2);
imshow(uint8(hue));
title('Hue Channel');

subplot(2,3,3);
imshow(uint8(100 * sat));
title('Saturation Channel');

subplot(2,3,4);
imshow(uint8(int));
title('Intensity Channel');

subplot(2,3,4);
imshow(uint8(int));
title('Intensity Channel');

% Computing the RBG image assuming HSI channels.
his_image(:,:,1) = hue; his_image(:,:,2) = sat; his_image(:,:,3) = int;
subplot(2,3,5);
imshow(uint8(his_image));
title('Image using HSI as RBG');

%% Question 2: Obtaining the negative of the image.

image = cameraman;
% Calling the image_negative function.
negative = image_negative(image);

% Comparing the image and the image negative.
figure('Name', 'Transforming an image to its negative.');
subplot(1,2,1);
imshow(image);
title('Original Image');

subplot(1,2,2);
imshow(negative);
title('Negative of the Image');

%% Question 3: Computing the 2D-DFT of the image and then its log transform

% Calling the dft_2d function.
dft2d = dft_2d(cameraman);

% Comparing the iamge, the 2D-DFT and the log transform of the 2D DFT.
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

% The DFT can be easily visualized after the log transform.

%% Question 4: Computing the gamma transform of images.

% Calling the gamma_transform function.
image_1 = gamma_transform(cameraman, 1, 0.9);
image_2 = gamma_transform(cameraman, 1, 1.1);

% Comparing the iamge, the 2D-DFT and the log transform of the 2D DFT.
figure('Name', 'Computing the 2D-DFT of the image.');
subplot(1,3,1);
imshow(cameraman);
title('Original Image');

subplot(1,3,2);
imshow(uint8(image_1));
title('Gamma = 0.9');

subplot(1,3,3)
imshow(uint8(image_2));
title('Gamma = 1.1');

%% Question 5: Using Histogram Equalization on the image.

% Calling the hist_2d function to get the histogram before equalization.
hist_before = pixel_hist_2d(cameraman);

% Calling the histogram_equalization function to get the histogram
% equalised image.
histeq_image = histogram_equalization(cameraman);

% Calling the hist_2d function to get the histogram after equalization.
hist_after = pixel_hist_2d(histeq_image);

figure;
plot(1:1:256, p);



p = pixel_hist_2d(uint8(negative));
figure;
plot(1:1:256, p);
