Target = [];
CI = [];
% The lambda_hat_est,alpha_hat_est,beta_hat_est are got by
% DataProcessing_and_Estimation.m
lambda_hat_est = 0.1988;
alpha_hat_est = 1.6733; 
beta_hat_est = [-0.0779,0.1326];

% The Bootstrap Estimation Results got by Bootstrap_Estimation.m
lambda_hat = Bootstrap_Results(:,1);
alpha_hat = Bootstrap_Results(:,2); 
beta_hat = Bootstrap_Results(:,3:4);

% Incubation Period Estimation and Bootstrap Confidence Interval Construct-
% -ion for Female Group with Age >= 45
[ mean_Quantile_est ] = WBQuantile11( lambda_hat_est, alpha_hat_est, beta_hat_est );
[ mean_Quantile ] = WBQuantile11( lambda_hat, alpha_hat, beta_hat );
for i = 1:10
   b = sort(mean_Quantile(:,i));
   CI = [CI;[prctile(b,2.5),prctile(b,97.5)]];
end
Target = [Target,mean_Quantile_est',CI];

% Incubation Period Estimation and Bootstrap Confidence Interval Construct-
% -ion for Female Group with Age < 45
CI = [];
[ mean_Quantile_est ] = WBQuantile10( lambda_hat_est, alpha_hat_est, beta_hat_est );
[ mean_Quantile ] = WBQuantile10( lambda_hat, alpha_hat, beta_hat );
for i = 1:10
   b = sort(mean_Quantile(:,i));
   CI = [CI;[prctile(b,2.5),prctile(b,97.5)]];
end
Target = [Target,mean_Quantile_est',CI];

% Incubation Period Estimation and Bootstrap Confidence Interval Construct-
% -ion for Male Group with Age >= 45
CI = [];
[ mean_Quantile_est ] = WBQuantile01( lambda_hat_est, alpha_hat_est, beta_hat_est );
[ mean_Quantile ] = WBQuantile01( lambda_hat, alpha_hat, beta_hat );
for i = 1:10
   b = sort(mean_Quantile(:,i));
   CI = [CI;[prctile(b,2.5),prctile(b,97.5)]];
end
Target = [Target,mean_Quantile_est',CI];


% Incubation Period Estimation and Bootstrap Confidence Interval Construct-
% -ion for Male Group with Age < 45
CI = [];
[ mean_Quantile_est ] = WBQuantile00( lambda_hat_est, alpha_hat_est, beta_hat_est );
[ mean_Quantile ] = WBQuantile00( lambda_hat, alpha_hat, beta_hat );
for i = 1:10
   b = sort(mean_Quantile(:,i));
   CI = [CI;[prctile(b,2.5),prctile(b,97.5)]];
end
Target = [Target,mean_Quantile_est',CI]