%author: Kat

clear all; close all; clc;

% in general format will be protocol_only/ida_4_old_test#(0-4)

%% 4 Week Treatment (Old 3XTG)
data = readmatrix('4wk old 3XTG Compiled Tmaze Data - by columns + t tests.csv');

n = 3; % +10 because theres 11 mice in these cohorts
bob_only_4_old_0 = data(n:n+10, 2)';
bob_ida_4_old_0 = data(n:n+10, 4)';
sham_only_4_old_0 = data(n:n+10, 6)';
sham_ida_4_old_0 = data(n:n+10, 8)';

n = 18;
bob_only_4_old_1 = data(n:n+10, 2)';
bob_ida_4_old_1 = data(n:n+10, 4)';
sham_only_4_old_1 = data(n:n+10, 6)';
sham_ida_4_old_1 = data(n:n+10, 8)';

n = 33;
bob_only_4_old_2 = data(n:n+10, 2)';
bob_ida_4_old_2 = data(n:n+10, 4)';
sham_only_4_old_2 = data(n:n+10, 6)';
sham_ida_4_old_2 = data(n:n+10, 8)';

n = 48;
bob_only_4_old_3 = data(n:n+10, 2)';
bob_ida_4_old_3 = data(n:n+10, 4)';
sham_only_4_old_3 = data(n:n+10, 6)';
sham_ida_4_old_3 = data(n:n+10, 8)';

n = 63;
bob_only_4_old_4 = data(n:n+10, 2)';
bob_ida_4_old_4 = data(n:n+10, 4)';
sham_only_4_old_4 = data(n:n+10, 6)';
sham_ida_4_old_4 = data(n:n+10, 8)';

% Plotting 
% Get averages

bob_only_4_old = [mean(bob_only_4_old_0,"omitnan") mean(bob_only_4_old_1,"omitnan") mean(bob_only_4_old_2, "omitnan") mean(bob_only_4_old_3,"omitnan") mean(bob_only_4_old_4,"omitnan")];
bob_ida_4_old = [mean(bob_ida_4_old_0,"omitnan") mean(bob_ida_4_old_1,"omitnan") mean(bob_ida_4_old_2,"omitnan") mean(bob_ida_4_old_3,"omitnan") mean(bob_ida_4_old_4,"omitnan")];
sham_only_4_old = [mean(sham_only_4_old_0,"omitnan") mean(sham_only_4_old_1,"omitnan") mean(sham_only_4_old_2,"omitnan") mean(sham_only_4_old_3,"omitnan") mean(sham_only_4_old_4,"omitnan")];
sham_ida_4_old = [mean(sham_ida_4_old_0,"omitnan") mean(sham_ida_4_old_1,"omitnan") mean(sham_ida_4_old_2,"omitnan") mean(sham_ida_4_old_3,"omitnan") mean(sham_ida_4_old_4,"omitnan")];

% Plot against the time from CCI
figure(1)
weeks = [0 1 2 3 4];
plot(weeks,bob_only_4_old,'r-*','MarkerSize', 18);
hold on
plot(weeks,bob_ida_4_old,'b-*','MarkerSize', 18);
plot(weeks,sham_only_4_old, 'g-*','MarkerSize', 18);
plot(weeks,sham_ida_4_old,'m-*','MarkerSize', 18);
hold off
set(gca,'Fontsize',20)
title('Percent Alteration in T-Maze Over Time for 4 Weeks of Treatment in Older 3XTG Mice')
xlabel('Week Since CCI')
ylabel('Alteration Rate (%)')
legend('Bobola Ultrasound Only','Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan', 'location', 'southeast')
grid on

