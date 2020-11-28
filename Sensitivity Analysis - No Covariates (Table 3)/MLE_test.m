N = 1500; % The sample size.
K = 200; % The simulated datasets.
lambda = 0.2; % 
alpha = 2;
Data = cell(K,1);
rng(9251314) 
% The data generating process.
for i = 1:K
    PI = 0.5*ones(N,1);
    delta=binornd(1,PI);
    CC = wblrnd(1./(lambda),alpha*ones(N,1));
    Y = gamrnd(1/alpha*ones(N,1),1);
    LB = Y.^(1/alpha)./(lambda);
    mydata = delta.*CC+(1-delta).*LB;
    Data{i,1} = mydata;
end
Est = zeros(11,2);
SE = zeros(11,2);
result = zeros(K,2);
% The computation procedure for those results in Tab3 with fixed p.
A_beta = [-1,0;0,-1;];b_beta=[-0.00000001;-0.00000001];
% The nonnegative constraints for lambda and alpha.
for j = 1:11
    p = (j-1)*0.1;
    for i = 1:K
        [para_estimator,~]=fmincon(@(Para)Negative_log_likelihood( Para(1),Para(2),Data{i},p),[0.1;2],A_beta,b_beta);
        result(i,:) = para_estimator';
    end
    Est(j,:) = mean(result);
    SE(j,:)  = std(result);
end
[Est,SE]
% The computation procedure for those results in Tab3 with constrained range of p.
result1 = zeros(K,3);
for i = 1:K
% The constraints for lambda, alpha, and p( Here, p lies in [0.3,0.6]).
A_beta = [-1,0,0;0,-1,0;0,0,1;0,0,-1];b_beta=[-0.00000001;-0.00000001;0.6;-0.3];
[para_estimator,~]=fmincon(@(Para)Negative_log_likelihood( Para(1),Para(2),Data{i},Para(3)),[0.1;2;0.5],A_beta,b_beta);
result1(i,:) = para_estimator';
end
[mean(result1),std(result1)]