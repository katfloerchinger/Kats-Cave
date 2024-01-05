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
plot(weeks,bob_only_4_young,'-','MarkerSize', 18);
hold on
plot(weeks,bob_ida_4_young,'--','MarkerSize', 18);
plot(weeks,sham_only_4_young, '-.','MarkerSize', 18);
plot(weeks,sham_ida_4_young,':','MarkerSize', 18);
hold off
set(gca,'Fontsize',20)
title('Percent Alternation in T-Maze Over Time for 4 Weeks of Treatment in Young 3XTG Mice')
xlabel('Week Since CCI')
ylabel('Alternation Rate (%)')
legend('Bobola Ultrasound Only','Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan', 'location', 'southeast')
grid on

% Statistics
% each column of stats_4_young is the average percent Alternation for each
% test so there is 4 columns for each cohort, then 5 rows per column for
% each week
stats_4_young = [bob_only_4_young; bob_ida_4_young; sham_only_4_young; sham_ida_4_young]';
p = kruskalwallis(stats_4_young)

title('Kruskal-Wallis in 4 Week Young Mice') 
ylabel('Average Percent Alternation')
set(gca,'Fontsize',20)
xlabel('Cohort')
xticklabels({'Bobola Ultrasound Only','Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})
lines = findobj(gcf, 'type', 'line', 'Tag','Median');
xMed = mean(vertcat(lines.XData),2);
yMed = vertcat(lines.YData);
hold on
plot(xMed, yMed, 'ro-') %this one has a circle to mark median

MWp1_ot = ranksum(stats_4_young(:,1),stats_4_young(:,2)); % pairing 1 Bob only vs Bob + ida 
MWp2_ot = ranksum(stats_4_young(:,1),stats_4_young(:,3)); % pairing 2 Bob only vs Sham only
MWp3_ot = ranksum(stats_4_young(:,1),stats_4_young(:,4)); % pairing 3 Bob only vs Sham + ida 
MWp4_ot = ranksum(stats_4_young(:,2),stats_4_young(:,3)); % pairing 4 Bob + ida vs Sham Only
MWp5_ot = ranksum(stats_4_young(:,2),stats_4_young(:,4)); % pairing 5 Bob + ida vs Sham + ida 
MWp6_ot = ranksum(stats_4_young(:,3),stats_4_young(:,4)); % pairing 6 Sham only vs Sham + ida


%% Boxplots 
% Plot
figure(4);
coordLineStyle = 'k.';
boxplot(stats_4_young,'Symbol', coordLineStyle); 
hold on;
ylim([0 75])

title('Cohort Distributions in 4 Week Treated Young Mice','Fontsize',20)
ylabel('Average Percent Alternation','Fontsize',20)
xlabel('Cohort','Fontsize',20)
xticklabels({'Bobola Ultrasound Only','Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})
parallelcoords(stats_4_young, 'Color', 0.7*[1 1 1], 'LineStyle', '-','Marker', '.', 'MarkerSize', 10);

if MWp1_ot < 0.05
    
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:4);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([1 2]), [1 1]*max(yt)*1.1, '-|k',  mean(xt([1 2])), max(yt)*1.15, '*k')
hold off
end 

if MWp2_ot < 0.05
    
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:4);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([1 3]), [1 1]*max(yt)*1.1, '-|k',  mean(xt([1 3])), max(yt)*1.15, '*k')
hold off
end 

if MWp3_ot < 0.05
    
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:4);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([1 4]), [1 1]*max(yt)*1.1, '-|k',  mean(xt([1 4])), max(yt)*1.15, '*k')
hold off
end 

if MWp4_ot < 0.05
    
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:4);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([2 3]), [1 1]*max(yt)*1.1, '-|k',  mean(xt([2 3])), max(yt)*1.15, '*k')
hold off
end 

if MWp5_ot < 0.05
    
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:4);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([2 4]), [1 1]*max(yt)*1.1, '-|k',  mean(xt([2 4])), max(yt)*1.15, '*k')
hold off
end 

if MWp6_ot  < 0.05
    
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:4);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([3 4]), [1 1]*max(yt)*1.1, '-|k',  mean(xt([3 4])), max(yt)*1.15, '*k')
hold off
end 

ylim([0 90])