% Statistics
% each column of stats_4_old is the average percent alteration for each
% test so there is 4 columns for each cohort, then 5 rows per column for
% each week
stats_4_old = [bob_only_4_old; bob_ida_4_old; sham_only_4_old; sham_ida_4_old]';
p = kruskalwallis(stats_4_old)
set(gca,'Fontsize',20)
title('Kruskal-Wallis in 4 Week Old Mice') 
ylabel('Average Percent Alteration')
xlabel('Cohort')
xticklabels({'Bobola Ultrasound Only','Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})
lines = findobj(gcf, 'type', 'line', 'Tag','Median');
xMed = mean(vertcat(lines.XData),2);
yMed = vertcat(lines.YData);
hold on
plot(xMed, yMed, 'ro-') %this one has a circle to mark median

% ot = over time
MWp1_ot = ranksum(stats_4_old(:,1),stats_4_old(:,2)); % pairing 1 Bob only vs Bob + ida 
MWp2_ot = ranksum(stats_4_old(:,1),stats_4_old(:,3)); % pairing 2 Bob only vs Sham only
MWp3_ot = ranksum(stats_4_old(:,1),stats_4_old(:,4)); % pairing 3 Bob only vs Sham + ida 
MWp4_ot = ranksum(stats_4_old(:,2),stats_4_old(:,3)); % pairing 4 Bob + ida vs Sham Only
MWp5_ot = ranksum(stats_4_old(:,2),stats_4_old(:,4)); % pairing 5 Bob + ida vs Sham + ida 
MWp6_ot = ranksum(stats_4_old(:,3),stats_4_old(:,4)); % pairing 6 Sham only vs Sham + ida

%% Boxplots 
% Plot
figure(4);
coordLineStyle = 'k.';
boxplot(stats_4_old,'Symbol', coordLineStyle); 
hold on;
ylim([0 75])

title('Cohort Distributions in 4 Week Treated Old Mice','Fontsize',20)
ylabel('Average Percent Alteration','Fontsize',20)
xlabel('Cohort','Fontsize',20)
xticklabels({'Bobola Ultrasound Only','Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan'})
parallelcoords(stats_4_old, 'Color', 0.7*[1 1 1], 'LineStyle', '-','Marker', '.', 'MarkerSize', 10);


if MWp1_ot < 0.05   
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:3);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([1 2]), [1 1]*max(yt)*1.1, '-k',  mean(xt([1 2])), max(yt)*1.15, '*k')
hold off
end 

if MWp2_ot < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:3);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([1 3]), [1 1]*max(yt)*1.1, '-k',  mean(xt([1 3])), max(yt)*1.15, '*k')
hold off
end 

if MWp3_ot < 0.05  
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:3);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([1 4]), [1 1]*max(yt)*1.1, '-k',  mean(xt([1 4])), max(yt)*1.15, '*k')
hold off
end 

if MWp4_ot < 0.05    
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:3);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([2 3]), [1 1]*max(yt)*1.1, '-k',  mean(xt([2 3])), max(yt)*1.15, '*k')
hold off
end 

if MWp5_ot < 0.05    
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:3);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([2 4]), [1 1]*max(yt)*1.1, '-k',  mean(xt([2 4])), max(yt)*1.15, '*k')
hold off
end 

if MWp6_ot < 0.05   
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:3);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([3 4]), [1 1]*max(yt)*1.1, '-k',  mean(xt([3 4])), max(yt)*1.15, '*k')
hold off
end 

% Histograms
old_4wk_0 = [mean(bob_only_4_old_0,"omitnan") mean(bob_ida_4_old_0,"omitnan") mean(sham_only_4_old_0,"omitnan") mean(sham_ida_4_old_0,"omitnan")];
old_4wk_1 = [mean(bob_only_4_old_1,"omitnan") mean(bob_ida_4_old_1,"omitnan") mean(sham_only_4_old_1,"omitnan") mean(sham_ida_4_old_1,"omitnan")];
old_4wk_2 = [mean(bob_only_4_old_2,"omitnan") mean(bob_ida_4_old_2,"omitnan") mean(sham_only_4_old_2,"omitnan") mean(sham_ida_4_old_2,"omitnan")];
old_4wk_3 = [mean(bob_only_4_old_3,"omitnan") mean(bob_ida_4_old_3,"omitnan") mean(sham_only_4_old_3,"omitnan") mean(sham_ida_4_old_3,"omitnan")];
old_4wk_4 = [mean(bob_only_4_old_4,"omitnan") mean(bob_ida_4_old_4,"omitnan") mean(sham_only_4_old_4,"omitnan") mean(sham_ida_4_old_4,"omitnan")];

x = [1 2 3 4 5];
y = [old_4wk_0; old_4wk_1; old_4wk_2; old_4wk_3;old_4wk_4];
figure(5)
b = bar(x,y,'FaceColor','flat');
set(gca,'Fontsize',28) 
b(1).FaceColor = 'r';
b(2).FaceColor = 'b';
b(3).FaceColor = 'g';
b(4).FaceColor = 'm';
xticklabels({'Pre CCI', '1 Week', '2 Weeks', '3 Weeks', '4 Weeks'})
ylabel('Percent Alteration')
xlabel('Time Since CCI')
title('4 Week Old Mice: Percent Alteration by Cohort Across Time in a T-Maze')
leg = legend('Bobola Ultrasound Only','Bobola US + Idazoxan','Sham Ultrasound Only', 'Sham Ultrasound + Idazoxan', 'location', 'northeast');
leg.AutoUpdate = "off";
ylim([0 90])


