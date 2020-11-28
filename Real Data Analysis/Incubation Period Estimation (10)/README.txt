This folder contains the matlab code for producing the results in Table 10.
It includes

DataProcessing_and_Estimation.m -- This is the data pre-processing program,
                                   which gives the transformed data and the
                                   parameter estimates.

Bootstrap_Estimation.m -- This is a subroutine program, which gives those 
                          bootstrapped estimates of the parameter under mo-
                          -del (3) in the paper.

Quantile_Calculation.m -- This a subroutine program giving the results in 
                          Table 10.

and some other supporting subroutine programs.

RealData.mat -- RealData = [V,X];
                RealData is a large matrix: includes the following elements.
                V --- the observed time lag of a confirmed case between the 
                      departure from Wuhan and the symptom onset.
                X --- the observed risk factor.In real data,X=[Gender,Age];


Bootstrap_Samples_and_Results.mat -- It contains

Bootstrap_Results --- The bootstrapped estimates of the parameter under mo-
                      -del (3) in the paper.

Resample_data --- The bootstrapped samples we use to produce the results in
                  Table 10.

Resample_Newdata --- The bootstrapped samples after transforming Resample_d
                     ata.
