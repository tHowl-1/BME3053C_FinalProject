% BME 3053C Final Project Image Classification Attempt
% 
% Author: Thomas Howland 
% Group Members: Matthew, Paul, Ronin
% Course: BME 3053C Computer Applications for BME 
% Term: Fall 2022 
% J. Crayton Pruitt Family Department of Biomedical Engineering 
% University of Florida 
% Email: thomas.howland@ufl.edu 
% November 28, 2022
%
% Script Description - Model creation using datastore

dataStore = imageDatastore('dataset/split/CDD/', 'IncludeSubfolders', true,'LabelSource', 'foldernames');
dataTable = countEachLabel(dataStore);
[trainingSet, testSet] = splitEachLabel(dataStore, 0.75, 'randomize');

