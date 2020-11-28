%load('RealData.mat');

% Data Transformation
data = RealData;
a=(RealData(:,3)>=45);
Newdata = [RealData(:,1:2),a];
X = data(:,2:3);


N = 143; % The RealData sample size;
epsilon = 0.0001; % The setting tolerance to check whether stop the EM iteration;
T = 500; % The maximum of EM iterations;
n = 4;% The dimension of [lambda,alpha,beta'].
n_add_one = n + 1;
Para_num = 7; % The number of unknown parameters;
lb_lambda = 0; ub_lambda = 1; lb_alpha = 1; ub_alpha = 10;
lb_beta = -1; ub_beta = 1; lb_theta = -10; ub_theta = 10;
% lb_lambda - The lower bound of the uniform distribution for the initial value of lambda;
% ub_lambda - The upper bound of the uniform distribution for the initial value of lambda;
% lb_alpha - The lower bound of the uniform distribution for the initial value of alpha;
% ub_alpha - The upper bound of the uniform distribution for the initial value of alpha;
% lb_beta - The lower bound of the uniform distribution for the initial value of each component of beta;
% ub_beta - The upper bound of the uniform distribution for the initial value of each component of beta;
% lb_theta - The lower bound of the uniform distribution for the initial value of each component of theta;
% ub_theta - The upper bound of the uniform distribution for the initial value of each component of theta;
bound_vector = [lb_lambda, ub_lambda, lb_alpha, ub_alpha, lb_beta,ub_beta, lb_theta, ub_theta];
I = 20;
[ Est] = Parallel_Computing_Est( data, Newdata, bound_vector, I, epsilon, T, N, n, n_add_one, Para_num)