% Histograms
young_4wk_0 = [mean(bob_only_4_young_0,"omitnan") mean(bob_ida_4_young_0,"omitnan") mean(sham_only_4_young_0,"omitnan") mean(sham_ida_4_young_0,"omitnan")];
young_4wk_1 = [mean(bob_only_4_young_1,"omitnan") mean(bob_ida_4_young_1,"omitnan") mean(sham_only_4_young_1,"omitnan") mean(sham_ida_4_young_1,"omitnan")];
young_4wk_2 = [mean(bob_only_4_young_2,"omitnan") mean(bob_ida_4_young_2,"omitnan") mean(sham_only_4_young_2,"omitnan") mean(sham_ida_4_young_2,"omitnan")];
young_4wk_3 = [mean(bob_only_4_young_3,"omitnan") mean(bob_ida_4_young_3,"omitnan") mean(sham_only_4_young_3,"omitnan") mean(sham_ida_4_young_3,"omitnan")];
young_4wk_4 = [mean(bob_only_4_young_4,"omitnan") mean(bob_ida_4_young_4,"omitnan") mean(sham_only_4_young_4,"omitnan") mean(sham_ida_4_young_4,"omitnan")];

x = [1 2 3 4 5];
y = [young_4wk_0; young_4wk_1; young_4wk_2; young_4wk_3;young_4wk_4];
figure(5)
b = bar(x,y,'FaceColor','flat');
set(gca,'Fontsize',28)
c1 = 'r';
c2 = 'b';
c3 = 'g';
c4 = 'm';
b(1).FaceColor = c1;
b(2).FaceColor = c2;
b(3).FaceColor = c3;
b(4).FaceColor = c4;
xticklabels({'Pre CCI', '1 Week', '2 Weeks', '3 Weeks', '4 Weeks'})
ylabel('Percent Alternation')
xlabel('Time Since CCI')
title('4 Week Young Mice: Percent Alternation by Cohort Across Time in a T-Maze')
legend('Bobola Ultrasound Only','Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan', 'location', 'northeast')
ylim([0 90])

% Box Chart
% Each matrix is a column of averages for a single week's test. Each matrix
% is a cohort.
bob_only_4_young = [bob_only_4_young_0; bob_only_4_young_1; bob_only_4_young_2; bob_only_4_young_3; bob_only_4_young_4]';
bob_ida_4_young = [bob_ida_4_young_0; bob_ida_4_young_1; bob_ida_4_young_2; bob_ida_4_young_3; bob_ida_4_young_4]';
sham_only_4_young = [sham_only_4_young_0; sham_only_4_young_1; sham_only_4_young_2; sham_only_4_young_3; sham_only_4_young_4]';
sham_ida_4_young = [sham_ida_4_young_0; sham_ida_4_young_1; sham_ida_4_young_2; sham_ida_4_young_3; sham_ida_4_young_4]';

figure(6)
distribution = [bob_only_4_young_0; bob_ida_4_young_0; sham_only_4_young_0; sham_ida_4_young_0;
    bob_only_4_young_1; bob_ida_4_young_1; sham_only_4_young_1; sham_ida_4_young_1;
    bob_only_4_young_2; bob_ida_4_young_2; sham_only_4_young_2; sham_ida_4_young_2;
    bob_only_4_young_3; bob_ida_4_young_3; sham_only_4_young_3; sham_ida_4_young_3;
    bob_only_4_young_4; bob_ida_4_young_4; sham_only_4_young_4; sham_ida_4_young_4]';
n=13 ; xx=(1:20)'; % example 
r=repmat(xx,1,n)'; 
g=r(:)'; 
positions = 1:20; 
boxplot(distribution,g, 'positions', positions); 


% Change the boxplot color from blue to green
a = get(get(gca,'children'),'children');   % Get the handles of all the objects
t = get(a,'Tag');   % List the names of all the objects 

set(gca,'xtick',[mean(positions(1:4)) mean(positions(5:8)) mean(positions(9:12)) mean(positions(13:16)) mean(positions(17:20))]) 
set(gca,'xticklabel',{'0','1','2','3','4'},'Fontsize',28) 

h = findobj(gca,'Tag','Box'); 

% 41-60 Tags are Box
sham_ida = [a(41) a(45) a(49) a(53) a(57)];
sham_only = [a(42) a(46) a(50) a(54) a(58)];
bob_ida = [a(43) a(47) a(51) a(55) a(59)];
bob_only = [a(44) a(48) a(52) a(56) a(60)];


for i = 1:5
patch(get(bob_only(i),'XData'),get(bob_only(i),'YData'),'r','FaceAlpha',.5);
end

for i = 1:5
patch(get(bob_ida(i),'XData'),get(bob_ida(i),'YData'),'b','FaceAlpha',.5);
end

for i = 1:5
patch(get(sham_only(i),'XData'),get(sham_only(i),'YData'),'g','FaceAlpha',.5);
end

