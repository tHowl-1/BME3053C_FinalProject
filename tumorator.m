function tumorId = tumorator(img)
J = imadjust(img);
maxPix = max(J,[],'all');
J(J<maxPix-30) = 0;
se = strel('disk',3);
tumorId = imclose(J,se);
stats = regionprops(J,'Area');
x = [stats.Area];
maxArea = max(x);
minArea = min(x(x>0));
tumorId = imbinarize(tumorId);
tumorId = bwareafilt(tumorId,[minArea+1 maxArea-1]);
end