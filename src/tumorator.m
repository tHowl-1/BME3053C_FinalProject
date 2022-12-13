% Group Members: Thomas Howland, Ronin Lupien, Paul Wanczuk
% Course: BME 3053C Computer Applications for BME
% Term: Fall 2022
% J. Crayton Pruitt Family Department of Biomedical Engineering
% University of FLorida
% Email: mebuen@ufl.edu
% Dec 5, 2022

function tumorId_show = tumorator(img)
%Preprocessing to adjust contrast to make tumors more visible. Also
%obtaining the threshold for pixel values that correspond to tumor regions.
J = imadjust(img);
img_new = J;
maxPix = max(img_new,[],'all');
img_new(img_new<maxPix-30) = 0;
%Smoothening edges of thresholded image by dilating and eroding
se = strel('disk',3);
tumorId = imclose(img_new,se);
%Obtaining the areas of the thresholded regions and finding the maximum and
%minimum areas to threshold. 
stats = regionprops(img_new,'Area');
x = [stats.Area];
maxArea = max(x);
minArea = min(x(x>0));
%Filtering out areas as indicated by the thresholds from maxArea and
%minArea. Also storing the overlayed image as a variable to be displayed
%later on
tumorId = imbinarize(tumorId);
tumorId = bwareafilt(tumorId,[minArea+1 maxArea-1]);
tumorId_show = labeloverlay(J, tumorId);
end
