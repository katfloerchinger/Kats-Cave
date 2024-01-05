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
plot(weeks,bob_only_4_young,'.-k','MarkerSize', 18,'LineWidth', 2);
hold on

plot(weeks,bob_ida_4_young,'.-.k','MarkerSize', 18,'LineWidth', 1);

plot(weeks,sham_only_4_young,'.--k' ,'MarkerSize', 18,'LineWidth', 2);

plot(weeks,sham_ida_4_young,'.:k','MarkerSize', 18,'LineWidth', 2);

hold off
set(gca,'Fontsize',20)
title('Percent Alternation in T-Maze Over Time for 4 Weeks of Treatment in Young 3XTG Mice')
xlabel('Week Since CCI')
ylabel('Alternation Rate (%)')
legend('LIFUS Only','LIFUS + Idazoxan','Sham', 'Idazoxan Only', 'location', 'southeast')
% grid on

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
[p_3way_young,tbl,~] = anovan(altrate_young,{UStype_young idatype_young week_young},"Model",2, ...
    'Varnames',{'LIFUS','Idazoxan','week'});