for i = 1:5
% set(bob_only, 'Color', 'c1');
patch(get(sham_ida(i),'XData'),get(sham_ida(i),'YData'),'m','FaceAlpha',.5);
end


%  leg = legend;

lgd = legend('Bobola Ultrasound Only','','','','','Bobola US + Idazoxan','','','','','Sham Ultrasound Only','','','','','','Sham Ultrasound + Idazoxan','location','bestoutside');
lgd.AutoUpdate = "off";


title('Distribution of % Alternation in T-Maze for Young 3XTG Mice');
set(gca,'YLim', [0 130]);
xlabel('Weeks Since CCI');
ylabel('Average Alternation Rate');
xline([4.5 8.5 12.5 16.5])

%% STATS FOR WEEK BY WEEK

% Week 0
MWp1 = ranksum(bob_only_4_young_0,sham_only_4_young_0); % PreCCI: Sham only vs Bobola only  
if MWp1 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([1 3]), [1 1]*max(yt)*1.1, '-k',  mean(xt([1 3])), max(yt)*1.15, '*k')
hold off
end 
MWp2 = ranksum(bob_ida_4_young_0,sham_ida_4_young_0); % PreCCI: Sham + ida vs Bobola + ida 
if MWp2 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([1 4]), [1 1]*max(yt)*1.1, '-k',  mean(xt([2 4])), max(yt)*1.15, '*k')
hold off
end 
MWp3 = ranksum(sham_only_4_young_0,sham_ida_4_young_0); % PreCCI: Sham + ida vs Sham
if MWp3 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([3 4]), [1 1]*max(yt)*1.1, '-k',  mean(xt([3 4])), max(yt)*1.15, '*k')
hold off
end
MWp4 = ranksum(bob_only_4_young_0,bob_ida_4_young_0); % PreCCI: Bobola + ida vs Bobola
if MWp4 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([1 2]), [1 1]*max(yt)*1.1, '-k',  mean(xt([1 2])), max(yt)*1.15, '*k')
hold off
end
MWp5 = ranksum(bob_ida_4_young_0,sham_only_4_young_0); % PreCCI: Bobola + ida vs Sham
if MWp5 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([2 3]), [1 1]*max(yt)*1.1, '-k',  mean(xt([2 3])), max(yt)*1.15, '*k')
hold off
end
MWp6 = ranksum(bob_only_4_young_0,sham_ida_4_young_0); % PreCCI: Sham + ida vs Bobola
if MWp6 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([1 4]), [1 1]*max(yt)*1.1, '-k',  mean(xt([1 4])), max(yt)*1.15, '*k')
hold off
end

% Week 1
MWp7 = ranksum(bob_only_4_young_1,sham_only_4_young_1); % 1: Sham only vs Bobola only  
if MWp7 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([5 7]), [1 1]*max(yt)*1.1, '-k',  mean(xt([5 7])), max(yt)*1.15, '*k')
hold off
end 
MWp8 = ranksum(bob_ida_4_young_1,sham_ida_4_young_1); % 1: Sham + ida vs Bobola + ida 
if MWp8 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([6 8]), [1 1]*max(yt)*1.1, '-k',  mean(xt([6 8])), max(yt)*1.15, '*k')
hold off
end 
MWp9 = ranksum(sham_only_4_young_1,sham_ida_4_young_1); % 1: Sham + ida vs Sham
if MWp9 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([7 8]), [1 1]*max(yt)*1.1, '-k',  mean(xt([7 8])), max(yt)*1.15, '*k')
hold off
end
MWp10 = ranksum(bob_only_4_young_1,bob_ida_4_young_1); % 1: Bobola + ida vs Bobola
if MWp10 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([5 6]), [1 1]*max(yt)*1.1, '-k',  mean(xt([5 6])), max(yt)*1.15, '*k')
hold off
end
MWp11 = ranksum(bob_ida_4_young_1,sham_only_4_young_1); % 1: Bobola + ida vs Sham
if MWp11 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([6 7]), [1 1]*80, '-|k',  mean(xt([6 7])), 80, '*k')
hold off
end
MWp12 = ranksum(bob_only_4_young_1,sham_ida_4_young_1); % 1: Sham + ida vs Bobola
if MWp12 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([1 4]), [1 1]*max(yt)*1.1, '-k',  mean(xt([1 4])), max(yt)*1.15, '*k')
hold off
end

