function Output = Rot2MF(S_Info)
% This function transform structural and mode related information from 
% original coordinate frame (G09 simulation frame) to molecule frame so
% that rotatable bond align with z axis. This function take the atomic
% index from formatted G)( output file or GUI inputs to define the new
% origin and axes in molecule frame. Roatatonal average of these molecule
% information in an optional action. 

%% Process Inputs
XYZ      = S_Info.XYZ;
TDV      = S_Info.TDV;
Raman    = S_Info.Raman;
Mode_Num = S_Info.Mode_Num;


MF_Info = S_Info.MF_Info;
Center_Ind = MF_Info.Center_Ind;
Z_i_Ind    = MF_Info.Z_i_Ind;
Z_f_Ind    = MF_Info.Z_f_Ind;
XY_i_Ind   = MF_Info.XY_i_Ind;
XY_f_Ind   = MF_Info.XY_f_Ind;
Frame_Type = MF_Info.Frame_Type;
BondAvg    = MF_Info.BondAvg;

LF_Info = S_Info.LF_Info;
LF_Phi   = LF_Info.LF_Phi;
LF_Psi   = LF_Info.LF_Psi;
LF_Theta = LF_Info.LF_Theta;

%% Get Center and Raotation matrix
% Get Center XYZ
C_G09_Frame = sum(XYZ(Center_Ind,:),1)/length(Center_Ind);
XYZ_T = bsxfun(@minus,XYZ,C_G09_Frame);

% Get Ratational Matrix to rotate the molecule to defined frame 
Vec_Z  = XYZ(Z_f_Ind,:) - XYZ(Z_i_Ind,:);
Z      = Vec_Z/norm(Vec_Z);
Vec_XZ = XYZ(XY_f_Ind,:) - XYZ(XY_i_Ind,:);
Vec_XZ = Vec_XZ/norm(Vec_XZ);
Y      = cross(Z,Vec_XZ);
Y      = Y/norm(Y);
X      = cross(Y,Z);
X      = X/norm(X);

% Generate rotational matrix from G09 simulation frame to defined molecular
% frame
Mol_Frame      =zeros(3,3);
Mol_Frame(:,1) = X;
Mol_Frame(:,2) = Y;
Mol_Frame(:,3) = Z;
New_Frame    = eye(3);
Rot2MF = Euler_Rot(New_Frame,Mol_Frame);

% Rotate molecule definition from X-Z plane to Y-Z plane
switch Frame_Type
    case 1 %Frame_Type = 'XZ';
    case 2 %Frame_Type = 'YZ';
        R_XZ2YZ = R1_ZYZ_0(-pi/2,0,0);
        Rot2MF  = R_XZ2YZ*Rot2MF; 
end

% Generation of rotational matrix from molecular frame to lab frame
Rot2LF = R1_ZYZ_0(LF_Phi,LF_Psi,LF_Theta);

Rot_Total_XYZ = Rot2LF*Rot2MF;

XYZ_T_R = (Rot_Total_XYZ*XYZ_T')';

%% Rotate the TDV and Raman tensor accordingly
% Determine if doing bond rotational average around z axis
if BondAvg
   R_Bond_Avg = R1_ZYZ_1(0,0);
else
   R_Bond_Avg = eye(3); 
end

Rot_Total_mode = Rot2LF*R_Bond_Avg*Rot2MF;

% Rotated Transition Dipole Vector
TDV_Rot = (Rot_Total_mode*TDV')';

% Rotated Raman Tensor
Raman_Rot = zeros(size(Raman));
for i = 1:Mode_Num
    Raman_Rot(:,:,i) = Rot_Total_mode*squeeze(Raman(:,:,i))*Rot_Total_mode';
end

%% Output
Output.LF            = S_Info;
Output.LF.Center_Ind = Center_Ind;
Output.LF.XYZ        = XYZ_T_R;
Output.LF.TDV        = TDV_Rot;
Output.LF.Raman      = Raman_Rot;

Output.Orig = S_Info;

Output.Transformation.C_G09_Frame = C_G09_Frame;
Output.Transformation.Rot2MF      = Rot2MF;
Output.Transformation.Rot2LF      = Rot2LF;
Output.Transformation.R_Bond_Avg  = R_Bond_Avg;