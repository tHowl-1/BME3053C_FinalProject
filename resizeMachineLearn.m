% BME 3053C Final Project CDD resizing
% 
% Author: Thomas Howland 
% Group Members: Matthew, Paul, Ronin
% Course: BME 3053C Computer Applications for BME 
% Term: Fall 2022 
% J. Crayton Pruitt Family Department of Biomedical Engineering 
% University of Florida 
% Email: thomas.howland@ufl.edu 
% November 26, 2022
%
% Script Description - Resizing and padding done on cdd images to match mias format

folder = 'dataset/full/CDD/';
output_folder = 'dataset/processed/CDD/';
extension = '*.jpg';
directory = strcat(folder, extension);

files = dir(directory);

scale = 227;
heatmap = zeros(scale, scale, 'double');
for i = 1:length(files)
    img = imread(files(i).name);
    nameNoExt = split(files(i).name, '.');
    resized = imresize(img, [scale, scale]);
    filename = strcat(output_folder, nameNoExt{1}, ".jpg");
    imwrite(resized, filename, "jpg");
    heatmap = heatmap + im2double(resized);
end
imshow(heatmap, []);