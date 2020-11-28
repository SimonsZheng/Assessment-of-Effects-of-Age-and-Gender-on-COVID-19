function [ Initial_Points ] = Initial_Points_Generator( bound_vector, Para_num, n, I )
% This is a subroutine program to generate the initial values of the unkno-
% wn parameters.
% Input: 
%       bound_vector = [lb_lambda, ub_lambda, lb_alpha, ub_alpha, lb_beta, 
%                       ub_beta, lb_theta, ub_theta];
%       lb_lambda -- The lower bound of the uniform distribution for the i-
%                    nitial value of lambda;
%       ub_lambda -- The upper bound of the uniform distribution for the i-
%                    nitial value of lambda;
%       lb_alpha -- The lower bound of the uniform distribution for the i-
%                    nitial value of alpha;
%       ub_alpha -- The upper bound of the uniform distribution for the i-
%                    nitial value of alpha;
%       lb_beta -- The lower bound of the uniform distribution for the i-
%                    nitial value of each component of beta;
%       ub_beta -- The upper bound of the uniform distribution for the i-
%                    nitial value of each component of beta;
%       lb_theta -- The lower bound of the uniform distribution for the i-
%                    nitial value of each component of theta;
%       ub_theta -- The upper bound of the uniform distribution for the i-
%                    nitial value of each component of theta;
%       Para_num -- The number of unknown parameters;
%       n -- The sum of the dimension of beta and 2;
%       I -- The number of initial values;
% Output:
%       Initial_Points -- A I*Para_num matrix, containing I initial values
%                         of the unknown parameters and of which each row
%                         is a estimate of the Para_num-dimensional unknown
%                         parameter vector.
Initial_Points = zeros(I, Para_num);
for i = 1 : I
Initial_Points(i,1) = unifrnd(bound_vector(1), bound_vector(2)); 
Initial_Points(i,2) = unifrnd(bound_vector(3), bound_vector(4));
Initial_Points(i,3:n) = unifrnd(bound_vector(5), bound_vector(6),n - 2, 1); 
Initial_Points(i,n+1:Para_num)= unifrnd(bound_vector(7), bound_vector(8), Para_num - n, 1);
end

