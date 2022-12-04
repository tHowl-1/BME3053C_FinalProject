function [Border]=borderRemove(imgn)
img=imread(imgn);
I=imsharpen(img,'Amount',50);
se90=strel('line', 6, 90);
se0=strel('line', 6, 0);
Idil=imdilate(I,[se90 se0]);
[~, threshold]=edge(Idil,'sobel');
fudgeFactor=0.8;
Iedge=edge(Idil, 'sobel', threshold*fudgeFactor);
Idil2=imdilate(Iedge,[se90 se0]);
%imshow(Idil2);
Borders=bwareaopen(Idil2,100);
Borders(Borders>100)=1;
Border=[];
for i=1:length(I)
    if Borders(i)==1
        Border=[Border i];
    end
end
end