# Optimal-Control-Design-for-Two-Area-Load-Frequency-Control
Implemented the control parameter and design terminology from I.J. Nagrath, D.P. Kothari, R.C. Desai, Modern power system analysis, third edition. McGraw-Hill (2003)

## Summary
An extended power system can be divided into several load control areas interconnected by tie lines.

This post considers a two-area case, connected by a single tie line. The system in one area has step load changes ($\Delta P_{D1}$) of 0.01 pu.

To design an optimal control for a two-area system. The signal generated by the integral control from the two-area system is used as control inputs u1 and u2.
By using the LQR controller, optimal control requires that the steady state values of system states and control input vectors, including frequency deviation and changes in power tie line, have to be 0 for the cost function to have a minimum.

The state variables and input signals are shown in the picture **"State Space model.png"**

Comparisons of both control performances are shown below. You can see them in the **"results"** folder.
#Frequency deviation:
![Frequency deviation](https://github.com/user-attachments/assets/16150a50-f64d-4eaf-962c-c3231ed48ec7)
#Power in Tie Line
![Power Tie line](https://github.com/user-attachments/assets/285623ee-b2a4-435c-92bb-3274da8e2f03)

## File descriptions
**1. CallForSingleArea.m** - please run before opening **Optimal2Area_2Machine.slx**, this file contains parameters of the 2-area load frequency control with integral control.

**2. Optimal2Area_2Machine.slx** - run after calling **CallForSingleArea.m** to get the simulated response data.

**3. Ricatti_CallForOptimal.m** - please run before opening **optimal2Area_Optimal.slx**, this file contains parameters of the 2-area load frequency control with optimal control.

**4. optimal2Area_Optimal.slx** - run after calling **Ricatti_CallForOptimal.m** to get the simulated response data.

**5. plot_shown.m** - plot to compare the performance of the integral control and optimal control, run after getting simulated frequency deviation and changes in the power tie line data. 
For convenience, download the simulated data from **data** and put them in the same folder as **plot_shown.m** to run plot_shown.m without needing to run the Simulink files 2. and 4.

**6. data** - contains the simulated data from Simulink files 2. and 4.

**7. results** - contains images comparing the performance of both controls, get by running **plot_shown.m**.





