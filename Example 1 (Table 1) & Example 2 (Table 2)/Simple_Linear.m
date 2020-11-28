function [ Beta_Est ] = Simple_Linear( data,N,n )
% This is a subroutine program to calculate the coefficient vector -Beta w- 
% here the linear model log(V)= c+Beta'*X+e
% Input: 
%       data =[V,X_matrix];
%       data is a large matrix: includes the following elements.
%         V --- The simulated response N*1 vector, whose each component is 
%               a response.
%         X_matrix --- The simulated N*d covariate matrix, whose each row 
%                      is a covariate vector, a realization form the distr-
%                      ibution of covariate vector X;
%         N -- The sample size;
%         n -- The sum of the dimension of beta and 2;
% Output:
%       Beta_Est -- The estimate of Beta;
Y = log(data(:,1));
X_add_one = [ones(N,1),data(:,2:n-1)];
Temp = (X_add_one'*X_add_one)\(X_add_one'*Y);
Beta_Est = -Temp(2:n-1);
end

