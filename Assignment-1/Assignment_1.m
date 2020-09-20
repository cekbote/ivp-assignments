clc; 
clear all;
close all;

%% "Your own headline here"
% <include>log_transform.m</include>

%% Image Imports
cameraman = imread('C:\Chanakya\Projects\ivp-assignments\Assignment-1\images\cameraman.tif');

p = pixel_hist_2d(cameraman);
figure;
plot(1:1:256, p);

figure;
negative = dft_2d(cameraman);
imshow(uint8(log_transform(abs(negative), 10)));

p = pixel_hist_2d(uint8(negative));
figure;
plot(1:1:256, p);
