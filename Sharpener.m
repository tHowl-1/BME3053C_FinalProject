function finish2=Sharpener(Imgn)
Img=imread(Imgn);
filt=imgaussfilt(Img,10);
sub=Img-filt;
sharp=Img+sub;
finish=uint8(255*mat2gray(sharp));
fry=uint8(255*mat2gray(Img));
frit=imgaussfilt(fry,8);
sub2=fry-frit;
sharp2=fry+sub2;
finish2=uint8(255*mat2gray(sharp2));
end

