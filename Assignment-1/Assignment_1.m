clc; 
clear all;
close all;

%% Image Imports
cameraman = imread('C:\Chanakya\Projects\ivp-assignments\Assignment-1\images\cameraman.tif');

p = pixel_hist_2d(cameraman);
figure;
plot(1:1:256, p);

figure;
negative = histogram_equalization(cameraman);
imshow(uint8(abs(negative)));

p = pixel_hist_2d(uint8(negative));
figure;
plot(1:1:256, p);