This folder contains the matlab code for producing the results in Table 8.
It includes SA_EM_for_COVIDDATA.m and some other supporting subroutine 
programs.

SA_EM_for_COVIDDATA.m --This is the main program, which gives those results 
                        of simulations under various constraints in Table 8.

RealData.mat -- RealData = [V,X];
                RealData is a large matrix: includes the following elements.
                V --- the observed time lag  of a confirmed case between t-
                      -he departure from Wuhan and the symptom onset.
                X --- the observed risk factor.In real data,X=[Gender,Age];
