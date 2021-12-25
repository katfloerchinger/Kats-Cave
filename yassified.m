%author: Kat Floerchinger
%First personal project or whatevaaaa 
%This script is the first and is only to see if I can get data from an
%excel sheet

%%Calling the sheet
folder = '/Users/laurieryan/MATLAB/Personal Projects/funkyjazzy2022 github/Spreadsheets/';
filename = [folder 'SampleDataforYassified.xlsx'];
xlRange = 'A1:C10';
[num,txt,raw] = xlsread(filename,xlRange);
T = table(raw);
uitable('Data',T{:,:},'ColumnName',T.Properties.VariableNames,...
    'RowName',T.Properties.RowNames,'Units', 'Normalized', 'Position',[0, 0, 1, 1]);

\