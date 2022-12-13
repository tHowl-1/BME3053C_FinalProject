% BME 3053C Final Project Table Creation CDD
% 
% Author: Thomas Howland 
% Group Members: Matthew, Paul, Ronin
% Course: BME 3053C Computer Applications for BME 
% Term: Fall 2022 
% J. Crayton Pruitt Family Department of Biomedical Engineering 
% University of Florida 
% Email: thomas.howland@ufl.edu 
% November 26, 2022
%
% Script Description - Preprocesses CDD data by collating datatable

datafilename = 'CDD_CSV_All_Data.csv';
dataTable = readtable(datafilename);
sz = [502, 2];
varTypes = ["double", "string"];
varNames = ["ID", "Class"];
CDDTable = table('size', sz, 'VariableTypes', varTypes, 'VariableNames', varNames);

count = 0;
for i = 1:length(dataTable.Image_name)
    if strcmp(dataTable.Type{i}, 'CESM') && strcmp(dataTable.View{i}, 'MLO')
        count = count + 1;
        CDDTable.ID(count) = count;
        if strcmp(dataTable.Classification{i}, 'Malignant')
            CDDTable.Class(count) = 'M';
        elseif  strcmp(dataTable.Classification{i}, 'Benign')
            CDDTable.Class(count) = 'B';
        else
            CDDTable.Class(count) = 'N';
        end
    end
end

writetable(CDDTable, 'dataset/full/CDD/CDD-Data.csv');