% Week 2
MWp13 = ranksum(bob_only_4_young_2,sham_only_4_young_2); % 2: Sham only vs Bobola only  
if MWp13 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([9 11]), [1 1]*max(yt)*1.1, '-k',  mean(xt([9 11])), max(yt)*1.15, '*k')
hold off
end 
MWp14 = ranksum(bob_ida_4_young_2,sham_ida_4_young_2); % 2: Sham + ida vs Bobola + ida 
if MWp14 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([10 12]), [1 1]*max(yt)*1.1, '-|k',  mean(xt([10 12])), max(yt)*1.15, '*k')
hold off
end 
MWp15 = ranksum(sham_only_4_young_2,sham_ida_4_young_2); % 2: Sham + ida vs Sham
if MWp15 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([11 12]), [1 1]*max(yt)*1.1, '-|k',  mean(xt([11 12])), max(yt)*1.15, '*k')
hold off
end
MWp16 = ranksum(bob_only_4_young_2,bob_ida_4_young_2); % 2: Bobola + ida vs Bobola
if MWp16 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([9 10]), [1 1]*max(yt)*1.1, '-k',  mean(xt([9 10])), max(yt)*1.15, '*k')
hold off
end
MWp17 = ranksum(bob_ida_4_young_2,sham_only_4_young_2); % 2: Bobola + ida vs Sham
if MWp17 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([10 11]), 85, '-k',  mean(xt([10 11])), 85, '*k')
hold off
end
MWp18 = ranksum(bob_only_4_young_2,sham_ida_4_young_2); % 2: Sham + ida vs Bobola
if MWp18 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([9 12]), [1 1]*80, '-|k',  mean(xt([9 12])), 80, '*k')
hold off
end

% Week 3
MWp19 = ranksum(bob_only_4_young_3,sham_only_4_young_3); % 3: Sham only vs Bobola only  
if MWp19 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([13 15]), [1 1]*max(yt)*1.1, '-k',  mean(xt([13 15])), max(yt)*1.15, '*k')
hold off
end 
MWp20 = ranksum(bob_ida_4_young_3,sham_ida_4_young_3); % 3: Sham + ida vs Bobola + ida 
if MWp20 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([14 16]), [1 1]*max(yt)*1.1, '-k',  mean(xt([14 16])), max(yt)*1.15, '*k')
hold off
end 
MWp21 = ranksum(sham_only_4_young_3,sham_ida_4_young_3); % 3: Sham + ida vs Sham
if MWp21 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([15 16]), [1 1]*max(yt)*1.1, '-k',  mean(xt([15 16])), max(yt)*1.15, '*k')
hold off
end
MWp22 = ranksum(bob_only_4_young_3,bob_ida_4_young_3); % 3: Bobola + ida vs Bobola
if MWp22 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([13 14]), [1 1]*max(yt)*1.1, '-k',  mean(xt([13 14])), max(yt)*1.15, '*k')
hold off
end
MWp23 = ranksum(bob_ida_4_young_3,sham_only_4_young_3); % 3: Bobola + ida vs Sham
if MWp23 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([14 15]), [1 1]*max(yt)*1.1, '-k',  mean(xt([14 15])), max(yt)*1.15, '*k')
hold off
end
MWp24 = ranksum(bob_only_4_young_3,sham_ida_4_young_3); % 3: Sham + ida vs Bobola
if MWp24 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([13 16]), [1 1]*max(yt)*1.1, '-k',  mean(xt([13 16])), max(yt)*1.15, '*k')
hold off
end

% Week 4
MWp25 = ranksum(bob_only_4_young_4,sham_only_4_young_4); % 4: Sham only vs Bobola only  
if MWp25 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([17 19]), [1 1]*max(yt)*1.1, '-k',  mean(xt([17 19])), max(yt)*1.15, '*k')
hold off
end 
MWp26 = ranksum(bob_ida_4_young_4,sham_ida_4_young_4); % 4: Sham + ida vs Bobola + ida 
if MWp26 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([18 20]), [1 1]*80, '-|k',  mean(xt([18 20])), 80, '*k')
hold off
end 
MWp27 = ranksum(sham_only_4_young_4,sham_ida_4_young_4); % 4: Sham + ida vs Sham
if MWp27 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([19 20]), [1 1]*max(yt)*1.1, '-k',  mean(xt([19 20])), max(yt)*1.15, '*k')
hold off
end
MWp28 = ranksum(bob_only_4_young_4,bob_ida_4_young_4); % 4: Bobola + ida vs Bobola
if MWp28 < 0.05 
yt = get(gca, 'YTick');
%set(gca, 'Xtick', 1:20);
xticks(1:20)
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([17 18]), [1 1]*max(yt)*1.1, '-k',  mean(xt([17 18])), max(yt)*1.15, '*k')
hold off
end
MWp29 = ranksum(bob_ida_4_young_3,sham_only_4_young_3); % 4: Bobola + ida vs Sham
if MWp29 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([18 19]), [1 1]*max(yt)*1.1, '-k',  mean(xt([18 19])), max(yt)*1.15, '*k')
hold off
end
MWp30 = ranksum(bob_only_4_young_4,sham_ida_4_young_4); % 4: Sham + ida vs Bobola
if MWp30 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*0.8)])
xt = get(gca, 'XTick');
hold on
plot(xt([13 16]), 85, '-k',  mean(xt([13 16])), 85, '*k')
hold off
end


