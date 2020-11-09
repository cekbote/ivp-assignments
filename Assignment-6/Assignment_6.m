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
% $$ A =   \pmatrix{sin(\theta) & 2 \cr 3 & 4} * \pmatrix{sin(\theta) & 2 \cr 3 & 4}$$

%% Image Imports

lena = imread('C:\Chanakya\Projects\ivp-assignments\Assignment-3\images\lena_gray_256.tif');


T = [3,0,0;0,4,0;0,0,1];

theta=75;
R_mat=[cosd(theta),sind(theta),0;-1*sind(theta),cosd(theta),0;0,0,1];

x = affine_transformation(affine_transformation(lena, R_mat), T);
imshow(mat2gray(x));