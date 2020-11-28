function [ Likelihood ] = Hypothesis_Test3( DATA,bound_vector, I, epsilon, T, N, n, n_add_one, Para_num)
% This is a subroutine program to calculate the likelihood under beta1 = 0.
% Input: 
%       DATA -- A matrix has the form [V,X_matrix], which is a (N*(1+d)) m-
%               -atrix:
%                     V --- The simulated response N*1 vector, whose each
%                           component is a response.
%                     X_matrix --- The simulated N*d covariate matrix, who-
%                                  -se each row is a covariate vector, a r-
%                                  ealization of X;
%       bound_vector -- A vector giving the bound of the supporting set of
%                       the uniform distribution for the initial value of
%                       the parameters, see the discription of input for t-
%                       function Initial_Points_Generator.m
%       I -- The number of the initial values;
%       epsilon -- The setting tolerance to check whether stop the EM iter-
%                  ation;
%       n -- The sum of the dimension of beta and 2;
%       n_add_one = n + 1;
%       T -- The maximum of EM iterations;
%       N -- The sample size;
%       theta_dim -- The dimension of theta;
%       Para_num -- The number of unknown parameters;
% Output:
%       Likelihood -- A K-dimensional vector, containing the K likelihoods
%       for K simulated datasets with beta1 = 0.
    X = DATA(:,2:n-1);
    % The constraints for theta;
    A_theta = [1,0,0;-1,0,0;0,1,0;0,-1,0;0,0,1;0,0,-1];b_theta = [5;5;5;5;5;5];
    Initial_Points = Initial_Points_Generator( bound_vector,Para_num, n,I );
    % The nonnegative constraints for lambda & alpha;
    A_beta = [-1,0,0;1,0,0;0,-1,0;0,1,0]; b_beta=[-0.00000001;10;-0.00000001;10];
    lambda_hat = Initial_Points(1,1); alpha_hat = Initial_Points(1,2);
    beta_2hat = Initial_Points(1,n); theta_hat = Initial_Points(1,n_add_one:Para_num)';

gamma_hat = Efunction( DATA,N,n,lambda_hat,alpha_hat,[0;beta_2hat],theta_hat );

[Para_estimator,~] = fmincon(@(Para)Lxv_nonfix( DATA,n,gamma_hat,[Para(1:2);0;Para(3)] ),[lambda_hat;alpha_hat;beta_2hat],A_beta,b_beta);
[theta_estimator,~] = fmincon(@(theta)Lz( X,N,gamma_hat,theta ),theta_hat,A_theta,b_theta);
a = [Para_estimator(1:2);0;Para_estimator(3);theta_estimator];
b = [lambda_hat;alpha_hat;0;beta_2hat;theta_hat];
t = 1;
while (sum((a-b).^2) >= epsilon) && (t <= T)
lambda_hat = Para_estimator(1);
alpha_hat = Para_estimator(2);
beta_2hat = Para_estimator(3);
theta_hat = theta_estimator;
gamma_hat = Efunction( DATA,N,n,lambda_hat,alpha_hat,[0;beta_2hat],theta_hat );
[Para_estimator,~] = fmincon(@(Para)Lxv_nonfix( DATA,n,gamma_hat,[Para(1:2);0;Para(3)]),[lambda_hat;alpha_hat;beta_2hat],A_beta,b_beta);
[theta_estimator,~] = fmincon(@(theta)Lz( X,N,gamma_hat,theta ),theta_hat,A_theta,b_theta);%,A_theta,b_theta
b = a;
a = [Para_estimator(1:2);0;Para_estimator(3);theta_estimator];
t = t + 1;
end
log_Likelihood_output = -Negative_log_Likelihood_Calcalator( DATA, [Para_estimator(1:2);0;Para_estimator(3)], theta_estimator, N, n);


    
 for m = 2:I
lambda_hat = Initial_Points(m,1); alpha_hat = Initial_Points(m,2);
beta_2hat = Initial_Points(m,n); theta_hat = Initial_Points(m,n_add_one:Para_num)';

gamma_hat = Efunction( DATA,N,n,lambda_hat,alpha_hat,[0;beta_2hat],theta_hat );

[Para_estimator,~] = fmincon(@(Para)Lxv_nonfix( DATA,n,gamma_hat,[Para(1:2);0;Para(3)] ),[lambda_hat;alpha_hat;beta_2hat],A_beta,b_beta);
[theta_estimator,~] = fmincon(@(theta)Lz( X,N,gamma_hat,theta ),theta_hat,A_theta,b_theta);
a = [Para_estimator(1:2);0;Para_estimator(3);theta_estimator];
b = [lambda_hat;alpha_hat;0;beta_2hat;theta_hat];
t = 1;
while (sum((a-b).^2) >= epsilon) && (t <= T)
lambda_hat = Para_estimator(1);
alpha_hat = Para_estimator(2);
beta_2hat = Para_estimator(3);
theta_hat = theta_estimator;
gamma_hat = Efunction( DATA,N,n,lambda_hat,alpha_hat,[0;beta_2hat],theta_hat );
[Para_estimator,~] = fmincon(@(Para)Lxv_nonfix( DATA,n,gamma_hat,[Para(1:2);0;Para(3)]),[lambda_hat;alpha_hat;beta_2hat],A_beta,b_beta);
[theta_estimator,~] = fmincon(@(theta)Lz( X,N,gamma_hat,theta ),theta_hat,A_theta,b_theta);%,A_theta,b_theta
b = a;
a = [Para_estimator(1:2);0;Para_estimator(3);theta_estimator];
t = t + 1;
end
temp_log_Likelihood_output  = -Negative_log_Likelihood_Calcalator( DATA, [Para_estimator(1:2);0;Para_estimator(3)], theta_estimator, N, n);
        if temp_log_Likelihood_output > log_Likelihood_output
            log_Likelihood_output = temp_log_Likelihood_output;
        end

end
    Likelihood = log_Likelihood_output;
end