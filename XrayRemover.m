function Clean = XrayRemover(Imgn)
Img=imread(Imgn);
Img(1,:)=0;
sum=0;
binary_Img=Img>40;
for j=189:1024
    for i=1:1024
        if Img(i,j)<10
        sum=sum+1;
        end
    end
    if sum>=1000
        border=j;
        break;
    end
    sum=0;
end
Img(:,189:j)=0;
Clean=Img;
end