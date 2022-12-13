% border
%
%Author: Paul Wanczuk
%Course: BME 3053C Computer Applications for BME
%Term: Fall 2022
%J. Crayton Pruitt Family Department of Biomedical Engineering
%University of Florida
%Email: pwanczuk@ufl.edu
%
%This function detects the border, outside region of the breast that may
%have bright regions that would interfere with Calcificator and Tumorator
%functions.
function [Bord]=border(imgn)
img=imread(imgn);
%brightens the entire breast and fills in holes in the breast image
I=imsharpen(img,'Amount',50);
se90=strel('line', 6, 90);
se0=strel('line', 6, 0);
Idil=imdilate(I,[se90 se0]);
%finds the border of the breast and enlarges/thickens the border
[~, threshold]=edge(Idil,'sobel');
fudgeFactor=0.8;
Iedge=edge(Idil, 'sobel', threshold*fudgeFactor);
se91=strel('line', 25, 90);
se1=strel('line', 25, 0);
Bord=imdilate(Iedge,[se91 se1]);
end