set(gca,'xtick',[mean(positions(1:4)) mean(positions(5:8)) mean(positions(9:12)) mean(positions(13:16)) mean(positions(17:20))]) 
set(gca,'xticklabel',{'0','1','2','3','4'},'Fontsize',28) 
ylim([0 105])
% xlim([16.5 20.5])


% WEEK 0
% data = [bob_ida_4_young_0; sham_only_4_young_0; sham_ida_4_young_0]';
% [p_kw,tbl,stats] = kruskalwallis(data);
% title('Kruskal-Wallis Across Cohorts at Week 0') 
% ylabel('Average Percent Alternation')
% set(gca,'Fontsize',20)
% xlabel('Cohort')
% xticklabels({'Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})
% [p_AN,tbl,stats] = anova1(data)
% % p = anovan(data,{org when},'model',2,'varnames',{'origin','mfg date'})
% title('Distribution at Week 0') 
% ylabel('Average Percent Alternation')
% set(gca,'Fontsize',20)
% xlabel('Cohort')
% xticklabels({'Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})

% data = [bob_only_4_young_0; bob_ida_4_young_0; sham_only_4_young_0; sham_ida_4_young_0]';
% [p_kw,tbl,stats] = kruskalwallis(data);
% title('Kruskal-Wallis Across Cohorts at Week 0') 
% ylabel('Average Percent Alternation')
% set(gca,'Fontsize',20)
% xlabel('Cohort')
% xticklabels({'Bobola Ultrasound Only' 'Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})
% [p_AN,tbl,stats] = anova1(data)
% % p = anovan(data,{org when},'model',2,'varnames',{'origin','mfg date'})
% title('Distribution at Week 0') 
% ylabel('Average Percent Alternation')
% set(gca,'Fontsize',20)
% xlabel('Cohort')
% xticklabels({'Bobola Ultrasound Only' 'Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})

% data = [bob_only_4_young_0; sham_only_4_young_0; sham_ida_4_young_0]';
% [p_kw,tbl,stats] = kruskalwallis(data);
% title('Kruskal-Wallis Across Cohorts at Week 0') 
% ylabel('Average Percent Alternation')
% set(gca,'Fontsize',20)
% xlabel('Cohort')
% xticklabels({'Bobola Ultrasound Only','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})
% [p_AN,tbl,stats] = anova1(data)
% % p = anovan(data,{org when},'model',2,'varnames',{'origin','mfg date'})
% title('ANOVA 1-Way Across Cohorts at Week 0') 
% ylabel('Average Percent Alternation')
% set(gca,'Fontsize',20)
% xlabel('Cohort')
% xticklabels({'Bobola Ultrasound Only','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})

% WEEK 1
% data = [bob_ida_4_young_1; sham_only_4_young_1; sham_ida_4_young_1]';
% [p_kw,tbl,stats] = kruskalwallis(data);
% title('Kruskal-Wallis Across Cohorts at Week 1') 
% ylabel('Average Percent Alternation')
% set(gca,'Fontsize',20)
% xlabel('Cohort')
% xticklabels({'Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})
% [p_AN,tbl,stats] = anova1(data)
% % p = anovan(data,{org when},'model',2,'varnames',{'origin','mfg date'})
% title('ANOVA 1-Way Across Cohorts at Week 1') 
% ylabel('Average Percent Alternation')
% set(gca,'Fontsize',20)
% xlabel('Cohort')
% xticklabels({'Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})

% data = [bob_only_4_young_1; bob_ida_4_young_1; sham_only_4_young_1; sham_ida_4_young_1]';
% [p_kw,tbl,stats] = kruskalwallis(data);
% title('Kruskal-Wallis Across Cohorts at Week 1') 
% ylabel('Average Percent Alternation')
% set(gca,'Fontsize',20)
% xlabel('Cohort')
% xticklabels({'Bobola Ultrasound Only' 'Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})
% [p_AN,tbl,stats] = anova1(data)
% % p = anovan(data,{org when},'model',2,'varnames',{'origin','mfg date'})
% title('Distribution at Week 1') 
% ylabel('Average Percent Alternation')
% set(gca,'Fontsize',20)
% xlabel('Cohort')
% xticklabels({'Bobola Ultrasound Only' 'Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})

% data = [bob_only_4_young_1; sham_only_4_young_1; sham_ida_4_young_1]';
% [p_kw,tbl,stats] = kruskalwallis(data);
% title('Kruskal-Wallis Across Cohorts at Week 1') 
% ylabel('Average Percent Alternation')
% set(gca,'Fontsize',20)
% xlabel('Cohort')
% xticklabels({'Bobola Ultrasound Only','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})
% [p_AN,tbl,stats] = anova1(data)
% % p = anovan(data,{org when},'model',2,'varnames',{'origin','mfg date'})
% title('ANOVA 1-Way Across Cohorts at Week 1') 
% ylabel('Average Percent Alternation')
% set(gca,'Fontsize',20)
% xlabel('Cohort')
% xticklabels({'Bobola Ultrasound Only','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})

% WEEK 2
% data = [bob_ida_4_young_2; sham_only_4_young_2; sham_ida_4_young_2]';
% [p_kw,tbl,stats] = kruskalwallis(data);
% title('Kruskal-Wallis Across Cohorts at Week 2') 
% ylabel('Average Percent Alternation')
% set(gca,'Fontsize',20)
% xlabel('Cohort')
% xticklabels({'Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})
% [p_AN,tbl,stats] = anova1(data)
% % p = anovan(data,{org when},'model',2,'varnames',{'origin','mfg date'})
% title('ANOVA 1-Way Across Cohorts at Week 2') 
% ylabel('Average Percent Alternation')
% set(gca,'Fontsize',20)
% xlabel('Cohort')
% xticklabels({'Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})

% data = [bob_only_4_young_2; bob_ida_4_young_2; sham_only_4_young_2; sham_ida_4_young_2]';
% [p_kw,tbl,stats] = kruskalwallis(data);
% title('Kruskal-Wallis Across Cohorts at Week 2') 
% ylabel('Average Percent Alternation')
% set(gca,'Fontsize',20)
% xlabel('Cohort')
% xticklabels({'Bobola Ultrasound Only' 'Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})
% [p_AN,tbl,stats] = anova1(data)
% % p = anovan(data,{org when},'model',2,'varnames',{'origin','mfg date'})
% title('Distribution at Week 2') 
% ylabel('Average Percent Alternation')
% set(gca,'Fontsize',20)
% xlabel('Cohort')
% xticklabels({'Bobola Ultrasound Only' 'Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})

% data = [bob_only_4_young_2; sham_only_4_young_2; sham_ida_4_young_2]';
% [p_kw,tbl,stats] = kruskalwallis(data);
% title('Kruskal-Wallis Across Cohorts at Week 2') 
% ylabel('Average Percent Alternation')
% set(gca,'Fontsize',20)
% xlabel('Cohort')
% xticklabels({'Bobola Ultrasound Only','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})
% [p_AN,tbl,stats] = anova1(data)
% % p = anovan(data,{org when},'model',2,'varnames',{'origin','mfg date'})
% title('ANOVA 1-Way Across Cohorts at Week 2') 
% ylabel('Average Percent Alternation')
% set(gca,'Fontsize',20)
% xlabel('Cohort')
% xticklabels({'Bobola Ultrasound Only','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})

% WEEK 3
% data = [bob_ida_4_young_3; sham_only_4_young_3; sham_ida_4_young_3]';
% [p_kw,tbl,stats] = kruskalwallis(data);
% title('Kruskal-Wallis Across Cohorts at Week 3') 
% ylabel('Average Percent Alternation')
% set(gca,'Fontsize',20)
% xlabel('Cohort')
% xticklabels({'Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})
% [p_AN,tbl,stats] = anova1(data)
% % p = anovan(data,{org when},'model',2,'varnames',{'origin','mfg date'})
% title('ANOVA 1-Way Across Cohorts at Week 3') 
% ylabel('Average Percent Alternation')
% set(gca,'Fontsize',20)
% xlabel('Cohort')
% xticklabels({'Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})

data = [bob_only_4_young_3; bob_ida_4_young_3; sham_only_4_young_3; sham_ida_4_young_3]';
[p_kw,tbl,stats] = kruskalwallis(data);
title('Kruskal-Wallis Across Cohorts at Week 3') 
ylabel('Average Percent Alternation')
set(gca,'Fontsize',20)
xlabel('Cohort')
xticklabels({'Bobola Ultrasound Only' 'Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})
[p_AN,tbl,stats] = anova1(data)
% p = anovan(data,{org when},'model',2,'varnames',{'origin','mfg date'})
title('Distribution at Week 3') 
ylabel('Average Percent Alternation')
set(gca,'Fontsize',20)
xlabel('Cohort')
xticklabels({'Bobola Ultrasound Only' 'Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})

% data = [bob_only_4_young_3; sham_only_4_young_3; sham_ida_4_young_3]';
% [p_kw,tbl,stats] = kruskalwallis(data);
% title('Kruskal-Wallis Across Cohorts at Week 3') 
% ylabel('Average Percent Alternation')
% set(gca,'Fontsize',20)
% xlabel('Cohort')
% xticklabels({'Bobola Ultrasound Only','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})
% [p_AN,tbl,stats] = anova1(data)
% % p = anovan(data,{org when},'model',2,'varnames',{'origin','mfg date'})
% title('ANOVA 1-Way Across Cohorts at Week 3') 
% ylabel('Average Percent Alternation')
% set(gca,'Fontsize',20)
% xlabel('Cohort')
% xticklabels({'Bobola Ultrasound Only','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})

% WEEK 4
% data = [bob_ida_4_young_4; sham_only_4_young_4; sham_ida_4_young_4]';
% [p_kw,tbl,stats] = kruskalwallis(data);
% title('Kruskal-Wallis Across Cohorts at Week 4') 
% ylabel('Average Percent Alternation')
% set(gca,'Fontsize',20)
% xlabel('Cohort')
% xticklabels({'Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})
% [p_AN,tbl,stats] = anova1(data)
% % p = anovan(data,{org when},'model',2,'varnames',{'origin','mfg date'})
% title('ANOVA 1-Way Across Cohorts at Week 4') 
% ylabel('Average Percent Alternation')
% set(gca,'Fontsize',20)
% xlabel('Cohort')
% xticklabels({'Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})

data = [bob_only_4_young_4; bob_ida_4_young_4; sham_only_4_young_4; sham_ida_4_young_4]';
[p_kw,tbl,stats] = kruskalwallis(data);
title('Kruskal-Wallis Across Cohorts at Week 4') 
ylabel('Average Percent Alternation')
set(gca,'Fontsize',20)
xlabel('Cohort')
xticklabels({'Bobola Ultrasound Only' 'Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})
[p_AN,tbl,stats] = anova1(data)
% p = anovan(data,{org when},'model',2,'varnames',{'origin','mfg date'})
title('Distribution at Week 4') 
ylabel('Average Percent Alternation')
set(gca,'Fontsize',20)
xlabel('Cohort')
xticklabels({'Bobola Ultrasound Only' 'Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})

data = [bob_only_4_young_4; sham_only_4_young_4; sham_ida_4_young_4]';
[p_kw,tbl,stats] = kruskalwallis(data);
title('Kruskal-Wallis Across Cohorts at Week 4') 
ylabel('Average Percent Alternation')
set(gca,'Fontsize',20)
xlabel('Cohort')
xticklabels({'Bobola Ultrasound Only','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})
[p_AN,tbl,stats] = anova1(data)
% p = anovan(data,{org when},'model',2,'varnames',{'origin','mfg date'})
title('ANOVA 1-Way Across Cohorts at Week 4') 
ylabel('Average Percent Alternation')
set(gca,'Fontsize',20)
xlabel('Cohort')
xticklabels({'Bobola Ultrasound Only','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})

% a = ([MWp1 MWp2 MWp3 MWp4 MWp5 MWp6])'; 
% a = ([MWp7 MWp8 MWp9 MWp10 MWp11 MWp12])'; 
% a = ([MWp13 MWp14 MWp15 MWp16 MWp17 MWp18])'; 
% a = ([MWp19 MWp20 MWp21 MWp22 MWp23 MWp24])'; 
a = ([MWp25 MWp26 MWp27 MWp28 MWp29 MWp30])'; 
Pairing = {'Sham only vs Bobola only';'Sham + ida vs Bobola + ida';'Sham + ida vs Sham';'Bobola + ida vs Bobola';'Bobola + ida vs Sham';'Sham + ida vs Bobola'};
myTable = table(Pairing,a,'VariableNames',{'Cohort Pairing','MW P-Value'})


% Get the table in string form to output table as a figure
TString = evalc('disp(myTable)');
% Use TeX Markup for bold formatting and underscores.
TString = strrep(TString,'<strong>','\bf');
TString = strrep(TString,'</strong>','\rm');
TString = strrep(TString,'_','\_');
% Get a fixed-width font.
FixedWidth = get(0,'FixedWidthFontName');
% Output the table using the annotation command.
figure(12)
annotation(gcf,'Textbox','String',TString,'Interpreter','Tex','FontName', ...
    FixedWidth,'Units','Normalized','Position',[0 0 1 1]);

%% ADDITIONAL MW PAIRINGS

figure(6)
weeksMWp1 = ranksum(bob_only_4_young_0,bob_only_4_young_4); % Bobola only week 0 vs Bobola only week 4 
if weeksMWp1 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([1 17]), [1 1]*85, '-|k',  mean(xt([1 17])), 85, '*k')
hold off
end 

weeksMWp2 = ranksum(bob_ida_4_young_0,bob_ida_4_young_4); % Bobola ida week 0 vs Bobola ida week 4 
if weeksMWp2 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([2 18]), [1 1]*85, '-|k',  mean(xt([2 18])), 85, '*k')
hold off
end 

weeksMWp3 = ranksum(sham_only_4_young_0,sham_only_4_young_4); %  Sham only week 0 vs Sham only week 4 
if weeksMWp3 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([3 19]), [1 1]*83, '-|k',  mean(xt([3 19])), 83, '*k')
hold off
end 

weeksMWp4 = ranksum(sham_ida_4_young_0,sham_ida_4_young_4); %  Sham ida week 0 vs Sham ida week 4 
if weeksMWp4 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([4 20]), [1 1]*86, '-|k',  mean(xt([4 20])), 86, '*k')
hold off
end 

weeksMWp5 = ranksum(bob_only_4_young_1,bob_only_4_young_4); %  bobola week 1 vs bobola week 4 

weeksMWp6 = ranksum(bob_ida_4_young_1,bob_ida_4_young_4); %  bob ida week 1 vs bob ida week 4 

weeksMWp7 = ranksum(sham_only_4_young_1,sham_only_4_young_4); %  sham week 1 vs sham week 4 

weeksMWp8 = ranksum(sham_ida_4_young_1,sham_ida_4_young_4); %  sham ida week 1 vs sham ida week 4 

weeksMWp9 = ranksum(bob_only_4_young_0,bob_only_4_young_1); %  bobola week 0 vs bobola week 1

weeksMWp10 = ranksum(bob_ida_4_young_0,bob_ida_4_young_1); %  bob ida week 0 vs bob ida week 1 

weeksMWp11 = ranksum(sham_only_4_young_0,sham_only_4_young_1); %  sham week 0 vs sham week 1
if weeksMWp11 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([3 7]), [1 1]*87, '-|k',  mean(xt([3 7])), 87, '*k')
hold off
end
weeksMWp12 = ranksum(sham_ida_4_young_0,sham_ida_4_young_1); %  sham ida week 0 vs sham ida week 1



set(gca,'xtick',[mean(positions(1:4)) mean(positions(5:8)) mean(positions(9:12)) mean(positions(13:16)) mean(positions(17:20))]) 
set(gca,'xticklabel',{'0','1','2','3','4'},'Fontsize',28) 
ylim([0 105])
% xlim([16.5 20.5])


a = ([weeksMWp1 weeksMWp2 weeksMWp3 weeksMWp4 weeksMWp5 weeksMWp6 weeksMWp7 weeksMWp8 weeksMWp9 weeksMWp10 weeksMWp11 weeksMWp12])'; 
Pairing = {'Bobola only at Week 0 vs Week 4';'Bobola + ida at Week 0 vs Week 4';'Sham at Week 0 vs Week 4';'Sham + ida at Week 0 vs Week 4';'Bobola only at Week 1 vs Week 4';'Bobola + ida at Week 1 vs Week 4';
    'Sham at Week 1 vs Week 4';'Sham + ida at Week 1 vs Week 4';'Bobola only at Week 0 vs Week 1';'Bobola + ida at Week 0 vs Week 1';'Sham at Week 0 vs Week 1';'Sham + ida at Week 0 vs Week 1'};
myTable = table(Pairing,a,'VariableNames',{'Cohort Pairing','MW P-Value'})


% Get the table in string form to output table as a figure
TString = evalc('disp(myTable)');
% Use TeX Markup for bold formatting and underscores.
TString = strrep(TString,'<strong>','\bf');
TString = strrep(TString,'</strong>','\rm');
TString = strrep(TString,'_','\_');
% Get a fixed-width font.
FixedWidth = get(0,'FixedWidthFontName');
% Output the table using the annotation command.
figure(13)
annotation(gcf,'Textbox','String',TString,'Interpreter','Tex','FontName', ...
    FixedWidth,'Units','Normalized','Position',[0 0 1 1]);
% 
figure(10)
