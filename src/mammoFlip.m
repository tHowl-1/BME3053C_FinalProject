% BME 3053C mammoFlip Function
%
% Author: Matthew Ebuen
% Group Members: Thomas Howland, Ronin Lupien, Paul Wanczuk
% Course: BME 3053C Computer Applications for BME
% Term: Fall 2022
% J. Crayton Pruitt Family Department of Biomedical Engineering
% University of FLorida
% Email: mebuen@ufl.edu
% Dec 5, 2022

function flippedIm = mammoFlip(img)
%Indexing the left and right side pixel values of mammogram image
[~,sz] = size(img);
middle = floor(sz/2); 
left_border = img(:,1:middle); 
right_border = img(:,(middle+1):end); 
%Summing up left and right side intensity values
left_sum = sum(left_border,'all'); 
right_sum = sum(right_border,'all'); 
%Comparing the sum of the right and left side values to see of it needs to
%be flipped
if left_sum > right_sum
    flippedIm = fliplr(img);
else
    flippedIm = img;
end
end
