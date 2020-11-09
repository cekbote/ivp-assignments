%% IVP Assignment 6

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

%% Functions Created: affine_transformation
% <include>affine_transformation.m</include>

%% Image Imports

lena = imread('C:\Chanakya\Projects\ivp-assignments\Assignment-6\images\lena_gray_256.tif');

%% Affine Transformations
% An affine transformation is a linear transformation of the image where
% the image can be rotated, translated, sheared, enlarged and shrunk. All
% of these operations can be done via matrix multiplications. The general
% expression is as follows: 
% 
% $$ (x,y) = Trans(u,v) $$
%
% In the equation above, Trans is an affine transformation, u and v are the
% pixel positions of the original image and x and y are the pixel positions
% of the new image.
%
% The general expression for affine transformations using matrices is as
% follows:
%
% $$ \pmatrix{x & y & 1} = \pmatrix{w & z & 1} * T $$
%
% Note that this T can be changed depending on desire of the user. If the
% user would like to enlarge or shrink the image, the following
% transformation matrix can be used:
%
% $$ T = \pmatrix{a & 0 & 0 \cr 0 & b & 0 \cr 0 & 0 & 1} $$
%
% Note that if the constants $a$, $b$ are above 1, we are expanding the 
% image, and if they are less than 1 we are shrinking the image.
%
% To rotate the image, the following Transformation Matrix can be used:
%
% $$ T = \pmatrix{cos(\theta) & sin(\theta) & 0 \cr -sin(\theta)& cos(\theta) 
% & 0 \cr 0 & 0 & 1} $$

%% Scaling an image

% Transformation Matrix
T = [1.5, 0, 0;
       0, 2, 0;
       0, 0, 1];
 
% Calling the affine_transformation function
scaled_image = affine_transformation(lena, T);

% Plotting the affine transformation results
figure('Name', 'Image Scaling', 'units', 'normalized', ... 
    'outerposition', [0 0 1 1]);

subplot(1, 2, 1)
imshow(lena);
title('Orginal Image');

subplot(1, 2, 2)
imshow(scaled_image);
title('Scaled Image');

%% Rotating the Image

% Transformation Matrix
theta = 100;
R = [ cosd(theta), sind(theta), 0;
     -sind(theta), cosd(theta), 0;
                 0,          0, 1];
 
% Calling the affine_transformation function
rotated_image = affine_transformation(lena, R);

% Plotting the affine transformation results
figure('Name', 'Rotated Image', 'units', 'normalized', ... 
    'outerposition', [0 0 1 1]);

subplot(1, 2, 1)
imshow(lena);
title('Orginal Image');

subplot(1, 2, 2)
imshow(rotated_image);
title('Rotated Image');

%% Rotating and Scaling an Image

% Calling the affine_transformation function
scaled_and_rotated_image = affine_transformation(scaled_image, R);

% Plotting the affine transformation results
figure('Name', 'Scaling and Rotating', 'units', 'normalized', ... 
    'outerposition', [0 0 1 1]);

subplot(1, 2, 1)
imshow(lena);
title('Orginal Image');

subplot(1, 2, 2)
imshow(scaled_and_rotated_image);
title('Scaled and Rotated Image');

%% Conclusion
% Through this experiment, we can see that via affine transformations we
% can rotate, translate, shrink, enlarge and shear image via simple linear
% transformations. This is advantage as linear transforms are very simple
% and require very little computational power. These transforms are
% essentail when we want to compare images of of different orientations. An
% example of that can be comparing two satellite images of India over a 
% span of 10 years. However, when a sattelite takes an image there is no
% guarantee whether the orinetation would be the same as of that of the
% previous image. In such circumstances we would have to change the
% orientation to make sure that an easy comparision is possible.