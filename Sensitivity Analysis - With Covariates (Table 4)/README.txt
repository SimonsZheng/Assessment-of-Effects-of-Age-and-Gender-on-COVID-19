This folder contains the matlab code for producing the results in Table 4. 
It includes

Data_Generator.m -- This is a subroutine program to generate the simulated 
data whose underlying conditional density of V given X is the proposed mix-
-ture regression model with parameter(lambda,alpha,beta,theta).

Sensitivity Analysis.m -- This is the main program, which gives those resu-
                          -lts of simulation in various cases in Table 4.

Parallel_Computing_Est.m -- This is a subroutine program to calculate the 
                            estimate under multi-random initial values set-
                            -ting.

and some other supporting subroutine programs.

Note 1: As we do not set random seeds in our codes, the results may have a 
little difference but this does not affect the final analysis.

Note 2: 
SimulationData in ReviewSimulationResult.mat is the dataset we use to prod-
-uce the results in Table 4.

Rnd10Est"X" in ReviewSimulationResult.mat contains the estimates which gen-
-erate those results in Table 4. 
