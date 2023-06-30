%%KATS BRANCH
%author: Kat Floerchinger
MWp1_ot = ranksum(stats_4_old(:,1),stats_4_old(:,2)); % pairing 1 Bob only vs Bob + ida 
MWp2_ot = ranksum(stats_4_old(:,1),stats_4_old(:,3)); % pairing 2 Bob only vs Sham only
MWp3_ot = ranksum(stats_4_old(:,1),stats_4_old(:,4)); % pairing 3 Bob only vs Sham + ida 
MWp4_ot = ranksum(stats_4_old(:,2),stats_4_old(:,3)); % pairing 4 Bob + ida vs Sham Only
MWp5_ot = ranksum(stats_4_old(:,2),stats_4_old(:,4)); % pairing 5 Bob + ida vs Sham + ida 
MWp6_ot = ranksum(stats_4_old(:,3),stats_4_old(:,4)); % pairing 6 Sham only vs Sham + ida