This folder contains the matlab code for producing the results in Table 3.

MLE_test.m -- This is the main program to calculate the results under vari-
              ous settings in Table 3 

Length_Biased_Weibull_density.m -- This is a subroutine program to calcula-
                                   te the value of the density function 
                                   g_{lambda,alpha}(y).

Weibull_density.m -- This is a subroutine program to calculate the value of 
                     the density function f_{lambda,alpha}(y).

Mix_density.m -- This is a subroutine program to calculate the value of th-
                 -e mixture density function p*g_{lambda,alpha}(y)+(1-p)*
                 g_{lambda,alpha}(y) with p = mix_proportion at y = x.

Negative_log_likelihood.m -- This is a subroutine program to calculate the 
                             negative log likelihood of the observed data x. 

SensitivityData.mat contains the simulated datasets we use to produce the 
results in Table 3.
