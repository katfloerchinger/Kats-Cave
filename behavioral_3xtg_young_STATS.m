%author: Kat

clear all; close all hidden; clc;

% in general format will be protocol_only/ida_4_young_test#(0-4)

%% 4 Week Treatment (Young 3XTG)
data = readmatrix('4wk Young 3XTG Compiled Tmaze Data - by columns + t tests.csv');

n = 3; % +12 because theres 13 mice in these cohorts
bob_only_4_young_0 = data(n:n+12, 2)';
bob_ida_4_young_0 = data(n:n+12, 4)';
sham_only_4_young_0 = data(n:n+12, 6)';
sham_ida_4_young_0 = data(n:n+12, 8)';

n = 20;
bob_only_4_young_1 = data(n:n+12, 2)';
bob_ida_4_young_1 = data(n:n+12, 4)';
sham_only_4_young_1 = data(n:n+12, 6)';
sham_ida_4_young_1 = data(n:n+12, 8)';

n = 37;
bob_only_4_young_2 = data(n:n+12, 2)';
bob_ida_4_young_2 = data(n:n+12, 4)';
sham_only_4_young_2 = data(n:n+12, 6)';
sham_ida_4_young_2 = data(n:n+12, 8)';

n = 54;
bob_only_4_young_3 = data(n:n+12, 2)';
bob_ida_4_young_3 = data(n:n+12, 4)';
sham_only_4_young_3 = data(n:n+12, 6)';
sham_ida_4_young_3 = data(n:n+12, 8)';

n = 71;
bob_only_4_young_4 = data(n:n+12, 2)';
bob_ida_4_young_4 = data(n:n+12, 4)';
sham_only_4_young_4 = data(n:n+12, 6)';
sham_ida_4_young_4 = data(n:n+12, 8)';

% Plotting 
% Get averages

bob_only_4_young = [mean(bob_only_4_young_0,"omitnan") mean(bob_only_4_young_1,"omitnan") mean(bob_only_4_young_2, "omitnan") mean(bob_only_4_young_3,"omitnan") mean(bob_only_4_young_4,"omitnan")];
bob_ida_4_young = [mean(bob_ida_4_young_0,"omitnan") mean(bob_ida_4_young_1,"omitnan") mean(bob_ida_4_young_2,"omitnan") mean(bob_ida_4_young_3,"omitnan") mean(bob_ida_4_young_4,"omitnan")];
sham_only_4_young = [mean(sham_only_4_young_0,"omitnan") mean(sham_only_4_young_1,"omitnan") mean(sham_only_4_young_2,"omitnan") mean(sham_only_4_young_3,"omitnan") mean(sham_only_4_young_4,"omitnan")];
sham_ida_4_young = [mean(sham_ida_4_young_0,"omitnan") mean(sham_ida_4_young_1,"omitnan") mean(sham_ida_4_young_2,"omitnan") mean(sham_ida_4_young_3,"omitnan") mean(sham_ida_4_young_4,"omitnan")];
% Get default rates for each cohort separately

% Plot against the time from CCI
figure(1)
weeks = [0 1 2 3 4];
plot(weeks,bob_only_4_young,'r-*','MarkerSize', 18);
hold on
plot(weeks,bob_ida_4_young,'b-*','MarkerSize', 18);
plot(weeks,sham_only_4_young, 'g-*','MarkerSize', 18);
plot(weeks,sham_ida_4_young,'m-*','MarkerSize', 18);
hold off
set(gca,'Fontsize',20)
title('Percent Alternation in T-Maze Over Time for 4 Weeks of Treatment in Young 3XTG Mice')
xlabel('Week Since CCI')
ylabel('Alternation Rate (%)')
legend('Bobola Ultrasound Only','Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan', 'location', 'southeast')
grid on

% Statistics for Week 4
stats_4_young = [bob_only_4_young_4; bob_ida_4_young_4; sham_only_4_young_4; sham_ida_4_young_4]';

% p = kruskalwallis(stats_4_young)
% title('Kruskal-Wallis in 4 Week Young Mice')
 
[p_AN,tbl,stats] = anova1(stats_4_young)
title('ANOVA in 4 Week Young Mice')

 
ylabel('Average Percent Alternation')
set(gca,'Fontsize',20)
xlabel('Cohort')
xticklabels({'LIFUS Only','LIFUS + Idazoxan','Sham', 'Idazoxan Only'})
lines = findobj(gcf, 'type', 'line', 'Tag','Median');
xMed = mean(vertcat(lines.XData),2);
yMed = vertcat(lines.YData);
hold on
plot(xMed, yMed, 'ro-') %this one has a circle to mark median

%% STATS FOR WEEK 4
% % Week 4 

% [h,p,ci,stats] = ttest2(x,y)
[h,MWp1,ci1,stats1] = ttest2(bob_only_4_young_4,sham_only_4_young_4,'alpha', 0.05); % 4: Sham only vs Bobola only

[h,MWp2,ci2,stats2] = ttest2(sham_only_4_young_4,sham_ida_4_young_4,'alpha', 0.05); % 4: Sham + ida vs Sham

[h,MWp3,ci3,stats3] = ttest2(bob_ida_4_young_4,sham_only_4_young_4,'alpha', 0.05); % 4: Bobola + ida vs Sham

