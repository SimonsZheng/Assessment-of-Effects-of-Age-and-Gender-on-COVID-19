This folder contains the matlab code for producing the results in Table 9.
It includes Hypothesis_Test_COVID19.m and some other supporting subroutine 
programs.

Hypothesis_Test_COVID19.m -- This is the main program, which gives those r-
                             -esults of simulations under various constrai-
                             -nts in Table 9.

RealData.mat -- RealData = [V,X];
                RealData is a large matrix: includes the following elements.
                V --- the observed time lag  of a confirmed case between t-
                      -he departure from Wuhan and the symptom onset.
                X --- the observed risk factor.In real data,X=[Gender,Age];


Hypothesis_Testing_Results.mat -- It contains
Target_a1 --- The estimate of parameters without constraints for beta.
Target_a2 --- The estimate of parameters under beta = [0;0].
Target_a3 --- The estimate of parameters under beta1 = 0.
Target_a4 --- The estimate of parameters under beta2 = 0.
Target_log_Likelihood_output1 --- The corresponding estimated maximum log 
                                  likelihood without constraints for beta.
Target_log_Likelihood_output2 --- The corresponding estimated maximum log 
                                  likelihood under beta = [0;0].
Target_log_Likelihood_output3 --- The corresponding estimated maximum log 
                                  likelihood under beta1 = 0.
Target_log_Likelihood_output4 --- The corresponding estimated maximum log 
                                  likelihood under beta2 = 0.
Test2 ---  The log-likelihood ratio statistics under beta = [0;0].
Test3 ---  The log-likelihood ratio statistics under beta1 = 0.
Test4 ---  The log-likelihood ratio statistics under beta2 = 0.
Where beta = [beta1;beta2], beta1 = beta_gender, beta2 = beta_age.
