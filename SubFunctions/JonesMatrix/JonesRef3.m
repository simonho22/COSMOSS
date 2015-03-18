function Rps3 = JonesRef3(A_Sum,A_Vis,A_IR)
%JONESREF3
%    RPS3 = JONESREF3(A_Sum,A_Vis,A_IR)

%    This function was generated by the Symbolic Math Toolbox version 5.8.
%    14-Nov-2013 14:53:28

t2 = cos(A_Sum);
t3 = cos(A_Vis);
t4 = cos(A_IR);
t5 = sin(A_IR);
t6 = sin(A_Vis);
t7 = sin(A_Sum);
Rps3 = reshape([-t2.*t3.*t4,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-t2.*t3,0.0,0.0,0.0,0.0,0.0,0.0,-t2.*t3.*t5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-t2.*t4,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-t2,0.0,0.0,0.0,0.0,0.0,0.0,-t2.*t5,0.0,0.0,0.0,0.0,0.0,-t2.*t4.*t6,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-t2.*t6,0.0,0.0,0.0,0.0,0.0,0.0,-t2.*t5.*t6,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t3.*t4,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t3,0.0,0.0,0.0,0.0,0.0,0.0,t3.*t5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t4,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,t5,0.0,0.0,0.0,0.0,0.0,t4.*t6,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t6,0.0,0.0,0.0,0.0,0.0,0.0,t5.*t6,0.0,0.0,0.0,t3.*t4.*t7,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t3.*t7,0.0,0.0,0.0,0.0,0.0,0.0,t3.*t5.*t7,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t4.*t7,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t7,0.0,0.0,0.0,0.0,0.0,0.0,t5.*t7,0.0,0.0,0.0,0.0,0.0,t4.*t6.*t7,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t6.*t7,0.0,0.0,0.0,0.0,0.0,0.0,t5.*t6.*t7,0.0,0.0,0.0,0.0,0.0,0.0,0.0],[8, 27]);
