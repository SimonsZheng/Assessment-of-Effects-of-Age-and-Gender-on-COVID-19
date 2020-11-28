% This m file is used to generate the Figure 3 in the paper.
load('RealData.mat')
Female_index = (RealData(:,2)==1);
Female_timelag_data = RealData(Female_index,1);
Female_age_data = RealData(Female_index,3);
Male_index = (RealData(:,2)==0);
Male_timelag_data = RealData(Male_index,1);
Male_age_data = RealData(Male_index,3);

figure;
hold on;
plot(Female_age_data,Female_timelag_data,'ro','markersize',3,'MarkerFaceColor','r')
plot(Male_age_data,Male_timelag_data,'bo','markersize',3,'MarkerFaceColor','b')

legend({'Female','Male'});
xlabel('Age(Years)');
ylabel('Time Length(Days)');

