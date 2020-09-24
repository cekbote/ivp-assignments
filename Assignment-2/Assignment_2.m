clc;
clear all;
close all;
cameraman = imread('C:\Chanakya\Projects\ivp-assignments\Assignment-1\images\cameraman.tif');
imshow(add_padding(cameraman, 3, 0));