K = 200; % The number of the simulated datasets;
N = 1500; % The sample size;
mu = [1,1]; sigma = [0.5,0;0,0.5];
% The mean and covariance of the simulated d-dimensional covariate vector X;
beta = [0.8,0.6]'; theta = [0,1,1]'; Initial_lambda = 0.2; alpha = 2.0;
% The beta, theta, lambda, and alpha in the proposed mixture regression model;
epsilon = 0.0001;
% The setting tolerance to check whether stop the EM iteration;
T = 500; % The maximum of EM iterations;
[beta_dim,~] = size(beta); % beta_dim -- The dimension of beta;
n = 2 + beta_dim;  n_add_one = n + 1;
Para_num = 7; % The number of unknown parameters;
lb_lambda = 0; ub_lambda = 1; lb_alpha = 1; ub_alpha = 10;
lb_beta = -5; ub_beta = 5; lb_theta = -5; ub_theta = 5;
% lb_lambda - The lower bound of the uniform distribution for the initial value of lambda;
% ub_lambda - The upper bound of the uniform distribution for the initial value of lambda;
% lb_alpha - The lower bound of the uniform distribution for the initial value of alpha;
% ub_alpha - The upper bound of the uniform distribution for the initial value of alpha;
% lb_beta - The lower bound of the uniform distribution for the initial value of each component of beta;
% ub_beta - The upper bound of the uniform distribution for the initial value of each component of beta;
% lb_theta - The lower bound of the uniform distribution for the initial value of each component of theta;
% ub_theta - The upper bound of the uniform distribution for the initial value of each component of theta;
bound_vector = [lb_lambda, ub_lambda, lb_alpha, ub_alpha, lb_beta,ub_beta, lb_theta, ub_theta];
SimulationData = Data_Generator( N,K,Initial_lambda,alpha,beta,theta,mu,sigma );
% load('ReviewSimulationResult-FS-Rnd10-Rnd100') 
% SimulationData in ReviewSimulationResult-FS-Rnd10-Rnd100.mat is what we use in Example 1;
% load('ReviewSimulationResult-FS-Rnd10') 
% SimulationData in ReviewSimulationResult-FS-Rnd10.mat is what we use in Example 2;
t_start=tic;
% FS setting
Initial_beta = [0,0]'; Initial_theta = [0,0,0]'; Initial_lambda = 0.1; Initial_alpha = 3.5;
Initial_Point = [Initial_lambda;Initial_alpha;Initial_beta;Initial_theta];% The fixed initial value.
[ FSEst] = FS_Parallel_Computing_Est( SimulationData, Initial_Point, K, epsilon, T, N, n, n_add_one, Para_num);

% Rnd10 setting
I1 = 10; % The number of the initial values in Rnd10 setting;
[ Rnd10Est] = Parallel_Computing_Est(SimulationData, bound_vector, K, I1, epsilon, T, N, n, n_add_one, Para_num);

% Rnd100 setting
I2 = 100; % The number of the initial values in Rnd100 setting. 
% In this setting, our computer is out of memory due to too many iterations,  
% so our results actually is based on dividing the 200 simulated datasets into
% 4 parts and each part includes 50 simulated datasets.Finally we combine 
% all the estimates to get Rnd100Est.
[ Rnd100Est] = Parallel_Computing_Est(SimulationData, bound_vector, K, I2, epsilon, T, N, n, n_add_one, Para_num);

% SR setting
[ SREst] = SR_Parallel_Computing_Est( SimulationData, K, N, n);
toc(t_start);
mean(FSEst),std(FSEst)
mean(Rnd10Est),std(Rnd10Est)
mean(Rnd100Est),std(Rnd100Est)
mean(SREst),std(SREst)
