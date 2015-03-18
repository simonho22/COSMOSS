function PlotXYZfiles_Acid(Struc_Data)
%% PlotXYZfiles
%  
% Given the Stuctural infomation that generated by GetAmideI.m this
% function can plot the molecule and its' amide I modes.
% 
% ------- Version log -----------------------------------------------------
% 
% Ver. 1.5  140723  Add hydrogen atom
% 
% Ver. 1.4  140605  Readuce the process for reading XYZ data
% 
% Ver. 1.3  131107  Add imput "Rot_Mat" to rotate molecue as user assigned
%                   This is the correction follow by v1.2 of
%                   OneDSFG_AmideI.m
% 
% Ver. 1.2  130930  Move gplot3 from Molecular_Plot to here to accomodate
%                   the update of molecular_plot
% 
% Ver. 1.1  130814  Bug in atom position index fixed 
% 
% Ver. 1.0  130729  Isolated from TwoDSFG_Simulation
% 
% ------------------------------------------------------------------------
% Copyright Jia-Jung Ho, 2013

%% Debug
% PDB_Data    = GetAcid('Debug');
% Orientation = [0,0,0];

%% Read orientation inputs from GUI
% PDB_Data = handles.PDB_Data;

% Phi_D   = str2double(get(handles.Mol_Phi,'String'));
% Psi_D   = str2double(get(handles.Mol_Psi,'String'));
% Theta_D = str2double(get(handles.Mol_Theta,'String'));
% Orientation = [Phi_D,Psi_D,Theta_D];

%% Main

% Generate rotation matrix
% Orientation = Orientation/180*pi; % turn to radius unit
% 
% Phi_Avg   = Orientation(1);
% Psi_Avg   = Orientation(2);
% Theta_Avg = Orientation(3);

% Rot_Mat = R1_ZYZ_0(Phi_Avg,Psi_Avg,Theta_Avg);
Rot_Mat = eye(3);

% Rotate molecule and transition dipole 
R          = (Rot_Mat * Struc_Data.XYZ')';
Rot_Center = (Rot_Mat * Struc_Data.center')';
Rot_mu     = (Rot_Mat * Struc_Data.mu')';

%% draw molecule
figure; hold on
Conn = Connectivity(Struc_Data.XYZ);
gplot3(Conn,R);
% axis auto;
LL = 5;
axis([-LL,LL,-LL,LL,-LL,LL,-1,1])
rotate3d on

%% Define C,OD,OS atom position
Carbon_Pos   = R(Struc_Data.AtomSerNo(:,1),:);
OxygenD_Pos  = R(Struc_Data.AtomSerNo(:,2),:);
OxygenS_Pos  = R(Struc_Data.AtomSerNo(:,3),:);
Hydrogen_Pos = R(Struc_Data.AtomSerNo(:,4),:);

% Vector scale Factor
SF = 10;

% line(Test_X',Test_Y',Test_Z','LineWidth',2)
quiver3(Rot_Center(:,1),Rot_Center(:,2),Rot_Center(:,3),...
        Rot_mu(:,1)./SF,Rot_mu(:,2)./SF,Rot_mu(:,3)./SF,0,...
        'LineWidth',2,...
        'Color',[0 1 0],...
        'AutoScaleFactor',0.5);

plot3(Rot_Center(:,1)  ,Rot_Center(:,2)  ,Rot_Center(:,3)  ,'LineStyle','none','Marker','d','MarkerFaceColor','w')
plot3(Carbon_Pos(:,1)  ,Carbon_Pos(:,2)  ,Carbon_Pos(:,3)  ,'LineStyle','none','Marker','o','MarkerFaceColor','k','MarkerSize',10)
plot3(OxygenD_Pos(:,1) ,OxygenD_Pos(:,2) ,OxygenD_Pos(:,3) ,'LineStyle','none','Marker','o','MarkerFaceColor',[1,0,0],'MarkerSize',10)
plot3(OxygenS_Pos(:,1) ,OxygenS_Pos(:,2) ,OxygenS_Pos(:,3) ,'LineStyle','none','Marker','o','MarkerFaceColor',[1,0,0],'MarkerSize',10)
plot3(Hydrogen_Pos(:,1),Hydrogen_Pos(:,2),Hydrogen_Pos(:,3),'LineStyle','none','Marker','o','MarkerFaceColor',[1,1,1],'MarkerSize',10)

hold off

xlabel('X')
ylabel('Y')
zlabel('Z')
