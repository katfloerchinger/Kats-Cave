%author: Kat

clear all; 
close all hidden; 
clc;

% in general format will be protocol_only/ida_4_young_test#(0-4)

%% 4 Week Treatment (Young 3XTG)

a = 27; % FOR THE 3 COHORTS
% A = 39; % FOR ALL COHORTS
% Week 0
% data0 = readtable('ANOVAN2 way unbalanced, age - Week 0.csv'); % ALL COHORTS
% data0 = readtable('ANOVAN2 way unbalanced, age as factor, SO, SI, BI cohorts - Week 0.csv'); % SO, SI, BI
data0 = readtable('ANOVAN2 way unbalanced, age as factor, SO, SI, BO cohorts - Week 0.csv'); % SO, SI, BO


altrate_0 = data0(:, 2);
altrate_0 = table2array(altrate_0);

UStype_0 = data0(:, 3);
UStype_0 = table2array(UStype_0);

idatype_0 = data0(:, 4);
idatype_0 = table2array(idatype_0);

age_0 = data0(:, 5);

for i = 1:length(idatype_0)
    if  i <= a   
        age_0{i,1} = 1; % 1 represents OLD
    else
        age_0{i,1} = 2; % 2 represents YOUNG
    end
end

age_0 = table2array(age_0);

p_2way_old_0 = anovan(altrate_0(1:a),{UStype_0(1:a) idatype_0(1:a)},'model',1,'varnames',{'US presence in old','idazoxan presence in old'})
p_2way_young_0 = anovan(altrate_0(a+1:length(altrate_0)),{UStype_0(a+1:length(altrate_0)) idatype_0(a+1:length(altrate_0))},'model',1,'varnames',{'US presence in young','idazoxan presence in young'})

[p_3way_0,tbl,~] = anovan(altrate_0,{UStype_0 idatype_0 age_0},"Model",1, ...
    'Varnames',{'US presence','idazoxan presence','age'})

% Week 1
% data1 = readtable('ANOVAN2 way unbalanced, age - Week 1.csv'); % ALL COHORTS
% data1 = readtable('ANOVAN2 way unbalanced, age as factor, SO, SI, BI cohorts - Week 1.csv'); % SO, SI, BI
data1 = readtable('ANOVAN2 way unbalanced, age as factor, SO, SI, BO cohorts - Week 1.csv'); % SO, SI, BO

altrate_1 = data1(:, 2);
altrate_1 = table2array(altrate_1);

UStype_1 = data1(:, 3);
UStype_1 = table2array(UStype_1);

idatype_1 = data1(:, 4);
idatype_1 = table2array(idatype_1);

age_1 = data1(:, 5);

for i = 1:length(idatype_1)
    if  i <= a
        age_1{i,1} = 1; % 1 represents OLD
    else
        age_1{i,1} = 2; % 2 represents YOUNG
    end
end

age_1 = table2array(age_1);

p_2way_old_1 = anovan(altrate_1(1:a),{UStype_1(1:a) idatype_1(1:a)},'model',1,'varnames',{'US presence in old','idazoxan presence in old'})
p_2way_young_1 = anovan(altrate_1(a+1:length(altrate_1)),{UStype_1(a+1:length(altrate_1)) idatype_1(a+1:length(altrate_1))},'model',1,'varnames',{'US presence in young','idazoxan presence in young'})

[p_3way_1,tbl,~] = anovan(altrate_1,{UStype_1 idatype_1 age_1},"Model",1, ...
    'Varnames',{'US presence','idazoxan presence','age'})


% Week 2
% data2 = readtable('ANOVAN2 way unbalanced, age - Week 2.csv'); % ALL COHORTS
% data2 = readtable('ANOVAN2 way unbalanced, age as factor, SO, SI, BI cohorts - Week 2.csv'); % SO, SI, BI
data2 = readtable('ANOVAN2 way unbalanced, age as factor, SO, SI, BO cohorts - Week 2.csv'); % SO, SI, BO

altrate_2 = data2(:, 2);
altrate_2 = table2array(altrate_2);

UStype_2 = data2(:, 3);
UStype_2 = table2array(UStype_2);

idatype_2 = data2(:, 4);
idatype_2 = table2array(idatype_2);

