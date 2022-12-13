% CalcificatorX 
%
%Author: Paul Wanczuk
%Course: BME 3053C Computer Applications for BME
%Term: Fall 2022
%J. Crayton Pruitt Family Department of Biomedical Engineering
%University of Florida
%Email: pwanczuk@ufl.edu
%
% CalcificatorX is the calcification identifier for xray images, which
% differs in thresholding and removal of unwanted regions. Does not work
% well with fatty breast Xray's.
function [Calc]= CalcificatorX(Imgn)
% Load the Xray image
Img=imread(Imgn);
%Identifies and removes border regions of breast and Xray label
Img=XrayRemover(Imgn);
bord=border(Imgn);
Cimg=borderRemove(Img,bord);
%Use Thresholding to Removed Useless Regions of Breast
I=Cimg;
I(I<220)=0;
%Edge Detection
[~, thresh]=edge(I,'roberts');
fudgeFactor=0.8;
Iedge=edge(I, 'roberts', fudgeFactor*thresh);

% Dilation and Filling
se90=strel('line', 7, 90);
se0=strel('line', 7, 0);
Idilate=imdilate(Iedge,[se90 se0]);
Ifill=imfill(Idilate, 'holes');
%remove detection on bone
for j=630:1024
    for i=1:340
       Ifill(i,j)=0;
    end
end
%Clearing and Erosion
Iclear=imclearborder(Ifill,4);
 seD=strel('disk',3);
 Ifinal=imerode(Iclear,seD);
 %Analysis of the Remaining Binary Regions/Masses
 Ilabel = bwlabel(Ifinal);
 stat = regionprops('table',Ilabel,'Area');
 area=stat.Area;
 %Removes the non-calcification binary blobs
 Ifinish = bwareafilt(Ifinal,[50 500]);
 %Creates image that Overlays calcification on original image
 Calc=labeloverlay(Img,Ifinish,'Colormap','autumn');
end