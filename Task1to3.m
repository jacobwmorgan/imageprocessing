% MATLAB script for Assessment 1
% Task 1: Preprocessing ---------------------------
clear; close all; clc;

% Step-1: Load input image
I = imread('IMG_01.jpg');
figure;
imshow(I);
title('Step-1: Load input image');

% Step-2: Conversion of input image to grey-scale image
Igray = rgb2gray(I);
figure;
imshow(Igray);
title('Step-2: Conversion of input image to greyscale');

% Step-3: Resizing the grayscale image using bilinear interpolation
    

% Step-4: Generating histogram for the resized image


% Step-5: Producing binarised image


%---------------------------------------------------------------
% Task 2: Edge Detection -----------------------



%---------------------------------------------------------------
% Task-3: Simple Segmentation -----------------------




