clc;
clear all;
close all;
cameraman = imread('C:\Chanakya\Projects\ivp-assignments\Assignment-1\images\cameraman.tif');
size(add_padding(cameraman, 3, 0));
im = log_filter(5, 0.4)