%% IVP Assignment 5

% Name: Chanakya Ajit Ekbote
% Institute: Indian Institute of Technology Bhubaneswar
% Date: 09.11.2020
% Degree: B.Tech
% Branch: Electronics and Communication
% Roll Number: 17EC01041

%% Creating a new environment.

clc; 
clear all;
close all;

%% Functions Created: motion_blur
% <include>motion_blur.m</include>

%% Functions Created: inv_motion_blur
% <include>inv_motion_blur.m</include>

%% Functions Created: low_pass_gaussian_filter
% <include>low_pass_gaussian_filter.m</include>

%% Functions Created: weiner_filter
% <include>weiner_filter.m</include>

%% Image Imports

lena = imread('C:\Chanakya\Projects\ivp-assignments\Assignment-5\images\lena_gray_256.tif');
bruce_springsteen = rgb2gray(imread('C:\Chanakya\Projects\ivp-assignments\Assignment-5\images\bruce_springsteen.jpg'));

%% Image Resoration
% There are three principal ways for estimating the degradation function: 
% 1. observation, 2. experimentation, and 3. mathematical modeling.
%
% In this experiement we try to restore a motion blurred image via
% mathematically modelling the motion blur. 
%
% The mathematical model of the motion blur can be observed as follows:
% 
% $$ g(x,y) = \int_{0}^{T} [x - x_0(t), y - y_0(t)]dt $$
% 
% Note that we assume that the image has undergone a movement $x_0(t)$ and 
% $y_0(t)$ in the $x$ and $y$ direction respectively. Moroever we also
% assume that the motion was captured within $T$ which is the duration of
% exposure of the sensor of the camera.
%
% In the frequency domain, it can be expressed as: 
%
% $$ G(u,v) = F(u,v) * H(u,v) $$
% 
% $$ H(u,v) = \frac{T}{\pi(ua + vb)}*sin(\pi(ua + vb)) * e^{-i\pi(ua +
% vb)} $$
%
% Where: $x_0(t) = at/T$ and $y_0(t) = bt/T$
%
% Note that $F(u,v)$ is the FFT of the original image, $H(u,v)$ is the
% degradation function and $ G(u,v) $ is the FFT of the degraded function
% and $a$ and $b$ are the rates of motion in the respective directions.
%
% Once we know the model, we can theortically get back the image by using
% an inverse process, that is: 
%
% $$ F(u,v) = G(u,v) / H(u,v) $$
%
% Since its a motion blur, we can try using a low pass radial filter to
% reduce the high frequency components and get back the image.
%
% Another method of restoring the image is by using the Weiner Method where
% we try to reduce the expected l2 norm between the original image and the
% estimated original image. The final formula obtained in the frequency
% domain is:
%
% $$ F(u,v) = \frac{|H(u,v)|^2}{|H(u,v)|^2 + K}*\frac{G(u,v)}{H(u,v)} $$


%% Image Restoration after Synethetically Degrading the Image via a Motion Blur Model

% Calling the motion_blur function (Degrading the image)
motion_blured_lena = motion_blur(lena, 0.1, 0.1, 2);

% Calling the inv_motion_blur function
inverse_filtered_lena = inv_motion_blur(motion_blured_lena, 0.1, 0.1, 2);

% Calling the low_pass_gaussian_filter function
radially_filtered_lena = low_pass_gaussian_filter(motion_blured_lena, 50);

% Calling the weiner_filter function
weiner_filtered_lena = weiner_filter(motion_blured_lena, 0.1, 0.1, 2, 0.005);

% Plotting the images

figure('Name', 'Synthetic Image Restoration', 'units', ... 
    'normalized','outerposition', [0 0 1 1]);

subplot(2, 2, 1)
imshow(motion_blured_lena);
title('Motion Blurred Image');

subplot(2, 2, 2)
imshow(inverse_filtered_lena);
title('Inverse Filtered Image');

subplot(2, 2, 3)
imshow(radially_filtered_lena);
title('Low Pass Filtered Image');

subplot(2, 2, 4)
imshow(weiner_filtered_lena);
title('Weiner Filtered Image');

%% Image Restoration after taking a real Motion Blurred Image 

% Calling the inv_motion_blur function
inverse_filtered_bruce = inv_motion_blur(bruce_springsteen, 0.1, 0.1, 2);

% Calling the low_pass_gaussian_filter function
radially_filtered_bruce = low_pass_gaussian_filter(bruce_springsteen, 50);

% Calling the weiner_filter function
weiner_filtered_bruce = weiner_filter(bruce_springsteen, 0.1, 0.1, 2, 0.005);

% Plotting the images

figure('Name', 'Synthetic Image Restoration', 'units', ... 
    'normalized','outerposition', [0 0 1 1]);

subplot(2, 2, 1)
imshow(bruce_springsteen);
title('Motion Blurred Image');

subplot(2, 2, 2)
imshow(inverse_filtered_bruce);
title('Inverse Filtered Image');

subplot(2, 2, 3)
imshow(radially_filtered_bruce);
title('Low Pass Filtered Image');

subplot(2, 2, 4)
imshow(weiner_filtered_bruce);
title('Weiner Filtered Image');

%% Conclusion
% From this experiment we can see that if we can mathematically estimate
% the degradation function we can get back the original image. However, one
% major caveat is that the model that has been developed has to be good
% enough. Else the inverse filtering process does not work very well. In 
% addition to that we also observe that even if the degradation function
% has been modelled well, there is no guarentee that the inverse
% filteration process works well. For an inverse filteration process to
% work well, the relationship between the degraded function and its inverse
% has to be bijective which is not usually the case. We also observe that
% using a low pass filter does not work very well. The Weiner Filter works
% well but a major problem is estimating the rates of motion a, b the
% exposure time T as well as the Wiener Constant k. If the constants are not
% chosen properly, then the image is not restored well.