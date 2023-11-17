%author: Kat

clear all; 
close all hidden; 
clc;

% in general format will be protocol_only/ida_4_young_test#(0-4)

%% 4 Week Treatment (Young 3XTG)

% Week 0
% data0 = readtable('3 week treated old 3xtg for ANOVAN2 - week 0 bob group.csv'); 
data0 = readtable('3 week treated old 3xtg for ANOVAN2 - week 0 chi group.csv'); 


altrate_0 = data0(:, 2);
altrate_0 = table2array(altrate_0);

UStype_0 = data0(:, 3);
UStype_0 = table2array(UStype_0);

idatype_0 = data0(:, 4);
idatype_0 = table2array(idatype_0);

p_2way_0 = anovan(altrate_0,{UStype_0 idatype_0},'model',2,'varnames',{'US presence','idazoxan presence'})

% Week 1
% data1 = readtable('3 week treated old 3xtg for ANOVAN2 - week 1 bob group.csv'); 
data1 = readtable('3 week treated old 3xtg for ANOVAN2 - week 1 chi group.csv'); 


altrate_1 = data1(:, 2);
altrate_1 = table2array(altrate_1);

UStype_1 = data1(:, 3);
UStype_1 = table2array(UStype_1);

idatype_1 = data1(:, 4);
idatype_1 = table2array(idatype_1);

p_2way_1 = anovan(altrate_1,{UStype_1 idatype_1},'model',2,'varnames',{'US presence','idazoxan presence'})

% Week 2
% data2 = readtable('3 week treated old 3xtg for ANOVAN2 - week 2 bob group.csv'); 
data2 = readtable('3 week treated old 3xtg for ANOVAN2 - week 2 chi group.csv'); 


altrate_2 = data2(:, 2);
altrate_2 = table2array(altrate_2);

UStype_2 = data2(:, 3);
UStype_2 = table2array(UStype_2);

idatype_2 = data2(:, 4);
idatype_2 = table2array(idatype_2);

p_2way_2 = anovan(altrate_2,{UStype_2 idatype_2},'model',2,'varnames',{'US presence','idazoxan presence'})

% Week 3
data3 = readtable('3 week treated old 3xtg for ANOVAN2 - week 3 bob group.csv'); 
% data3 = readtable('3 week treated old 3xtg for ANOVAN2 - week 3 chi group.csv'); 


altrate_3 = data3(:, 2);
altrate_3 = table2array(altrate_3);

UStype_3 = data3(:, 3);
UStype_3 = table2array(UStype_3);

idatype_3 = data3(:, 4);
idatype_3 = table2array(idatype_3);

p_2way_3 = anovan(altrate_3,{UStype_3 idatype_3},'model',2,'varnames',{'US presence','idazoxan presence'})



