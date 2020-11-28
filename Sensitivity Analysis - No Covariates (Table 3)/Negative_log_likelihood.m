function [ y ] = Negative_log_likelihood( lambda,alpha,x,p )
y = -sum(log(Mix_density( lambda,alpha,x,p)));
end