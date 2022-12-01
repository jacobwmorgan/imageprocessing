









% MATLAB script for Assessment 1
% Task 1: Preprocessing ---------------------------
clear; close all; clc;

% Step-1: Load input image
I = imread('Images/IMG_01.JPG');
figure;
imshow(I);


% Step-2: Conversion of input image to grey-scale image
Igray = rgb2gray(I);
figure;
imshow(Igray);
size(Igray)


% Step-3: Resizing the grayscale image using bilinear interpolation


Igraybi = imresize(Igray,0.5,"bilinear");
figure;
imshow(Igraybi);
size(Igraybi)

% Step-4: Generating histogram for the resized image

histogram(Igraybi,20);

%histogram drops off at around 150. so we do 150/255 = 0.5888


threshold = double(150/255);

% Step-5: Producing binarised image

BW = imbinarize(Igraybi,threshold);
imshow(BW);




%---------------------------------------------------------------
% Task 2: Edge Detection -----------------------



%---------------------------------------------------------------
% Task-3: Simple Segmentation -----------------------