% Box Chart
% Each matrix is a column of averages for a single week's test. Each matrix
% is a cohort.
bob_only_4_old = [bob_only_4_old_0; bob_only_4_old_1; bob_only_4_old_2; bob_only_4_old_3; bob_only_4_old_4]';
bob_ida_4_old = [bob_ida_4_old_0; bob_ida_4_old_1; bob_ida_4_old_2; bob_ida_4_old_3; bob_ida_4_old_4]';
sham_only_4_old = [sham_only_4_old_0; sham_only_4_old_1; sham_only_4_old_2; sham_only_4_old_3; sham_only_4_old_4]';
sham_ida_4_old = [sham_ida_4_old_0; sham_ida_4_old_1; sham_ida_4_old_2; sham_ida_4_old_3; sham_ida_4_old_4]';

figure(6)
distribution = [bob_only_4_old_0; bob_ida_4_old_0; sham_only_4_old_0; sham_ida_4_old_0;
    bob_only_4_old_1; bob_ida_4_old_1; sham_only_4_old_1; sham_ida_4_old_1;
    bob_only_4_old_2; bob_ida_4_old_2; sham_only_4_old_2; sham_ida_4_old_2;
    bob_only_4_old_3; bob_ida_4_old_3; sham_only_4_old_3; sham_ida_4_old_3;
    bob_only_4_old_4; bob_ida_4_old_4; sham_only_4_old_4; sham_ida_4_old_4]';

n=11 ; xx=(1:20)'; 
r=repmat(xx,1,n)'; 
g = r(:)'; 
positions = 1:20; 
boxplot(distribution, 'positions', positions);  


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
set(bob_only, 'DisplayName', char({'Bobola Ultrasound Only'}))

for i = 1:5
patch(get(bob_ida(i),'XData'),get(bob_ida(i),'YData'),'b','FaceAlpha',.5);
end
set(bob_ida, 'DisplayName', char({'Bobola US + Idazoxan'}))

for i = 1:5
patch(get(sham_only(i),'XData'),get(sham_only(i),'YData'),'g','FaceAlpha',.5);
end

for i = 1:5
% set(bob_only, 'Color', 'c1');
patch(get(sham_ida(i),'XData'),get(sham_ida(i),'YData'),'m','FaceAlpha',.5);
end

leg = legend('Bobola Ultrasound Only','','','','','Bobola US + Idazoxan','','','','','Sham Ultrasound Only','','','','','','Sham Ultrasound + Idazoxan');
leg.AutoUpdate = "off";

title('Distribution of Averages for Alteration in T-Maze for Old 3XTG Mice');
set(gca,'YLim', [0 130]);
xlabel('Weeks Since CCI');
ylabel('Average Alteration Rate');
xline([4.5 8.5 12.5 16.5])


%% STATS FOR WEEK BY WEEK

% Week 0
MWp1 = ranksum(bob_only_4_old_0,sham_only_4_old_0); % PreCCI: Sham only vs Bobola only  
if MWp1 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([1 3]), [1 1]*max(yt)*1.1, '-k',  mean(xt([1 3])), max(yt)*1.15, '*k')
hold off
end 
MWp2 = ranksum(bob_ida_4_old_0,sham_ida_4_old_0); % PreCCI: Sham + ida vs Bobola + ida 
if MWp2 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([2 4]), [1 1]*max(yt)*1.1, '-k',  mean(xt([2 4])), max(yt)*1.15, '*k')
hold off
end 
MWp3 = ranksum(sham_only_4_old_0,sham_ida_4_old_0); % PreCCI: Sham + ida vs Sham
if MWp3 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([3 4]), [1 1]*max(yt)*1.1, '-k',  mean(xt([3 4])), max(yt)*1.15, '*k')
hold off
end
MWp4 = ranksum(bob_only_4_old_0,bob_ida_4_old_0); % PreCCI: Bobola + ida vs Bobola
if MWp4 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([1 2]), [1 1]*max(yt)*1.1, '-k',  mean(xt([1 2])), max(yt)*1.15, '*k')
hold off
end
MWp5 = ranksum(bob_only_4_old_0,sham_ida_4_old_0); % PreCCI: Bobola + ida vs Sham
if MWp5 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([2 3]), [1 1]*max(yt)*1.1, '-k',  mean(xt([2 3])), max(yt)*1.15, '*k')
hold off
end
MWp6 = ranksum(bob_only_4_old_0,sham_ida_4_old_0); % PreCCI: Sham + ida vs Bobola
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
MWp7 = ranksum(bob_only_4_old_1,sham_only_4_old_1); % PreCCI: Sham only vs Bobola only  
if MWp7 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([5 7]), [1 1]*max(yt)*1.1, '-k',  mean(xt([5 7])), max(yt)*1.15, '*k')
hold off
end 
MWp12 = ranksum(bob_ida_4_old_1,sham_ida_4_old_1); % PreCCI: Sham + ida vs Bobola + ida 
if MWp12 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([6 8]), [1 1]*max(yt)*1.1, '-k',  mean(xt([6 8])), max(yt)*1.15, '*k')
hold off
end 
MWp13 = ranksum(sham_only_4_old_1,sham_ida_4_old_1); % PreCCI: Sham + ida vs Sham
if MWp13 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([7 8]), [1 1]*max(yt)*1.1, '-k',  mean(xt([7 8])), max(yt)*1.15, '*k')
hold off
end
MWp14 = ranksum(bob_only_4_old_1,bob_ida_4_old_1); % PreCCI: Bobola + ida vs Bobola
if MWp14 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([5 6]), [1 1]*max(yt)*1.1, '-k',  mean(xt([5 6])), max(yt)*1.15, '*k')
hold off
end

