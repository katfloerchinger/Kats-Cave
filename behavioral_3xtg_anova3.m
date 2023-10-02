%author: Kat

clear all; 
close all hidden; 
clc;

% in general format will be protocol_only/ida_4_young_test#(0-4)

%% 4 Week Treatment (Young 3XTG)

data = readtable('ANOVAN 2_3 way unbalanced, age as factor, all cohorts - Young anova 3.csv'); 
a = 215;

altrate_young = data(:, 2);
altrate_young = table2array(altrate_young);

UStype_young = data(:, 3);
UStype_young = table2array(UStype_young);

idatype_young = data(:, 4);
idatype_young = table2array(idatype_young);

week_young = data(:, 6);
week_young = table2array(week_young);

p_3way_young = anovan(altrate_young(1:a),{UStype_young(1:a) idatype_young(1:a) week_young(1:a)},'continuous',[3],'model',2,'varnames',{'US presence','idazoxan presence','week'})

[p_3way_0,tbl,~] = anovan(altrate_young,{UStype_young idatype_young week_young},"Model",2, ...
    'Varnames',{'US presence','idazoxan presence','week'})


%% 4 Week Treatment (Old 3XTG)

data2 = readtable('ANOVAN 2_3 way unbalanced, age as factor, all cohorts - Old anova 3.csv'); 
a = 190;

altrate_old = data2(:, 2);
altrate_old = table2array(altrate_old);

UStype_old = data2(:, 3);
UStype_old = table2array(UStype_old);

idatype_old = data2(:, 4);
idatype_old = table2array(idatype_old);

week_old = data2(:, 6);
week_old = table2array(week_old);

p_3way_old = anovan(altrate_old(1:a),{UStype_old(1:a) idatype_old(1:a) week_old(1:a)},'continuous',[3],'model',2,'varnames',{'US presence','idazoxan presence','week'})

[p_3way_0,tbl,~] = anovan(altrate_old,{UStype_old idatype_old week_old},"Model",2, ...
    'Varnames',{'US presence','idazoxan presence','week'})