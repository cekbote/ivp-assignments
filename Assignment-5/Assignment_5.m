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


%% Functions Created: contraharmonic_filter

%% Image Imports

lena = imread('C:\Chanakya\Projects\ivp-assignments\Assignment-3\images\lena_gray_256.tif');


%% Image Blur
% \begin{pmatrix}
% 1 & 2 & 3\\
% a & b & c
% \end{pmatrix}

blur = mat2gray(real(motion_blur(lena, 0.1, 0.1, 2)));


% imshow(mat2gray(real(inv_motion_blur(blur, 0.1, 0.1, 2))));


% imshow(mat2gray(real(low_pass_gaussian_filter(blur, 100))));

imshow(mat2gray(real(weiner_filter(blur, 0.1, 0.1, 2, 0.002))));
%% 

