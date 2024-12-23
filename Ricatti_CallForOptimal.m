K_ps1 = 100;
K_ps2 = 100;
T_ps1 = 20; % Define the value of T_ps1
T_ps2 = 20;  % Define the value of T_ps2
T_t1  = 0.5;  % Define the value of T_r1
T_t2  = 0.5;  % Define the value of T_r2
T_sg1 = 0.4;  % Define the value of T_sg1
T_sg2 = 0.4;  % Define the value of T_sg2
R1    = 3;  % Define the value of R1
R2    = 3;  % Define the value of R2
a12   = 1;  % Define the value of a12
b1    = 0.425;  % Define the value of b1
b2    = 0.425; % Define the value of b2
PIT = 0.05;




A = [
    %1      2           3       4       5       6       7       8       9
  -1/T_ps1  K_ps1/T_ps1 0       0       0       0  -K_ps1/T_ps1 0       0;
    0       -1/T_t1     1/T_t1  0       0       0       0       0       0;
-1/(R1*T_sg1) 0        -1/T_sg1 0       0       0       0       0       0;
     0       0          0    -1/T_ps2 K_ps2/T_ps2 0   a12*K_ps2/T_ps2 0  0;
     0       0          0       0     -1/T_t2  1/T_t2   0       0       0;
    0       0          0    -1/(R2*T_sg2)  0   -1/T_sg2   0       0       0;
   PIT      0          0      -PIT        0       0       0       0       0;
    b1      0           0       0       0       0       1       0       0;
     0      0       0      b2      0       0     -a12      0       0;
];

% Matrix B^T
BT = [
  0, 0, 1/T_sg1, 0, 0, 0, 0, 0, 0;
  0, 0, 0, 0,0, 1/T_sg2, 0, 0, 0];

B = BT';

%Cy= CTx -> y is [Ace1;Ace2]
CT = [
  0, 0, 0, 0, 0, 0, 0, 1, 0;
  0, 0, 0, 0,0, 0, 0, 0, 1];

%D is zerso

D = zeros(9,2);

% Matrix F^T 
FT = [
  -K_ps1/T_ps1, 0, 0, 0, 0, 0, 0, 0,0;
  0,0,0, -K_ps2/T_ps2, 0, 0, 0, 0, 0];
%Matrix for system that noise maybe interfered

F = FT';

%Q
Q = [
    %1      2           3       4       5       6       7       8       9
    b1^2    0           0       0       0       0       b1      0       0;
     0      0           0       0       0       0       0       0       0;   
     0      0           0       0       0       0       0       0       0;
     0      0           0       b2^2    0       0    -a12*b2    0       0;
     0      0           0       0       0       0       0       0       0;   
     0      0           0       0       0       0       0       0       0;
     b1     0           0    -a12*b2    0       0    (1+a12)^2  0       0;
     0      0           0       0       0       0       0       1       0;
     0      0           0       0       0       0       0       0       1;
];

%R
R_ = eye(2);

%Ricatti
[K,S,P] = lqr(A,B,Q,R_);

%For state
x0 = [0;0.01;0;0;0;0;0;0;0];


%Set another examples
%{
Q2 = [
    %1      2           3       4       5       6       7       8       9
    1   0           0       0       0       0           1      0       0;
     0      0           0       0       0       0       0       0       0;   
     0      0           0       0       0       0       0       0       0;
     0      0           0       1       0       0       1       0       0;
     0      0           0       0       0       0       0       0       0;   
     0      0           0       0       0       0       0       0       0;
     1     0           0       1       0       0       1       0       0;
     0      0           0       0       0       0       0       1       0;
     0      0           0       0       0       0       0       0       1;
];
[K2,S2,P2] = lqr(A,B,Q2,R);
%}

%Demand
z1 = 0.01;
z2 = 0.00;
Z = [z1;z2];

%Proportional
Kp = K(:,1:7); %every row, column 1-7
Ki = K(:,8:9);



