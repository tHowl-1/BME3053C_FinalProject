%Calcificator
function [Calcifier]=Calcificator(Imgn);
clc; clear;
Img=imread(Imgn);
%g=borderRemove('cdd-313.jpg');
%Use Thresholding to Removed Useless Regions of Breast
I=Img;
I(I<185)=0;
I(I>231)=0;
%Edge Detection
 [~, threshold]=edge(I,'sobel');
 fudgeFactor=0.8;
 Iedge=edge(I, 'sobel', threshold*fudgeFactor);
% Dilation and Filling
se90=strel('line', 3, 90);
se0=strel('line', 3, 0);
Idilate=imdilate(Iedge,[se90 se0]);
Ifill=imfill(Idilate, 'holes');
%Clearing and Erosion
Iclear=imclearborder(Ifill,4);
 seD=strel('disk',3);
 Ifinal=imerode(Iclear,seD);
 Ifinal=imerode(Ifinal,seD);
 %Analysis of the Remaining Binary Regions/Masses
 Ilabel = bwlabel(Ifinal);
 stat = regionprops('table',Ilabel,'Area');
 area=stat.Area;
 %Removes the non-calcification binary blobs
 Ifinish = bwareafilt(Ifinal,[150 500]);
 %Displays Overlay of Calcification
 imshow(labeloverlay(Img,Ifinish,'Colormap','autumn'));
end
