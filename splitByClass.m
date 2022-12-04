% BME 3053C Final Project Split Imageset into folders
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
% Script Description - Separates images in CDD folder into folders based on
% classification category

folder = 'dataset/processed/CDD/';
output_folder = 'dataset/split/CDD/';
cancerous = 'Cancerous/';
noncancerous = 'Non-Cancerous/';
extension = '*.jpg';
directory = strcat(folder, extension);

dataTable = readtable('CDD-Data.csv');

files = dir(directory);
for i = 1:length(files)
    nameNoExt = split(files(i).name, '.');
    parsedName = split(nameNoExt{1}, '-');
    img = imread(strcat(files(i).folder, '\', files(i).name));
    img = cat(3, img, img, img);
    if strcmp(dataTable.Class{str2double(parsedName{2})}, 'N')
        filename = strcat(output_folder, noncancerous, nameNoExt{1},".jpg");
    else
        filename = strcat(output_folder, cancerous, nameNoExt{1},".jpg");
    end
    imwrite(img, filename, "jpg");
end