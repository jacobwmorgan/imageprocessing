% MATLAB script for Assessment Item-1
clear; close all; clc;
GT = imread("Assignment_Input/binswan.jpg");
GT = imcrop(GT,[440.5 340.5 249 223]);

dice_scores = [];

for i = 01:16 
  if i < 10
    i = sprintf("%02d",i);
  end 
  
  try
    groundtruth = imread("Assignment_GT/IMG_" + i + "_GT.JPG");

    actual = imread("Assignment_Input/IMG_" + i + ".JPG");

    Ir = swan_detection(actual, GT);
    figure;
    imshow(Ir);
    title("Swan " +i)
    Ir = imbinarize(Ir,0.9);
    groundtruth = imbinarize(groundtruth,0.9);
    dice_score = dice(Ir, groundtruth);
    dice_scores = [dice_scores dice_score];
  catch ME
    disp("Error Threshold too low")
  end
end

meandice = mean(dice_scores)
stddice  = std(dice_scores)
dice_scores

function Ir = swan_detection(actual,GT)

  actualGray = rgb2gray(actual);

  swanPoints = detectSURFFeatures(GT);

  meanContrast = mean(mean(actualGray));
  img = imadjust(actualGray,[meanContrast/255,1]);
  thresh = graythresh(img);

  binarisedImage = imbinarize(actualGray,0.7);

  actualPoints = detectSURFFeatures(binarisedImage);

  [sceneFeatures,scenePoints] = extractFeatures(binarisedImage,actualPoints);


  [swanFeatures,swanPoints] = extractFeatures(GT,swanPoints);
  swanPairs = matchFeatures(swanFeatures,sceneFeatures);
  matchedSwanPoints = swanPoints(swanPairs(:,1),:);
  matchedScenePoints = scenePoints(swanPairs(:,2),:);

  [tform, inlierSwanPoints, inlierScenePoints] = estimateGeometricTransform(matchedSwanPoints, matchedScenePoints, 'affine');

  % Transform obj image onto input image  % On the obj image variable to get output 
  outputView = imref2d(size(binarisedImage)); 
  Ir = imwarp(GT,tform,"OutputView",outputView);

end