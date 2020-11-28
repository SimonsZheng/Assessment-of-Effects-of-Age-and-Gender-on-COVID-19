This folder contains the matlab code for producing the results in Table 5 &
 6. It includes

Data_Generator.m -- This is a subroutine program to generate the simulated 
data whose underlying conditional density of V given X is the proposed mix-
-ture regression model with parameter(lambda,alpha,beta,theta).

TEST.m -- This is the main program, which gives those results of simulation 
          in various cases.(Table 5 & 6). Now the setting in MAIN.m is the 
          setting for the case beta = [0.8,0]' and n = 500. If you try to 
          reproduce our results, just change the corresponding setting in 
          TEST.m.

Hypothesis_Test1.m -- This is a subroutine program to calculate the likeli-
                      -hood without constraints for beta.

Hypothesis_Test2.m -- This is a subroutine program to calculate the likeli-
                      -hood under beta = [0;0].

Hypothesis_Test3.m -- This is a subroutine program to calculate the likeli-
                      -hood under beta1 = 0.

Hypothesis_Test4.m -- This is a subroutine program to calculate the likeli-
                      -hood under beta2 = 0.

and some other supporting subroutine programs.

Note 1: SimulationData in Test_Beta_[0.8,0.6]-N500.mat is the dataset we u-
        -se to produce the results in Table 5 with beta = [0.8,0]' and n = 
        500.And
Likelihood1 - The corresponding estimated maximum likelihood without const-
              raints for beta.

Likelihood2 - The corresponding estimated maximum likelihood under beta = [
              0;0].

Likelihood3 - The corresponding estimated maximum likelihood under beta1=0.
Likelihood4 - The corresponding estimated maximum likelihood under beta2=0.

Note 2: The processor in use is Intel Core i7-9750H (4.5GHz) and we use the 
parallel pool (6 works) on local, a parallel computing framework in MATLAB.
