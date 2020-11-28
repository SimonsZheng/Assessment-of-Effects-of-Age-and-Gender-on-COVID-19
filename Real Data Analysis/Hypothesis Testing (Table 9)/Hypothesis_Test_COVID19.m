load('RealData.mat');
% beta = [beta1;beta2], beta1 = beta_gender, beta2 = beta_age.

N = 143; % The RealData sample size;
% epsilon = 0.0001
epsilon = 0.00001; % The setting tolerance to check whether stop the EM iteration;
T = 500; % The maximum of EM iterations;
n = 4;% The dimension of [lambda,alpha,beta'].
n_add_one = n + 1;
Para_num = 7; % The number of unknown parameters;
lb_lambda = 0; ub_lambda = 1; lb_alpha = 1; ub_alpha = 10;
lb_beta = -1; ub_beta = 1; lb_theta = -5; ub_theta = 5;
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

rng(930507);
Target_log_Likelihood_output1 = Hypothesis_Test1( RealData,bound_vector, I, epsilon, T, N, n, n_add_one, Para_num);
%--------------------Testing Null Hypothesis H_1:beta = [0;0]---------------------------------------------------------------------
Target_log_Likelihood_output2 = Hypothesis_Test2( RealData,bound_vector, I, epsilon, T, N, n, n_add_one, Para_num);
%--------------------Testing Null Hypothesis H_2:beta1 = 0---------------------------------------------------------------------
Target_log_Likelihood_output3 = Hypothesis_Test3( RealData,bound_vector, I, epsilon, T, N, n, n_add_one, Para_num);
%--------------------Testing Null Hypothesis H_3:beta2 = 0---------------------------------------------------------------------   
Target_log_Likelihood_output4 = Hypothesis_Test4( RealData,bound_vector, I, epsilon, T, N, n, n_add_one, Para_num);
      
Test2 = 2*((Target_log_Likelihood_output1)-(Target_log_Likelihood_output2));
p2=chi2cdf(Test2,2,'upper');
Test3 = 2*((Target_log_Likelihood_output1)-(Target_log_Likelihood_output3));
p3=chi2cdf(Test3,1,'upper');
Test4 = 2*((Target_log_Likelihood_output1)-(Target_log_Likelihood_output4));
p4=chi2cdf(Test4,1,'upper');
CML = [Target_log_Likelihood_output2,Target_log_Likelihood_output3,Target_log_Likelihood_output4]
LLR = [Test2,Test3,Test4]
p_value = [p2,p3,p4]