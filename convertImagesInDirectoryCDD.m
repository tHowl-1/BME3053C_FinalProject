% BME 3053C Final Project Image Conversion CDD
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
% Script Description - Preprocesses CDD images by converting to jpg

folder = 'PKG-CDD-CESM/CDD-CESM/Subtracted-CDD-CESM/';
output_folder = 'dataset/full/CDD/';
extension = '*.jpg';
directory = strcat(folder, extension);

files = dir(directory);
count = 0;

for i = 1:length(files)
    nameNoExt = split(files(i).name, '.');
    parsedName = split(nameNoExt{1}, '_');
    if strcmp(parsedName{4}, 'MLO')
        img = imread(files(i).name);
        img = im2gray(img);
        if strcmp(parsedName{2}, 'L')
            img = fliplr(img);
        end
        count = count + 1;
        filename = strcat(output_folder, "cdd-", string(count), ".jpg");
        imwrite(img, filename, "jpg");
    end
end

disp(count);