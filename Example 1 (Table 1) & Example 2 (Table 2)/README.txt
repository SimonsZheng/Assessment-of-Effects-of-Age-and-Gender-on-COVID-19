This folder contains the matlab code for producing the results in Example 1
 & 2. It includes

Data_Generator.m -- This is a subroutine program to generate the simulated 
data whose underlying conditional density of V given X is the proposed mix-
-ture regression model with parameter(lambda,alpha,beta,theta).

MAIN.m -- This is the main program, which gives those results of simulation 
          in various cases(Example 1 & 2).
          Now the setting in MAIN.m is those settings in Example 1. If you 
          try to reproduce those results in Example 2, you can change the 
          setting parameters and delete the Rnd100 setting in MAIN.m.

FS_Parallel_Computing_Est.m -- This is a subroutine program to calculate t-
                               -he estimate under FS setting.

Parallel_Computing_Est.m -- This is a subroutine program to calculate the 
                            estimate under multi-random initial values set-
                            -ting.

SR_Parallel_Computing_Est.m -- This is a subroutine program to calculate t-
                               -he estimate under SR setting.

and some other supporting subroutine programs.

Note 1: As we do not set random seeds in our codes, the results may have a 
little difference but this does not affect the final analysis.

Note 2: 
SimulationData in ReviewSimulationResult-FS-Rnd10-Rnd100.mat is the dataset 
we use to produce the results in Example 1.

SimulationData in ReviewSimulationResult-FS-Rnd10.mat is the dataset we use 
to produce the results in Example 2.

"X"Est in ReviewSimulationResult-FS-Rnd10-Rnd100.mat and in ReviewSimulati-
-onResult-FS-Rnd10.mat, contains the 200 estimates for 200 simulated datas-
-ets in ReviewSimulationResult-FS-Rnd10-Rnd100.mat and ReviewSimulationRes-
-ult-FS-Rnd10.mat. They produce those results we present in the paper.

Note 3: Under the settings in Example 1, it costs about 2.5 hours to produ-
ce the Rnd10 results and almost one day to produce the Rnd100 results. Som-
-ething similar happens in Example 2. The processor in use is Intel Core i7
-9750H (4.5GHz) and we use the parallel pool (6 works) on local, a paralle-
-l computing framework in MATLAB.
