%author: Kat Floerchinger
%First personal project or whatevaaaa 
%This script is the first and is only to see if I can get data from an
%excel sheet
clear all; close all; clc;
%% Calling the sheet
% folder = '/Users/laurieryan/MATLAB/Personal Projects/funkyjazzy2022 github/Spreadsheets/';
% filename = [folder 'SampleDataforYassified.xlsx'];
% xlRange = 'A1:C10';
% [num,txt,raw] = xlsread(filename,xlRange);
% T = table(raw);
% uitable('Data',T{:,:},'ColumnName',T.Properties.VariableNames,...
%     'RowName',T.Properties.RowNames,'Units', 'Normalized', 'Position',[0, 0, 1, 1]);
%% Trying to make a cool figure
a = [1.23, 2.34, 5.55, 7, 13.21, 15.66, 18, 20];
x = 1:size(a,2);
figure('Name', 'Simple plot', 'NumberTitle', 'off');
h=plot(x, a, '-o');
hold on                             % Plot additional information
plot(x(3), a(3), 'pr')              % Plot the point in red
plot([x(3); x(3)], ylim, '-r')      % Plot the vertical line in red
hold off                            % Stop adding plotted data
xlabel('test');
ylabel('test');