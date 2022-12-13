% XrayRemover
%
%Author: Paul Wanczuk
%Course: BME 3053C Computer Applications for BME
%Term: Fall 2022
%J. Crayton Pruitt Family Department of Biomedical Engineering
%University of Florida
%Email: pwanczuk@ufl.edu
%
%This code removes Xray tags/labels from the Xray so that it does not
%interfere with Tumorator and Calcificator functions
function Clean = XrayRemover(Imgn)
Img=imread(Imgn);
Img(1,:)=0;
Img(:, 841:1024)=0;
for j=189:340
    for i=1:265
       Img(i,j)=0;
    end
end
Clean=Img;
end