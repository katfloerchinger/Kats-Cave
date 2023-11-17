clear all; 
close all hidden; 
clc;

% No drug:Sham vs. No drug:FUS
% Sham only vs US only

data4 = readtable('ANOVAN2 way unbalanced, age - Week 4.csv');

week_4 = data4(39:end,:);

% alt rates
sham_only4 = week_4(27:34, 2);
sham_only = table2array(sham_only4);

US_only4 = week_4(1:13, 2);
US_only = table2array(US_only4);

sham_ida4 = week_4(35:43, 2);
sham_ida = table2array(sham_ida4);

US_ida4 = week_4(14:26, 2);
US_ida = table2array(US_ida4);

[p1,h,stats] = ranksum(sham_only,US_only)
[p2,h,stats] = ranksum(sham_only,sham_ida)
[p3,h,stats] = ranksum(sham_only,US_ida)
[p4,h,stats] = ranksum(US_only,sham_ida)
[p5,h,stats] = ranksum(US_only,US_ida)
[p6,h,stats] = ranksum(US_ida,sham_ida)

sham_only4_old = data4(23:30, 2);
sham_only_old = table2array(sham_only4_old);


[p7,h,stats] = ranksum(sham_only,sham_only_old)


data0 = readtable('ANOVAN2 way unbalanced, age - Week 0.csv');

week_0 = data0(39:end,:);

sham_only0 = week_0(27:34, 2);
sham_only0 = table2array(sham_only0);

sham_only0_old = data0(23:30, 2);
sham_only_old0 = table2array(sham_only0_old);

[p8,h,stats] = ranksum(sham_only0,sham_only_old0)

[p9,h,stats] = ranksum(sham_only0,sham_only)
[p91,h,stats] = ranksum(sham_only_old0,sham_only_old)
