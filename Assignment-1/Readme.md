<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   <!--
This HTML was auto-generated from MATLAB code.
To make changes, update the MATLAB code and republish this document.
      --><title>Assignment_1</title><meta name="generator" content="MATLAB 8.5"><link rel="schema.DC" href="http://purl.org/dc/elements/1.1/"><meta name="DC.date" content="2020-09-20"><meta name="DC.source" content="Assignment_1.m"><style type="text/css">
html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,font,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,b,u,i,center,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td{margin:0;padding:0;border:0;outline:0;font-size:100%;vertical-align:baseline;background:transparent}body{line-height:1}ol,ul{list-style:none}blockquote,q{quotes:none}blockquote:before,blockquote:after,q:before,q:after{content:'';content:none}:focus{outine:0}ins{text-decoration:none}del{text-decoration:line-through}table{border-collapse:collapse;border-spacing:0}

html { min-height:100%; margin-bottom:1px; }
html body { height:100%; margin:0px; font-family:Arial, Helvetica, sans-serif; font-size:10px; color:#000; line-height:140%; background:#fff none; overflow-y:scroll; }
html body td { vertical-align:top; text-align:left; }

h1 { padding:0px; margin:0px 0px 25px; font-family:Arial, Helvetica, sans-serif; font-size:1.5em; color:#d55000; line-height:100%; font-weight:normal; }
h2 { padding:0px; margin:0px 0px 8px; font-family:Arial, Helvetica, sans-serif; font-size:1.2em; color:#000; font-weight:bold; line-height:140%; border-bottom:1px solid #d6d4d4; display:block; }
h3 { padding:0px; margin:0px 0px 5px; font-family:Arial, Helvetica, sans-serif; font-size:1.1em; color:#000; font-weight:bold; line-height:140%; }

a { color:#005fce; text-decoration:none; }
a:hover { color:#005fce; text-decoration:underline; }
a:visited { color:#004aa0; text-decoration:none; }

p { padding:0px; margin:0px 0px 20px; }
img { padding:0px; margin:0px 0px 20px; border:none; }
p img, pre img, tt img, li img, h1 img, h2 img { margin-bottom:0px; } 

ul { padding:0px; margin:0px 0px 20px 23px; list-style:square; }
ul li { padding:0px; margin:0px 0px 7px 0px; }
ul li ul { padding:5px 0px 0px; margin:0px 0px 7px 23px; }
ul li ol li { list-style:decimal; }
ol { padding:0px; margin:0px 0px 20px 0px; list-style:decimal; }
ol li { padding:0px; margin:0px 0px 7px 23px; list-style-type:decimal; }
ol li ol { padding:5px 0px 0px; margin:0px 0px 7px 0px; }
ol li ol li { list-style-type:lower-alpha; }
ol li ul { padding-top:7px; }
ol li ul li { list-style:square; }

.content { font-size:1.2em; line-height:140%; padding: 20px; }

pre, code { font-size:12px; }
tt { font-size: 1.2em; }
pre { margin:0px 0px 20px; }
pre.codeinput { padding:10px; border:1px solid #d3d3d3; background:#f7f7f7; }
pre.codeoutput { padding:10px 11px; margin:0px 0px 20px; color:#4c4c4c; }
pre.error { color:red; }

@media print { pre.codeinput, pre.codeoutput { word-wrap:break-word; width:100%; } }

span.keyword { color:#0000FF }
span.comment { color:#228B22 }
span.string { color:#A020F0 }
span.untermstring { color:#B20000 }
span.syscmd { color:#B28C00 }

.footer { width:auto; padding:10px 0px; margin:25px 0px 0px; border-top:1px dotted #878787; font-size:0.8em; line-height:140%; font-style:italic; color:#878787; text-align:left; float:none; }
.footer p { margin:0px; }
.footer a { color:#878787; }
.footer a:hover { color:#878787; text-decoration:underline; }
.footer a:visited { color:#878787; }

table th { padding:7px 5px; text-align:left; vertical-align:middle; border: 1px solid #d6d4d4; font-weight:bold; }
table td { padding:7px 5px; text-align:left; vertical-align:top; border:1px solid #d6d4d4; }





  </style></head><body><div class="content"><h2>Contents</h2><div><ul><li><a href="#1">IVP Assignment 1</a></li><li><a href="#2">Creating a new environment.</a></li><li><a href="#3">Functions Created for the Assignment: rgb_to_hsi</a></li><li><a href="#4">Functions Created for the Assignment: image_negative</a></li><li><a href="#5">Functions Created for the Assignment: dft_2d</a></li><li><a href="#6">Functions Created for the Assignment: log_transform</a></li><li><a href="#7">Functions Created for the Assignment: gamma_transform</a></li><li><a href="#8">Functions Created for the Assignment: pixel_hist_2d</a></li><li><a href="#9">Functions Created for the Assignment: histogram_equalization</a></li><li><a href="#10">Image Imports</a></li><li><a href="#11">Question 1: Seperate an RGB image into its constituent colours and then convert the RGB to HSI format.</a></li><li><a href="#12">Question 2: Obtaining the negative of the image.</a></li><li><a href="#13">Question 3: Computing the 2D-DFT of the image and then its log transform</a></li><li><a href="#14">Question 4: Computing the gamma transform of images.</a></li><li><a href="#15">Question 5: Using Histogram Equalization on the image.</a></li><li><a href="#16">References</a></li></ul></div><h2>IVP Assignment 1<a name="1"></a></h2><pre class="codeinput"><span class="comment">% Name: Chanakya Ajit Ekbote</span>
<span class="comment">% Institute: IIT, Bhubaneswar%DATE: 19.09.2020</span>
<span class="comment">% Degree: Btech</span>
<span class="comment">% Branch: Electronics and Communication</span>
<span class="comment">% Roll Number: 17EC01041</span>
</pre><h2>Creating a new environment.<a name="2"></a></h2><pre class="codeinput">clc;
clear <span class="string">all</span>;
close <span class="string">all</span>;
</pre><h2>Functions Created for the Assignment: rgb_to_hsi<a name="3"></a></h2><pre class="language-matlab">
<span class="comment">% Function that converts an rgb image to hsi.</span>

<span class="keyword">function</span> [hue, sat, inten] = rgb_to_hsi(red, green, blue, img)
    hue = acos((1/2 * ((red - green)+(red - blue)))./((red - green).^2 + sqrt((red-blue).*(green - blue))+0.000001));
    hue(blue&gt;green)= 360 - hue(blue&gt;green);
    sat = 1 - 3./(sum(img, 3)) .* min(img,[],3);
    inten = sum(img, 3)./3;

</pre><h2>Functions Created for the Assignment: image_negative<a name="4"></a></h2><pre class="language-matlab">
<span class="comment">% Function that computes the negative of an image.</span>

<span class="keyword">function</span> [negative] = image_negative(image)
    negative = image;
    [~, dim] = size(size(image));
   
    <span class="comment">% If conditional is used to check whether the image is 2D or 3D. </span>
    <span class="keyword">if</span> dim == 2
        [row, col] = size(image);
        <span class="keyword">for</span> i = 1:row
            <span class="keyword">for</span> j = 1:col
                negative(i, j) = 255 - negative(i, j);
            <span class="keyword">end</span>
        <span class="keyword">end</span>
    <span class="keyword">else</span>
        [row, col, channels] = size(image);
        <span class="keyword">for</span> i = 1:row
            <span class="keyword">for</span> j = 1:col
                <span class="keyword">for</span> k = 1: channels
                    negative(i, j, k) = 255 - negative(i, j, k);
                <span class="keyword">end</span>
            <span class="keyword">end</span>
        <span class="keyword">end</span>
    <span class="keyword">end</span>   

</pre><h2>Functions Created for the Assignment: dft_2d<a name="5"></a></h2><pre class="language-matlab">
<span class="comment">% Function that computes the 2D-DFT for an image.</span>

<span class="keyword">function</span> [dft2d] = dft_2d(image)
    image = double(image);
    [M, N] = size(image);

    <span class="comment">% m, n should go from -pi to pi for better interpretation.</span>
    m = -(M-1)/2:1:(M-1)/2;
    n = -(N-1)/2:1:(N-1)/2;

    <span class="comment">% Creates the X exponentials required to compute the DFT. </span>
    exponential_x = m' * m;
    exponential_x = exp(-2 * pi * 1i / M .* exponential_x);
    
    <span class="comment">% Creates the Y exponentials required to compute the DFT.</span>
    exponential_y = n' * n;
    exponential_y = exp(-2 * pi * 1i / N .* exponential_y);

    <span class="comment">% Final FFT Computation. </span>
    dft2d = exponential_x * image * exponential_y;

</pre><h2>Functions Created for the Assignment: log_transform<a name="6"></a></h2><pre class="language-matlab">
<span class="comment">% Function that computes the log transform for an image.</span>

<span class="keyword">function</span> [log_trans] = log_transform(image, c)
    log_trans = double(image);
    [~, dim] = size(size(image));
    
    <span class="comment">% If conditional is used to check whether the image is 2D or 3D.</span>
    <span class="keyword">if</span> dim == 2
        [row, col] = size(image);
        <span class="keyword">for</span> i = 1:row
            <span class="keyword">for</span> j = 1:col
                log_trans(i, j) = c * log( 1+ (log_trans(i, j)));
            <span class="keyword">end</span>
        <span class="keyword">end</span>
    <span class="keyword">else</span>
        [row, col, channels] = size(image);
        <span class="keyword">for</span> i = 1:row
            <span class="keyword">for</span> j = 1:col
                <span class="keyword">for</span> k = 1: channels
                    log_trans(i, j, k) = c * log(1 + (log_trans(i, j, k)));
                <span class="keyword">end</span>
            <span class="keyword">end</span>
        <span class="keyword">end</span>
    <span class="keyword">end</span>

</pre><h2>Functions Created for the Assignment: gamma_transform<a name="7"></a></h2><pre class="language-matlab">
<span class="comment">% Function that computes the gamma transform for an image.</span>

<span class="keyword">function</span> [gamma_trans] = gamma_transform(image, c, gamma)
    gamma_trans = double(image);
    [~, dim] = size(size(image));
    
    <span class="comment">% If conditional is used to check whether the image is 2D or 3D. </span>
    <span class="keyword">if</span> dim == 2
        [row, col] = size(image);
        <span class="keyword">for</span> i = 1:row
            <span class="keyword">for</span> j = 1:col
                gamma_trans(i, j) = c * (gamma_trans(i, j))^(gamma);
            <span class="keyword">end</span>
        <span class="keyword">end</span>
    <span class="keyword">else</span>
        [row, col, channels] = size(image);
        <span class="keyword">for</span> i = 1:row
            <span class="keyword">for</span> j = 1:col
                <span class="keyword">for</span> k = 1: channels
                    gamma_trans(i, j, k) = c * (gamma_trans(i, j, k))^(gamma);
                <span class="keyword">end</span>
            <span class="keyword">end</span>
        <span class="keyword">end</span>
    <span class="keyword">end</span>

</pre><h2>Functions Created for the Assignment: pixel_hist_2d<a name="8"></a></h2><pre class="language-matlab">
<span class="comment">% Function that computes the frequency of pixels of a particular </span>
<span class="comment">% intensity in an image.</span>

<span class="keyword">function</span> [pixel_hist_] = pixel_hist_2d(image)
    pixel_hist_ = zeros(1, 256);
    [row, col] = size(image);
    <span class="keyword">for</span> i = 1:row
        <span class="keyword">for</span> j = 1:col
            <span class="comment">% Statement that adds one value to each array position where</span>
            <span class="comment">% the pixel intensities lie.</span>
            pixel_hist_(image(i, j)+1) = pixel_hist_(image(i, j)+1) + 1;
        <span class="keyword">end</span>
    <span class="keyword">end</span>

</pre><h2>Functions Created for the Assignment: histogram_equalization<a name="9"></a></h2><pre class="language-matlab">
<span class="comment">% Function that performs histogram equalization.</span>

<span class="keyword">function</span> [histeqimage] = histogram_equalization(image)
    [row, col] = size(image);
    keys = [];
    histeqimage = image;
    
    <span class="comment">% hist_map contains is a hash map that contains the freq histogram.</span>
    hist_map = containers.Map();
    <span class="comment">% hist_map contains is a hash map that contains the cdf.</span>
    cdf_map = containers.Map();
    <span class="comment">% hist_map contains is a hash map that contains the transformed results.</span>
    hist_eq_map = containers.Map();
    
    <span class="comment">% Computing the frequency.</span>
    <span class="keyword">for</span> i=1:row
        <span class="keyword">for</span> j=1:col
            key = char(image(i, j));
            <span class="keyword">if</span> isKey(hist_map, key)
                hist_map(key) = hist_map(key) + 1;
            <span class="keyword">else</span>
                hist_map(key) = 1;
                keys = [keys; key]; 
            <span class="keyword">end</span>
        <span class="keyword">end</span>
    <span class="keyword">end</span>
    
    keys = sort(keys);
    sum = 0;
    cdf_min = hist_map(keys(char(1)));
    
    [key_length, ~] = size(keys);
    
    <span class="comment">% Computing the CDF.</span>
    <span class="keyword">for</span> i=1:key_length
        sum = sum + hist_map(keys(i));
        cdf_map(keys(i)) = sum;
    <span class="keyword">end</span>
    
    <span class="comment">% Computing the transformation function.</span>
    <span class="keyword">for</span> i=1:key_length
        hist_eq_map(keys(i)) = round((cdf_map(keys(i))-cdf_min)*255/(row*col-cdf_min));
    <span class="keyword">end</span>
    
    <span class="comment">% Transforming the Image.</span>
    <span class="keyword">for</span> i=1:row
        <span class="keyword">for</span> j=1:col
            key = char(image(i, j));
            histeqimage(i,j) = hist_eq_map(key);
        <span class="keyword">end</span>
    <span class="keyword">end</span>

</pre><h2>Image Imports<a name="10"></a></h2><pre class="codeinput">cameraman = imread(<span class="string">'C:\Chanakya\Projects\ivp-assignments\Assignment-1\images\cameraman.tif'</span>);
lena_color = imread(<span class="string">'C:\Chanakya\Projects\ivp-assignments\Assignment-1\images\lena_color_256.tif'</span>);
</pre><h2>Question 1: Seperate an RGB image into its constituent colours and then convert the RGB to HSI format.<a name="11"></a></h2><pre class="codeinput"><span class="comment">% Decomposing the image to its constituent colors.</span>
red = lena_color(:,:,1);
green = lena_color(:,:,2);
blue = lena_color(:,:,3);

<span class="comment">% Plotting the image and its constituent RGB Colors.</span>
figure(<span class="string">'Name'</span>, <span class="string">'Decomposing an RBG Image to its Constituent Colours'</span>);
subplot(2,2,1);
imshow(lena_color);
title(<span class="string">'Original Image'</span>);

subplot(2,2,2);
imshow(red);
title(<span class="string">'Red Channel'</span>);

subplot(2,2,3);
imshow(blue);
title(<span class="string">'Blue Channel'</span>);

subplot(2,2,4);
imshow(green);
title(<span class="string">'Green Channel'</span>);

<span class="comment">% Calling the rgb_to_hsi function.</span>
[hue, sat, int] = rgb_to_hsi(double(red), double(green), double(blue), double(lena_color));

<span class="comment">% Comparing the hue, saturation and intensity to the original image.</span>
figure(<span class="string">'Name'</span>, <span class="string">'Decomposing an RBG Image to HSI'</span>);
subplot(2,3,1);
imshow(lena_color);
title(<span class="string">'Original Image'</span>);

subplot(2,3,2);
imshow(uint8(hue));
title(<span class="string">'Hue Channel'</span>);

subplot(2,3,3);
imshow(uint8(100 * sat));
title(<span class="string">'Saturation Channel'</span>);

subplot(2,3,4);
imshow(uint8(int));
title(<span class="string">'Intensity Channel'</span>);

subplot(2,3,4);
imshow(uint8(int));
title(<span class="string">'Intensity Channel'</span>);

<span class="comment">% Computing the RBG image assuming HSI channels.</span>
his_image(:,:,1) = hue; his_image(:,:,2) = sat; his_image(:,:,3) = int;
subplot(2,3,5);
imshow(uint8(his_image));
title(<span class="string">'Image using HSI as RBG'</span>);
</pre><img vspace="5" hspace="5" src="Assignment_1_01.png" alt=""> <img vspace="5" hspace="5" src="Assignment_1_02.png" alt=""> <h2>Question 2: Obtaining the negative of the image.<a name="12"></a></h2><pre class="codeinput">image = cameraman;
<span class="comment">% Calling the image_negative function.</span>
negative = image_negative(image);

<span class="comment">% Comparing the image and the image negative.</span>
figure(<span class="string">'Name'</span>, <span class="string">'Transforming an image to its negative.'</span>);
subplot(1,2,1);
imshow(image);
title(<span class="string">'Original Image'</span>);

subplot(1,2,2);
imshow(negative);
title(<span class="string">'Negative of the Image'</span>);
</pre><img vspace="5" hspace="5" src="Assignment_1_03.png" alt=""> <h2>Question 3: Computing the 2D-DFT of the image and then its log transform<a name="13"></a></h2><pre class="codeinput"><span class="comment">% Calling the dft_2d function.</span>
dft2d = dft_2d(cameraman);

<span class="comment">% Comparing the image, the 2D-DFT and the log transform of the 2D DFT.</span>
figure(<span class="string">'Name'</span>, <span class="string">'Computing the 2D-DFT of the image.'</span>);
subplot(1,3,1);
imshow(cameraman);
title(<span class="string">'Original Image'</span>);

subplot(1,3,2);
imshow(uint8(abs(dft2d)));
title(<span class="string">'2D DFT'</span>);

subplot(1,3,3)
imshow(uint8(log_transform(abs(dft2d), 10)));
title(<span class="string">'2D DFT with Log Transform'</span>);

<span class="comment">% The DFT can be easily visualized after the log transform.</span>
</pre><img vspace="5" hspace="5" src="Assignment_1_04.png" alt=""> <h2>Question 4: Computing the gamma transform of images.<a name="14"></a></h2><pre class="codeinput"><span class="comment">% Calling the gamma_transform function.</span>
image_1 = gamma_transform(cameraman, 1, 0.9);
image_2 = gamma_transform(cameraman, 1, 1.1);

<span class="comment">% Comparing the iamge, the 2D-DFT and the log transform of the 2D DFT.</span>
figure(<span class="string">'Name'</span>, <span class="string">'Computing the 2D-DFT of the image.'</span>);
subplot(1,3,1);
imshow(cameraman);
title(<span class="string">'Original Image'</span>);

subplot(1,3,2);
imshow(uint8(image_1));
title(<span class="string">'Gamma = 0.9'</span>);

subplot(1,3,3)
imshow(uint8(image_2));
title(<span class="string">'Gamma = 1.1'</span>);
</pre><img vspace="5" hspace="5" src="Assignment_1_05.png" alt=""> <h2>Question 5: Using Histogram Equalization on the image.<a name="15"></a></h2><pre class="codeinput"><span class="comment">% Calling the hist_2d function to get the histogram before equalization.</span>
hist_before = pixel_hist_2d(cameraman);

<span class="comment">% Calling the histogram_equalization function to get the histogram</span>
<span class="comment">% equalised image.</span>
histeq_image = histogram_equalization(cameraman);

<span class="comment">% Calling the hist_2d function to get the histogram after equalization.</span>
hist_after = pixel_hist_2d(histeq_image);

<span class="comment">% Comparing the iamge, the 2D-DFT and the log transform of the 2D DFT.</span>
figure(<span class="string">'Name'</span>, <span class="string">'Computing the 2D-DFT of the image.'</span>);
subplot(2,2,1);
imshow(cameraman);
title(<span class="string">'Original Image'</span>);

subplot(2,2,2);
plot(0:1:255, hist_before, <span class="string">'-bo'</span>, <span class="string">'MarkerSize'</span>, 2);
title(<span class="string">'Frequency Histogram before Equalization'</span>);
xlabel(<span class="string">'Pixel Bins'</span>);
ylabel(<span class="string">'Frequency'</span>);
axis <span class="string">tight</span>;

subplot(2,2,3)
imshow(histeq_image);
title(<span class="string">'Histogram Equalised Image'</span>);

subplot(2,2,4);
plot(0:1:255, hist_after, <span class="string">'-bo'</span>, <span class="string">'MarkerSize'</span>, 2);
title(<span class="string">'Frequency Histogram after Equalization'</span>);
xlabel(<span class="string">'Pixel Bins'</span>);
ylabel(<span class="string">'Frequency'</span>);
axis <span class="string">tight</span>;
</pre><img vspace="5" hspace="5" src="Assignment_1_06.png" alt=""> <h2>References<a name="16"></a></h2><pre class="codeinput"><span class="comment">% 1. https://en.wikipedia.org/wiki/Histogram_equalization</span>
<span class="comment">% 2. https://www.imageeprocessing.com/2013/05/converting-rgb-image-to-hsi.html</span>
</pre><p class="footer"><br><a href="http://www.mathworks.com/products/matlab/">Published with MATLAB&reg; R2015a</a><br></p></div><!--
##### SOURCE BEGIN #####
%% IVP Assignment 1

% Name: Chanakya Ajit Ekbote
% Institute: IIT, Bhubaneswar%DATE: 19.09.2020
% Degree: Btech
% Branch: Electronics and Communication
% Roll Number: 17EC01041

%% Creating a new environment.

clc; 
clear all;
close all;

%% Functions Created for the Assignment: rgb_to_hsi
% <include>rgb_to_hsi.m</include>

%% Functions Created for the Assignment: image_negative
% <include>image_negative.m</include>

%% Functions Created for the Assignment: dft_2d
% <include>dft_2d.m</include>

%% Functions Created for the Assignment: log_transform
% <include>log_transform.m</include>

%% Functions Created for the Assignment: gamma_transform
% <include>gamma_transform.m</include>

%% Functions Created for the Assignment: pixel_hist_2d
% <include>pixel_hist_2d.m</include>

%% Functions Created for the Assignment: histogram_equalization
% <include>histogram_equalization.m</include>

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

% Comparing the image, the 2D-DFT and the log transform of the 2D DFT.
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

% Comparing the iamge, the 2D-DFT and the log transform of the 2D DFT.
figure('Name', 'Computing the 2D-DFT of the image.');
subplot(2,2,1);
imshow(cameraman);
title('Original Image');

subplot(2,2,2);
plot(0:1:255, hist_before, '-bo', 'MarkerSize', 2);
title('Frequency Histogram before Equalization');
xlabel('Pixel Bins');
ylabel('Frequency');
axis tight;

subplot(2,2,3)
imshow(histeq_image);
title('Histogram Equalised Image');

subplot(2,2,4);
plot(0:1:255, hist_after, '-bo', 'MarkerSize', 2);
title('Frequency Histogram after Equalization');
xlabel('Pixel Bins');
ylabel('Frequency');
axis tight;

%% References

% 1. https://en.wikipedia.org/wiki/Histogram_equalization
% 2. https://www.imageeprocessing.com/2013/05/converting-rgb-image-to-hsi.html
##### SOURCE END #####
--></body></html>