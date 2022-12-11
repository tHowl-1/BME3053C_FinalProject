
function [Bord]=border(imgn)
img=imread(imgn);
I=imsharpen(img,'Amount',50);
se90=strel('line', 6, 90);
se0=strel('line', 6, 0);
Idil=imdilate(I,[se90 se0]);
[~, threshold]=edge(Idil,'sobel');
fudgeFactor=0.8;
Iedge=edge(Idil, 'sobel', threshold*fudgeFactor);
se91=strel('line', 20, 90);
se1=strel('line', 20, 0);
Bord=imdilate(Iedge,[se91 se1]);
end