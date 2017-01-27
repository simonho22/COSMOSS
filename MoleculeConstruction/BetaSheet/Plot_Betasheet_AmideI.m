function hF = Plot_Betasheet_AmideI(SData,GUI_Inputs)
%% PlotXYZfiles
%  
% Given the Stuctural infomation that generated by GetAmideI.m this
% function can plot the molecule and its' amide I modes.
% 
% ------- Version log -----------------------------------------------------
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
% clear all 
% SheetType = 'Anti';
% % SheetType = 'Para';
% N_Residue= 10;
% N_Strand = 3;
% TransV = [0,0,4];
% TwistV = [0,0,0];
% 
% Phi_D = 0;
% Psi_D = 0;
% Theta_D = 0;
% NLFreq = 1644;
% Anharm = 12;
% 
% BB        = ConstuctBetaSheet(SheetType,N_Residue,N_Strand,TransV,TwistV);
% Structure = GetAmideI(BB.Num_Atoms,...
%                       BB.XYZ,...
%                       BB.AtomName,...
%                       BB.FilesName,...
%                       'Phi_D',Phi_D,...
%                       'Psi_D',Psi_D,...
%                       'Theta_D',Theta_D,...
%                       'NLFreq',NLFreq,...
%                       'Anharm',Anharm);

%% Input parser
GUI_Inputs_C      = fieldnames(GUI_Inputs);
GUI_Inputs_C(:,2) = struct2cell(GUI_Inputs);
GUI_Inputs_C      = GUI_Inputs_C';

INPUT = inputParser;
INPUT.KeepUnmatched = 1;

% Default values
defaultPlot_Atoms = 1;
defaultPlot_Bonds = 1;
defaultPlot_Axis  = 1;

% Add optional inputs to inputparser object
addOptional(INPUT,'Plot_Atoms',defaultPlot_Atoms);
addOptional(INPUT,'Plot_Bonds',defaultPlot_Bonds);
addOptional(INPUT,'Plot_Axis' ,defaultPlot_Axis);

parse(INPUT,GUI_Inputs_C{:});

Plot_Atoms = INPUT.Results.Plot_Atoms;
Plot_Bonds = INPUT.Results.Plot_Bonds;
Plot_Axis  = INPUT.Results.Plot_Axis;

%% Rotate the molecule to Lab frame
XYZ      = SData.XYZ;
AtomName = SData.AtomName;
Center   = SData.LocCenter;
COM      = SData.COM;

%% Position info
C_Ind = strcmp(AtomName,'C');
O_Ind = strcmp(AtomName,'O');
N_Ind = strcmp(AtomName,'N');

% Carbon_Pos   = XYZ(SData.AtomSerNo(:,1),:);
% Oxygen_Pos   = XYZ(SData.AtomSerNo(:,2),:);
% Nitrogen_Pos = XYZ(SData.AtomSerNo(:,3),:);
% CarbonA_Pos  = XYZ(Structure.AtomSerNo(:,4),:);

% C terminus H/O atoms
C_Ind_H = SData.Extra.Ind_H;
C_Ind_O = SData.Extra.Ind_O;
C_H_Pos = XYZ(C_Ind_H,:);
C_O_Pos = XYZ(C_Ind_O,:);

hF = figure;
hold on

    %% draw atoms  
    if Plot_Atoms
        plot3(Center(:,1)  ,Center(:,2)  ,Center(:,3)  ,'LineStyle','none','Marker','d','MarkerFaceColor','w')

        plot3(XYZ(C_Ind,1),XYZ(C_Ind,2),XYZ(C_Ind,3),'LineStyle','none','Marker','o','MarkerFaceColor',[0,0,0],'MarkerSize',10)
        plot3(XYZ(O_Ind,1),XYZ(O_Ind,2),XYZ(O_Ind,3),'LineStyle','none','Marker','o','MarkerFaceColor',[1,0,0],'MarkerSize',10)
        plot3(XYZ(N_Ind,1),XYZ(N_Ind,2),XYZ(N_Ind,3),'LineStyle','none','Marker','o','MarkerFaceColor',[0,0,1],'MarkerSize',10)        

        plot3(C_H_Pos(:,1),C_H_Pos(:,2),C_H_Pos(:,3),'LineStyle','none','Marker','o','MarkerFaceColor','w','MarkerSize',10)
        plot3(C_O_Pos(:,1),C_O_Pos(:,2),C_O_Pos(:,3),'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerSize',10)

    end


    %% draws bonds
    if Plot_Bonds
        
        Conn = Connectivity_New(AtomName,XYZ);
        gplot3(Conn, XYZ);
        
%         % Chain
%             if eq(size(Carbon_Pos,1),1)
%                 % only one carbon, don't draw peptide chain
%             else
%                 Conn0 = Connectivity(Carbon_Pos,'BondLength',3.5);
%                 gplot3(Conn0, Carbon_Pos);
%             end
%         % C=O bond
%             C_O_XYZ = [Carbon_Pos;Oxygen_Pos];
%             Conn1 = Connectivity(C_O_XYZ,'BondLength',1.6);
%             gplot3(Conn1,C_O_XYZ,'LineWidth',2,'Color',[0,0,0]);
%         % C-N bond
%             C_N_XYZ = [Carbon_Pos;Nitrogen_Pos];
%             Conn2 = Connectivity(C_N_XYZ,'BondLength',1.6);
%             gplot3(Conn2,C_N_XYZ,'LineWidth',1,'Color',[0,0,0]);

    end  

    %% Draw molecular and Lab frame
    if Plot_Axis
        hAx = findobj(hF,'type','axes');
        Lab_Frame = [1,0,0;
                     0,1,0;
                     0,0,1 ];
        
        PlotRotMolFrame(hAx,Lab_Frame,Lab_Frame,COM)
    end
    
    %% Draw labeled atoms
    Plot_Label = 1;
    if Plot_Label
        
        L_Index = GUI_Inputs.L_Index;
        L_C = Center(L_Index,:);
        plot3(L_C(:,1),L_C(:,2),L_C(:,3),'LineStyle','none','Marker','o','MarkerFaceColor','g','MarkerSize',11)

    end
    
hold off

%% figure setting
axis image;
rotate3d on
grid on
box on
view([0,0])
xlabel('X')
ylabel('Y')

% title
Extra = SData.Extra;
FilesName     = SData.FilesName;
FilesName_Reg = regexprep(FilesName,'\_','\\_');
TransV_String = sprintf('T: %1.2f, %1.2f, %1.2f; ' ,Extra.TransV(1),Extra.TransV(2),Extra.TransV(3));
TwistV_String = sprintf('Tw: %3.0f, %3.0f, %3.0f; ',Extra.TwistV(1),Extra.TwistV(2),Extra.TwistV(3));
RotV_String   = sprintf('R: %3.0f, %3.0f, %3.0f; ' ,Extra.RotV(1),Extra.RotV(2),Extra.RotV(3));
Title_String  = {[FilesName_Reg, ', ', TransV_String], [TwistV_String, RotV_String]};
title(Title_String,'FontSize',14); 