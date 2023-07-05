%%KATS BRANCH
%author: Kat Floerchinger
MWp1_ot = ranksum(stats_4_old(:,1),stats_4_old(:,2)); % pairing 1 Bob only vs Bob + ida 
MWp2_ot = ranksum(stats_4_old(:,1),stats_4_old(:,3)); % pairing 2 Bob only vs Sham only
MWp3_ot = ranksum(stats_4_old(:,1),stats_4_old(:,4)); % pairing 3 Bob only vs Sham + ida 
MWp4_ot = ranksum(stats_4_old(:,2),stats_4_old(:,3)); % pairing 4 Bob + ida vs Sham Only
MWp5_ot = ranksum(stats_4_old(:,2),stats_4_old(:,4)); % pairing 5 Bob + ida vs Sham + ida 
MWp6_ot = ranksum(stats_4_old(:,3),stats_4_old(:,4)); % pairing 6 Sham only vs Sham + ida



% for i = 1:81
%     if  (100 < age_0{i,1}) && (age_0{i,1} <= 200) % if age is between 100 and 200
%         age_0{i,1} = 1;
%     elseif (201 < age_0{i,1}) && (age_0{i,1} <= 300) % if age is between 201 and 300
%         age_0{i,1} = 2;
%     elseif (301 < age_0{i,1}) && (age_0{i,1} <= 400) % if age is between 301 and 400
%         age_0{i,1} = 3;
%     elseif (401 < age_0{i,1}) && (age_0{i,1} <= 500) % if age is between 401 and 500
%         age_0{i,1} = 4;
%     elseif (501 < age_0{i,1}) && (age_0{i,1} <= 600) % if age is between 501 and 600
%         age_0{i,1} = 5;
%     elseif (601 < age_0{i,1}) && (age_0{i,1} <= 700) % if age is between 601 and 700
%         age_0{i,1} = 6;
%     end
% end