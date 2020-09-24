clc;
clear all;
close all;
cameraman = imread('C:\Chanakya\Projects\ivp-assignments\Assignment-1\images\cameraman.tif');
image = add_padding(cameraman, 5, 0);
filter = log_filter(3, 1);
filter = filter -mean(mean(filter));
x = correlation(image, filter);
min_ = min(min(x));
max_ = max(max(x));
x = (x-min_)*255/(max_-min_);
imshow(uint8(x));