% Week 2
MWp15 = ranksum(bob_only_4_old_2,sham_only_4_old_2); % PreCCI: Sham only vs Bobola only  
if MWp15 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([9 11]), [1 1]*max(yt)*1.1, '-k',  mean(xt([9 11])), max(yt)*1.15, '*k')
hold off
end 
MWp16 = ranksum(bob_ida_4_old_2,sham_ida_4_old_2); % PreCCI: Sham + ida vs Bobola + ida 
if MWp16 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([10 12]), [1 1]*max(yt)*1.1, '-k',  mean(xt([10 12])), max(yt)*1.15, '*k')
hold off
end 
MWp17 = ranksum(sham_only_4_old_2,sham_ida_4_old_2); % PreCCI: Sham + ida vs Sham
if MWp17 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([11 12]), [1 1]*max(yt)*1.1, '-k',  mean(xt([11 12])), max(yt)*1.15, '*k')
hold off
end
MWp18 = ranksum(bob_only_4_old_2,bob_ida_4_old_2); % PreCCI: Bobola + ida vs Bobola
if MWp18 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([9 10]), [1 1]*max(yt)*1.1, '-k',  mean(xt([9 10])), max(yt)*1.15, '*k')
hold off
end

% Week 3
MWp19 = ranksum(bob_only_4_old_3,sham_only_4_old_3); % PreCCI: Sham only vs Bobola only  
if MWp19 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([13 15]), [1 1]*max(yt)*1.1, '-k',  mean(xt([13 15])), max(yt)*1.15, '*k')
hold off
end 
MWp20 = ranksum(bob_ida_4_old_3,sham_ida_4_old_3); % PreCCI: Sham + ida vs Bobola + ida 
if MWp20 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([14 16]), [1 1]*max(yt)*1.1, '-k',  mean(xt([14 16])), max(yt)*1.15, '*k')
hold off
end 
MWp21 = ranksum(sham_only_4_old_3,sham_ida_4_old_3); % PreCCI: Sham + ida vs Sham
if MWp21 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([15 16]), [1 1]*max(yt)*1.1, '-k',  mean(xt([15 16])), max(yt)*1.15, '*k')
hold off
end
MWp22 = ranksum(bob_only_4_old_3,bob_ida_4_old_3); % PreCCI: Bobola + ida vs Bobola
if MWp22 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([13 14]), [1 1]*max(yt)*1.1, '-k',  mean(xt([13 14])), max(yt)*1.15, '*k')
hold off
end

% Week 4
MWp23 = ranksum(bob_only_4_old_4,sham_only_4_old_4); % PreCCI: Sham only vs Bobola only  
if MWp23 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([17 19]), [1 1]*max(yt)*1.1, '-k',  mean(xt([17 19])), max(yt)*1.15, '*k')
hold off
end 
MWp24 = ranksum(bob_ida_4_old_4,sham_ida_4_old_4); % PreCCI: Sham + ida vs Bobola + ida 
if MWp24 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([18 20]), [1 1]*max(yt)*1.1, '-k',  mean(xt([18 20])), max(yt)*1.15, '*k')
hold off
end 
MWp25 = ranksum(sham_only_4_old_4,sham_ida_4_old_4); % PreCCI: Sham + ida vs Sham
if MWp25 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([19 20]), [1 1]*max(yt)*1.1, '-k',  mean(xt([19 20])), max(yt)*1.15, '*k')
hold off
end
MWp26 = ranksum(bob_only_4_old_4,bob_ida_4_old_4); % PreCCI: Bobola + ida vs Bobola
if MWp26 < 0.05 
yt = get(gca, 'YTick');
set(gca, 'Xtick', 1:20);
axis([xlim    0  ceil(max(yt)*1.1)])
xt = get(gca, 'XTick');
hold on
plot(xt([17 18]), [1 1]*max(yt)*1.1, '-k',  mean(xt([17 18])), max(yt)*1.15, '*k')
hold off
end

set(gca,'xtick',[mean(positions(1:4)) mean(positions(5:8)) mean(positions(9:12)) mean(positions(13:16)) mean(positions(17:20))]) 
set(gca,'xticklabel',{'0','1','2','3','4'},'Fontsize',28) 












