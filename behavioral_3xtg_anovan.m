%author: Kat

clear all; 
close all hidden; 
clc;

% in general format will be protocol_only/ida_4_young_test#(0-4)

%% 4 Week Treatment (Young 3XTG)
% Week 0
data0 = readtable('ANOVAN2 way unbalanced, age - Week 0.csv');

altrate_0 = data0(1:81, 2);
altrate_0 = table2array(altrate_0);

UStype_0 = data0(1:81, 3);
UStype_0 = table2array(UStype_0);

idatype_0 = data0(1:81, 4);
idatype_0 = table2array(idatype_0);

age_0 = data0(1:81, 5);

for i = 1:81
    if  i <= 39
        age_0{i,1} = 1; % 1 represents OLD
    else
        age_0{i,1} = 2; % 2 represents YOUNG
    end
end

age_0 = table2array(age_0);

p_2way_old_0 = anovan(altrate_0(1:39),{UStype_0(1:39) idatype_0(1:39)},'model',2,'varnames',{'US presence in old','idazoxan presence in old'})
p_2way_young_0 = anovan(altrate_0(40:81),{UStype_0(40:81) idatype_0(40:81)},'model',2,'varnames',{'US presence in young','idazoxan presence in young'})

[p_3way_0,tbl,~] = anovan(altrate_0,{UStype_0 idatype_0 age_0},"Model","interaction", ...
    'Varnames',{'US presence','idazoxan presence','age'})

% Week 1
data1 = readtable('ANOVAN2 way unbalanced, age - Week 1.csv');

altrate_1 = data1(1:81, 2);
altrate_1 = table2array(altrate_1);

UStype_1 = data1(1:81, 3);
UStype_1 = table2array(UStype_1);

idatype_1 = data1(1:81, 4);
idatype_1 = table2array(idatype_1);

age_1 = data1(1:81, 5);

for i = 1:81
    if  i <= 39
        age_1{i,1} = 1; % 1 represents OLD
    else
        age_1{i,1} = 2; % 2 represents YOUNG
    end
end

age_1 = table2array(age_1);

p_2way_old_1 = anovan(altrate_1(1:39),{UStype_1(1:39) idatype_1(1:39)},'model',2,'varnames',{'US presence in old','idazoxan presence in old'})
p_2way_young_1 = anovan(altrate_1(40:81),{UStype_1(40:81) idatype_1(40:81)},'model',2,'varnames',{'US presence in young','idazoxan presence in young'})

[p_3way_1,tbl,~] = anovan(altrate_1,{UStype_1 idatype_1 age_1},"Model","interaction", ...
    'Varnames',{'US presence','idazoxan presence','age'})


% Week 2
data2 = readtable('ANOVAN2 way unbalanced, age - Week 2.csv');

altrate_2 = data2(1:81, 2);
altrate_2 = table2array(altrate_2);

UStype_2 = data2(1:81, 3);
UStype_2 = table2array(UStype_2);

idatype_2 = data2(1:81, 4);
idatype_2 = table2array(idatype_2);

age_2 = data2(1:81, 5);

for i = 1:81
    if  i <= 39
        age_2{i,1} = 1; % 1 represents OLD
    else
        age_2{i,1} = 2; % 2 represents YOUNG
    end
end

age_2 = table2array(age_2);

p_2way_old_2 = anovan(altrate_2(1:39),{UStype_2(1:39) idatype_2(1:39)},'model',2,'varnames',{'US presence in old','idazoxan presence in old'})
p_2way_young_2 = anovan(altrate_2(40:81),{UStype_2(40:81) idatype_2(40:81)},'model',2,'varnames',{'US presence in young','idazoxan presence in young'})

[p_3way_2,tbl,~] = anovan(altrate_2,{UStype_2 idatype_2 age_2},"Model","interaction", ...
    'Varnames',{'US presence','idazoxan presence','age'})

% Week 3
data3 = readtable('ANOVAN2 way unbalanced, age - Week 3.csv');

altrate_3 = data3(1:81, 2);
altrate_3 = table2array(altrate_3);

UStype_3 = data3(1:81, 3);
UStype_3 = table2array(UStype_3);

idatype_3 = data3(1:81, 4);
idatype_3 = table2array(idatype_3);

age_3 = data3(1:81, 5);

for i = 1:81
    if  i <= 39
        age_3{i,1} = 1; % 1 represents OLD
    else
        age_3{i,1} = 2; % 2 represents YOUNG
    end
end

age_3 = table2array(age_3);

p_2way_old_3 = anovan(altrate_3(1:39),{UStype_3(1:39) idatype_3(1:39)},'model',2,'varnames',{'US presence in old','idazoxan presence in old'})
p_2way_young_3 = anovan(altrate_3(40:81),{UStype_3(40:81) idatype_3(40:81)},'model',2,'varnames',{'US presence in young','idazoxan presence in young'})

[p_3way_3,tbl,~] = anovan(altrate_3,{UStype_3 idatype_3 age_3},"Model","interaction", ...
    'Varnames',{'US presence','idazoxan presence','age'})

% Week 4
data4 = readtable('ANOVAN2 way unbalanced, age - Week 4.csv');

altrate_4 = data4(1:81, 2);
altrate_4 = table2array(altrate_4);

UStype_4 = data4(1:81, 3);
UStype_4 = table2array(UStype_4);

idatype_4 = data4(1:81, 4);
idatype_4 = table2array(idatype_4);

age_4 = data3(1:81, 5);

for i = 1:81
    if  i <= 39
        age_4{i,1} = 1; % 1 represents OLD
    else
        age_4{i,1} = 2; % 2 represents YOUNG
    end
end

age_4 = table2array(age_4);

p_2way_old_4 = anovan(altrate_4(1:39),{UStype_4(1:39) idatype_4(1:39)},'model',2,'varnames',{'US presence in old','idazoxan presence in old'})
p_2way_young_4 = anovan(altrate_4(40:81),{UStype_4(40:81) idatype_4(40:81)},'model',2,'varnames',{'US presence in young','idazoxan presence in young'})

[p_3way_4,tbl,~] = anovan(altrate_4,{UStype_4 idatype_4 age_4},"Model","interaction", ...
    'Varnames',{'US presence','idazoxan presence','age'})



