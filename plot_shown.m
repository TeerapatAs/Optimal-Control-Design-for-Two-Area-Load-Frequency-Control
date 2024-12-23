% Plot test
load("df1_opt.mat");
df_1opt = df1_opt(2,:);
time = df1_opt(1,:);

load("df1.mat")
df_1 = df1(2,:);
time2 = df1(1,:);

load("dP12_opt.mat")
dP_12opt = dP12_opt(2,:);
time3 = dP12_opt(1,:);

load("Ptie12.mat")
dP_12 = Ptie12(2,:);
time4 = Ptie12(1,:);

%%  For frequency

% Plot graphs to compare.
plot(time,df_1opt);
hold on
plot(time2,df_1,'r--');
hold off

xlabel('time(s)');
ylabel('frequency(Hz)');
lgd = legend('optimal control', 'integral control');
fontsize(lgd,12,'points')
figure off

%% For power tie line

plot(time3,dP_12opt);
hold on
plot(time4,dP_12,'r--');
hold off

xlabel('time(s)');
ylabel('Power Tie line (pu)');
lgd = legend('optimal control', 'integral control');
fontsize(lgd,12,'points')