age_2 = data2(:, 5);

for i = 1:length(idatype_2)
    if  i <= a
        age_2{i,1} = 1; % 1 represents OLD
    else
        age_2{i,1} = 2; % 2 represents YOUNG
    end
end

age_2 = table2array(age_2);

p_2way_old_2 = anovan(altrate_2(1:a),{UStype_2(1:a) idatype_2(1:a)},'model',1,'varnames',{'US presence in old','idazoxan presence in old'})
p_2way_young_2 = anovan(altrate_2(a+1:length(altrate_2)),{UStype_2(a+1:length(altrate_2)) idatype_2(a+1:length(altrate_2))},'model',1,'varnames',{'US presence in young','idazoxan presence in young'})

[p_3way_2,tbl,~] = anovan(altrate_2,{UStype_2 idatype_2 age_2},"Model",1, ...
    'Varnames',{'US presence','idazoxan presence','age'})

% Week 3
% data3 = readtable('ANOVAN2 way unbalanced, age - Week 3.csv'); % ALL COHORTS
% data3 = readtable('ANOVAN2 way unbalanced, age as factor, SO, SI, BI cohorts - Week 3.csv'); % SO, SI, BI
data3 = readtable('ANOVAN2 way unbalanced, age as factor, SO, SI, BO cohorts - Week 3.csv'); % SO, SI, BO

altrate_3 = data3(:, 2);
altrate_3 = table2array(altrate_3);

UStype_3 = data3(:, 3);
UStype_3 = table2array(UStype_3);

idatype_3 = data3(:, 4);
idatype_3 = table2array(idatype_3);

age_3 = data3(:, 5);

for i = 1:length(idatype_3)
    if  i <= a
        age_3{i,1} = 1; % 1 represents OLD
    else
        age_3{i,1} = 2; % 2 represents YOUNG
    end
end

age_3 = table2array(age_3);

p_2way_old_3 = anovan(altrate_3(1:a),{UStype_3(1:a) idatype_3(1:a)},'model',1,'varnames',{'US presence in old','idazoxan presence in old'})
p_2way_young_3 = anovan(altrate_3(a+1:length(altrate_3)),{UStype_3(a+1:length(altrate_3)) idatype_3(a+1:length(altrate_3))},'model',1,'varnames',{'US presence in young','idazoxan presence in young'})

[p_3way_3,tbl,~] = anovan(altrate_3,{UStype_3 idatype_3 age_3},"Model",1, ...
    'Varnames',{'US presence','idazoxan presence','age'})

% Week 4
% data4 = readtable('ANOVAN2 way unbalanced, age - Week 4.csv'); % ALL COHORTS
% data4 = readtable('ANOVAN2 way unbalanced, age as factor, SO, SI, BI cohorts - Week 4.csv'); % SO, SI, BI
data4 = readtable('ANOVAN2 way unbalanced, age as factor, SO, SI, BO cohorts - Week 4.csv'); % SO, SI, BO

altrate_4 = data4(:, 2);
altrate_4 = table2array(altrate_4);

UStype_4 = data4(:, 3);
UStype_4 = table2array(UStype_4);

idatype_4 = data4(:, 4);
idatype_4 = table2array(idatype_4);

age_4 = data3(:, 5);

for i = 1:length(idatype_4)
    if  i <= a
        age_4{i,1} = 1; % 1 represents OLD
    else
        age_4{i,1} = 2; % 2 represents YOUNG
    end
end

age_4 = table2array(age_4);

p_2way_old_4 = anovan(altrate_4(1:a),{UStype_4(1:a) idatype_4(1:a)},'model',1,'varnames',{'US presence in old','idazoxan presence in old'})
p_2way_young_4 = anovan(altrate_4(a+1:length(altrate_4)),{UStype_4(a+1:length(altrate_4)) idatype_4(a+1:length(altrate_4))},'model',1,'varnames',{'US presence in young','idazoxan presence in young'})

[p_3way_4,tbl,~] = anovan(altrate_4,{UStype_4 idatype_4 age_4},"Model",1, ...
    'Varnames',{'US presence','idazoxan presence','age'})

[table,chi2,p] = crosstab(UStype_4, idatype_4, age_4)
heatmap(data0,'Drug','USTreatment')




