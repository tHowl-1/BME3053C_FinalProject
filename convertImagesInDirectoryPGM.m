% BME 3053C Final Project Image Conversion MIAS
% 
% Author: Thomas Howland 
% Group Members: Matthew, Paul, Ronin
% Course: BME 3053C Computer Applications for BME 
% Term: Fall 2022 
% J. Crayton Pruitt Family Department of Biomedical Engineering 
% University of Florida 
% Email: thomas.howland@ufl.edu 
% November 25, 2022
%
% Script Description - Converts all images in mias directory to jpg

folder = 'all-mias.tar/all-mias/';
output_folder = 'dataset/full/CDD/';
extension = '*.pgm';
directory = strcat(folder, extension);

files = dir(directory);

for i = 1:length(files)
    img = imread(files(i).name);
    filename = strcat(output_folder, "mias-", string(i), ".jpg");
    imwrite(img, filename, "jpg");
end
