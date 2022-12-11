function fin=borderRemove(Img,Board)
[rows, columns] = size(Img);
for i=1:rows
    for j=1:columns
        if Board(i,j)==1
            Img(i,j)=0;
        end
    end
end
fin=Img;
end