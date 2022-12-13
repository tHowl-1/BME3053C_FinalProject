%Calcificator
%
%Author: Paul Wanczuk
%Course: BME 3053C Computer Applications for BME
%Term: Fall 2022
%J. Crayton Pruitt Family Department of Biomedical Engineering
%University of Florida
%Email: pwanczuk@ufl.edu
%
%This code can take in an MRI image, and output an overlayed image that
%highlights the calcification regions. This works for dense,
%non-macrocalcification, and for images with calcification in non-dense
%regions.
function [Calcific]=Calcificator(Imgn)
Img=imread(Imgn);
bord=border(Imgn);
Cimg=borderRemove(Img,bord);

%Use Thresholding to Removed Useless Regions of Breast
I=Cimg;
I(I<190)=0;
%Edge Detection
[~, thresh]=edge(I,'roberts');
fudgeFactor=0.8;
Iedge=edge(I, 'roberts', fudgeFactor*thresh);

% Dilation and Filling
se90=strel('line', 7, 90);
se0=strel('line', 7, 0);
Idilate=imdilate(Iedge,[se90 se0]);
Ifill=imfill(Idilate, 'holes');

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
 %Overlaps the Original and Finished binary image with calcification in Red
 Calcific=labeloverlay(Img,Ifinish,'Colormap','autumn');
end
