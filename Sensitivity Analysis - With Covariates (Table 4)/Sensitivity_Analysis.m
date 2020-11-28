K = 200; % The number of the simulated datasets;
N = 1500; % The sample size;
mu = [1,1]; sigma = [0.5,0;0,0.5];
% The mean and covariance of the simulated d-dimensional covariate vector X;
beta = [0.8,0.6]'; theta = [0,1,1]'; Initial_lambda = 1; alpha = 1;
% The beta, theta, lambda, and alpha in the proposed mixture regression model;
epsilon = 0.0001;
% The setting tolerance to check whether stop the EM iteration;
T = 500; % The maximum of EM iterations;
[beta_dim,~] = size(beta); % beta_dim -- The dimension of beta;
n = 2 + beta_dim;  n_add_one = n + 1;
Para_num = 7; % The number of unknown parameters;
%SimulationData = Data_Generator( N,K,Initial_lambda,alpha,beta,theta,mu,sigma );
 load('ReviewSimulationResult') 
% SimulationData in ReviewSimulationResult-FS-Rnd10-Rnd100.mat is what we use in Example 1;

% lb_lambda - The lower bound of the uniform distribution for the initial value of lambda;
% ub_lambda - The upper bound of the uniform distribution for the initial value of lambda;
% lb_alpha - The lower bound of the uniform distribution for the initial value of alpha;
% ub_alpha - The upper bound of the uniform distribution for the initial value of alpha;
% lb_beta - The lower bound of the uniform distribution for the initial value of each component of beta;
% ub_beta - The upper bound of the uniform distribution for the initial value of each component of beta;
% lb_theta - The lower bound of the uniform distribution for the initial value of each component of theta;
% ub_theta - The upper bound of the uniform distribution for the initial value of each component of theta;
lb_lambda = 0; ub_lambda = 1; lb_alpha = 1; ub_alpha = 10; lb_beta = -5; ub_beta = 5; 


%rng(716495)
I = 10;% Rnd10 setting

lb_theta = -3; ub_theta = 3;
bound_vector = [lb_lambda, ub_lambda, lb_alpha, ub_alpha, lb_beta,ub_beta, lb_theta, ub_theta];
[ Rnd10Est1] = Parallel_Computing_Est( SimulationData,bound_vector, K, I, epsilon, T, N, n, n_add_one, Para_num);

lb_theta = -5; ub_theta = 5;
bound_vector = [lb_lambda, ub_lambda, lb_alpha, ub_alpha, lb_beta,ub_beta, lb_theta, ub_theta];
[ Rnd10Est2] = Parallel_Computing_Est( SimulationData,bound_vector, K, I, epsilon, T, N, n, n_add_one, Para_num);

lb_theta = 0.5; ub_theta = 2;
bound_vector = [lb_lambda, ub_lambda, lb_alpha, ub_alpha, lb_beta,ub_beta, lb_theta, ub_theta];
[ Rnd10Est3] = Parallel_Computing_Est( SimulationData,bound_vector, K, I, epsilon, T, N, n, n_add_one, Para_num);

lb_theta = -1; ub_theta = 0.5;
bound_vector = [lb_lambda, ub_lambda, lb_alpha, ub_alpha, lb_beta,ub_beta, lb_theta, ub_theta];
[ Rnd10Est4] = Parallel_Computing_Est( SimulationData,bound_vector, K, I, epsilon, T, N, n, n_add_one, Para_num);

lb_theta = -2; ub_theta = -0.5;
bound_vector = [lb_lambda, ub_lambda, lb_alpha, ub_alpha, lb_beta,ub_beta, lb_theta, ub_theta];
[ Rnd10Est5] = Parallel_Computing_Est( SimulationData, bound_vector, I, epsilon, T, N, n, n_add_one, Para_num);

mean(Rnd10Est1),std(Rnd10Est1)
mean(Rnd10Est2),std(Rnd10Est2)
mean(Rnd10Est3),std(Rnd10Est3)
mean(Rnd10Est4),std(Rnd10Est4)
mean(Rnd10Est5),std(Rnd10Est5)