[h,MWp4,ci4,stats4] = ttest2(bob_only_4_young_4,bob_ida_4_young_4,'alpha', 0.05); % 4: Bobola + ida vs Bobola  

[h,MWp5,ci5,stats5] = ttest2(bob_only_4_young_4,sham_ida_4_young_4,'alpha', 0.05); % 4: Sham + ida vs Bobola

[h,MWp6,ci6,stats6] = ttest2(bob_ida_4_young_4,sham_ida_4_young_4,'alpha', 0.05); % 4: Sham + ida vs Bobola + ida 

means = [mean(bob_only_4_young_4); mean(bob_ida_4_young_4); mean(sham_only_4_young_4,"omitnan"); mean(sham_ida_4_young_4,"omitnan")]';

stats_table(:,1) = ["Sham only vs Bobola only";"Sham + ida vs Sham";"Bobola + ida vs Sham";"Bobola + ida vs Bobola";"Sham + ida vs Bobola";"Sham + ida vs Bobola + ida"];

stats_table(:,2) = [abs(means(3)-means(1));abs(means(4)-means(3));abs(means(2)-means(3));abs(means(2)-means(1));abs(means(4)-means(1));abs(means(4)-means(2));]



% confidence interval 

stats_table(1,3) = [num2str(ci1(1)) ' to ' num2str(ci1(2))]; 
stats_table(2,3) = [num2str(ci2(1)) ' to ' num2str(ci2(2))]; 
stats_table(3,3) = [num2str(ci3(1)) ' to ' num2str(ci3(2))]; 
stats_table(4,3) = [num2str(ci4(1)) ' to ' num2str(ci4(2))]; 
stats_table(5,3) = [num2str(ci5(1)) ' to ' num2str(ci5(2))]; 
stats_table(6,3) = [num2str(ci6(1)) ' to ' num2str(ci6(2))];


% [quantile(means(3)-means(1),[0.95]);quantile(abs(means(4)-means(3),[0.95]));quantile(abs(means(2)-means(3),[0.95]));quantile(abs(means(2)-means(1),[0.95]));quantile(abs(means(4)-means(1),[0.95]));quantile(abs(means(4)-means(2),[0.95]));]

%t-stat

stats1tval = stats1.tstat(1); 
stats2tval = stats2.tstat(1); 
stats3tval = stats3.tstat(1);
stats4tval = stats4.tstat(1);
stats5tval = stats5.tstat(1);
stats6tval = stats6.tstat(1);
stats_table(:,4) = [stats1tval;stats2tval;stats3tval;stats4tval;stats5tval;stats6tval];

stats_table(:,5) = [MWp1;MWp2;MWp3;MWp4;MWp5;MWp6];

stats_table(:,6) = ["no";"no";"no";"no";"yes";"yes"];

stats_table(:,7) = ["ns";"ns";"ns";"ns";"*";"*"];

tbl_stats = array2table(stats_table,"VariableNames", ...
    ["Cohort Pairing: T-Test","Mean Difference", "95 Percent CI","T-Statistic","P-value","Significant?","Summary"])


tbl_stats

means = [mean(bob_only_4_young_4); mean(bob_ida_4_young_4); mean(sham_only_4_young_4,"omitnan"); mean(sham_ida_4_young_4,"omitnan")]';
stats_table2(:,1) = ["Bobola only";"Bobola + ida";"Sham only";"Sham + ida"];

stats_table2(:,2) = [means(1);means(2);means(3);means(4)];

xds1 = datastats(bob_only_4_young_4');
xds2 = datastats(bob_ida_4_young_4');
xds3 = datastats(sham_only_4_young_4(:,1:8)');
xds4 = datastats(sham_ida_4_young_4(:,1:9)');

stats_table2(:,3) = [xds1.num(1);
    xds2.num(1);
    xds3.num(1);
    xds4.num(1)];
stats_table2(:,4) = [xds1.max(1);
    xds2.max(1);
    xds3.max(1);
    xds4.max(1)];
stats_table2(:,5) = [xds1.min(1);
    xds2.min(1);
    xds3.min(1);
    xds4.min(1)];
stats_table2(:,6) = [xds1.median(1);
    xds2.median(1);
    xds3.median(1);
    xds4.median(1)];
stats_table2(:,7) = [xds1.range(1);
    xds2.range(1);
    xds3.range(1);
    xds4.range(1)];
stats_table2(:,8) = [xds1.std(1);
    xds2.std(1);
    xds3.std(1);
    xds4.std(1)];

tbl_stats2 = array2table(stats_table2,"VariableNames", ...
    ["Cohort at Week 4","Mean", "n","Maximum","Minimum","Median","Range","Standard Deviation"])


%% TUKEY STATS

%stats_4_young = [bob_only_4_young_4; bob_ida_4_young_4; sham_only_4_young_4; sham_ida_4_young_4]';
[p_AN,tbl,stats] = anova1(stats_4_young)
c1 = multcompare(stats,"Estimate","row","CriticalValueType","hsd");
tbl1 = array2table(c1,"VariableNames", ...
    ["Group A","Group B","Lower Limit of 95% CI","Mean Difference","Upper Limit of 95% CI","P-value"])



