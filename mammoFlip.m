function flippedIm = mammoFlip(img)
I = imread(img);
I = im2gray(I);
[~,sz] = size(I);
middle = floor(sz/2); 
left_border = I(:,1:middle); 
right_border = I(:,(middle+1):end); 
left_sum = sum(left_border,'all'); 
right_sum = sum(right_border,'all'); 
if left_sum > right_sum
    flippedIm = fliplr(I);
else
    flippedIm = I;
end
end