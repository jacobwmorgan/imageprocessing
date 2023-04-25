% MATLAB script for Assessment 1
% Task 1: Preprocessing ---------------------------
clear; close all; clc;

% Step-1: Load input image
I = imread('Assignment_Input/IMG_01.JPG');
figure;
imshow(I);
title("Step-1: Load input image");

% Step-2: Conversion of input image to grey-scale image
Igray = rgb2gray(I);
figure;
imshow(Igray)
size(Igray)
title("Step-2: Conversion of input image to grey-scale image")

% Step-3: Resizing the grayscale image using bilinear interpolation
Igraybi = imresize(Igray,0.5,"bilinear");
figure;
imshow(Igraybi)
size(Igraybi)
title("Step-3: Resizing the grayscale image using bilinear interpolation")

% Step-4: Generating histogram for the resized image
figure;
histogram(Igraybi,20)
title("Step-4: Generating histogram for the resized image")

% Step-5: Producing binarised image
threshold = double(210/255);

binarisedImage = imbinarize(Igraybi,threshold);
figure;
imshow(binarisedImage)
title("Step-5: Producing binarised image")


%---------------------------------------------------------------
% Task 2: Edge Detection -----------------------
edgeDetectionSobel = edge(Igraybi,'sobel');
figure;
imshow(edgeDetectionSobel)
title("Task 2: Edge Detection - Sobel")
edgeDetectionCanny = edge(Igraybi,'canny');
figure; 
imshow(edgeDetectionCanny)
title("Task 2: Edge Detection - Canny")

%---------------------------------------------------------------
% Task-3: Simple Segmentation -----------------------
binerisedImagecleaner = bwareafilt(binarisedImage,[2000,7500]); %removes the biggest section on the right
figure;
imshow(binerisedImagecleaner)
title("Task 3: Simple Segmentation")
imwrite(binerisedImagecleaner,"Assignment_Input/binswan.jpg")


