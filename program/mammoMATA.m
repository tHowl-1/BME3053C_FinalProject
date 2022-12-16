% BME 3053C Final Project - MATA Program
% 
% Author: Thomas Howland 
% Group Members: Matthew, Paul, Ronin
% Course: BME 3053C Computer Applications for BME 
% Term: Fall 2022 
% J. Crayton Pruitt Family Department of Biomedical Engineering 
% University of Florida 
% Email: thomas.howland@ufl.edu 
% December 13, 2022
%
% Script Description - Main Script to showcase and put code to use

clc; clear;
load('network.mat');

% Input
file = input('Input file to analyze: ', "s");
img = imread(file);
type = input('Input file Type: MRI or XRAY: ',"s");

% Machine Learning
gray = im2gray(img);
scaled = imresize(img, [227, 227]);
rgb = cat(3, scaled, scaled, scaled);
[prediction, probability] = classify(trainedNetwork_5, rgb);
fprintf('This image is classified as: %s , with %.2f percent certainty', string(prediction), max(probability) * 100 );

%Insert tumorator and calcificator here
subplot(2,1,1);
if type=="MRI"
    bord=border(gray);
    border_remove=borderRemove(gray,bord);
    tumor = tumorator(border_remove);
    imshow(tumor);
    title("Possible Tumor regions in Blue");
else
    flippedImage = mammoFlip(gray);
    tumor = tumorator(flippedImage);
    imshow(tumor);
    title("Possible Tumor regions in Blue");
end

%Calcificator
subplot(2,1,2);
if type=="MRI"
    calc=Calcificator(img);
    imshow(calc);
    title("Possible Calcification regions in Red");
else
    flippedImage=mammoFlip(img);
    calc=CalcificatorX(flippedImage);
    imshow(calc);
    title("Possible Calcification region in Red");
end
