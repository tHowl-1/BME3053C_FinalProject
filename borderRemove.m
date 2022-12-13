% borderRemove
%
%Author: Paul Wanczuk
%Course: BME 3053C Computer Applications for BME
%Term: Fall 2022
%J. Crayton Pruitt Family Department of Biomedical Engineering
%University of Florida
%Email: pwanczuk@ufl.edu
%
%Removes the outer region of the breast. It takes in the original image and
%the border that is generated in border function.
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