function [ Est] = SR_Parallel_Computing_Est( Data, K, N, n)
% This is a subroutine program to calculate the estimate under SR setting.
% Input: 
%       Data -- The cell variable contains K data matrices;
%                 Each data matrix has the form [V,X_matrix], which is a 
%                 (N*(1+d)) matrix:
%                 V --- The simulated response N*1 vector, whose each
%                 component is a response.
%                 X_matrix --- The simulated N*d covariate matrix, whose e-
%                              ach row is a covariate vector, a realization
%                              of X;
%       K -- The number of the simulated datasets;
%       N -- The sample size;
%       n -- The sum of the dimension of beta and 2;
% Output:
%       Est -- A K*Para_num matrix, containing the K estimates from K simu-
%              lated datasets and of which each row is a estimate of the P-
%              ara_num-dimensional unknown parameter vector.
Est = zeros( K, n-2 );
parfor i = 1:K
    data = Data{i};
    [ Beta_Est ] = Simple_Linear( data,N,n );
    Est(i,:) = Beta_Est';
end
end