load('RealData.mat');

N = 143; % The RealData sample size;
epsilon = 0.00001; % The setting tolerance to check whether stop the EM iteration;
T = 500; % The maximum of EM iterations;
n = 4;% The dimension of [lambda,alpha,beta'].
n_add_one = n + 1;
Para_num = 7; % The number of unknown parameters;
lb_lambda = 0; ub_lambda = 1; lb_alpha = 1; ub_alpha = 10;
lb_beta = -1; ub_beta = 1; 
% lb_lambda - The lower bound of the uniform distribution for the initial value of lambda;
% ub_lambda - The upper bound of the uniform distribution for the initial value of lambda;
% lb_alpha - The lower bound of the uniform distribution for the initial value of alpha;
% ub_alpha - The upper bound of the uniform distribution for the initial value of alpha;
% lb_beta - The lower bound of the uniform distribution for the initial value of each component of beta;
% ub_beta - The upper bound of the uniform distribution for the initial value of each component of beta;
% lb_theta - The lower bound of the uniform distribution for the initial value of each component of theta;
% ub_theta - The upper bound of the uniform distribution for the initial value of each component of theta;
I = 20;

c = 3;% The fixed range [-c,c] for theta when implementing optimization and initialization.
lb_theta = -c; ub_theta = c;
bound_vector = [lb_lambda, ub_lambda, lb_alpha, ub_alpha, lb_beta,ub_beta, lb_theta, ub_theta];
[ Est3] = Parallel_Computing_Est( RealData, c, bound_vector, I, epsilon, T, N, n, n_add_one, Para_num)
c = 5;% The fixed range [-c,c] for theta when implementing optimization and initialization.
lb_theta = -c; ub_theta = c;
bound_vector = [lb_lambda, ub_lambda, lb_alpha, ub_alpha, lb_beta,ub_beta, lb_theta, ub_theta];
[ Est5] = Parallel_Computing_Est( RealData, c, bound_vector, I, epsilon, T, N, n, n_add_one, Para_num)
c = 10;% The fixed range [-c,c] for theta when implementing optimization and initialization.
lb_theta = -c; ub_theta = c;
bound_vector = [lb_lambda, ub_lambda, lb_alpha, ub_alpha, lb_beta,ub_beta, lb_theta, ub_theta];
[ Est10] = Parallel_Computing_Est( RealData, c, bound_vector, I, epsilon, T, N, n, n_add_one, Para_num)