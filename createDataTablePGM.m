% BME 3053C Final Project Table Creation PGM
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
% Script Description - Preprocesses PGM data by collating datatable

datafilename = 'annotations.txt';
datafile = readtable(datafilename);

sz = [322, 2];
varTypes = ["double", "string"];
varNames = ["ID", "Class"];
PGMTable = table('size', sz, 'VariableTypes', varTypes, 'VariableNames', varNames);

previousRow = [];
count = 0;
for i = 1:length(datafile.TITLE)
    parsedRow =  split(datafile.TITLE{i}, ' ');
    if ~isempty(previousRow)
        if strcmp(previousRow{1}, parsedRow{1})
            continue;
        end
    end
    count = count + 1;
    PGMTable.ID(count) = count;
    if length(parsedRow) > 3
        PGMTable.Class{count} = parsedRow{4};
    else
        PGMTable.Class{count} = 'N';
    end
    previousRow = parsedRow;
end

writetable(PGMTable, 'dataset/full/mias/mias-Data.csv');