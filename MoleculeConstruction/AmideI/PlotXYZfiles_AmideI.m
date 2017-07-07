function hF = PlotXYZfiles_AmideI(hAx,SData,GUI_Inputs)
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
% SData = Data_PDB_AmideI.Structure;
% GUI_Inputs.L_Index = [1,2];
% GUI_Inputs.Plot_SideChain = 0;

%% Input parser
GUI_Inputs_C      = fieldnames(GUI_Inputs);
GUI_Inputs_C(:,2) = struct2cell(GUI_Inputs);
GUI_Inputs_C      = GUI_Inputs_C';

INPUT = inputParser;
INPUT.KeepUnmatched = 1;

% Default values
defaultPlot_Atoms     = 1;
defaultPlot_Bonds     = 1;
defaultPlot_Axis      = 1;
defaultPlot_SideChain = 0;
defaultPlot_Label     = 1;
defaultL_Index        = [];

% Add optional inputs to inputparser object
addOptional(INPUT,'Plot_Atoms'     ,defaultPlot_Atoms);
addOptional(INPUT,'Plot_Bonds'     ,defaultPlot_Bonds);
addOptional(INPUT,'Plot_Axis'      ,defaultPlot_Axis);
addOptional(INPUT,'Plot_SideChain' ,defaultPlot_SideChain);
addOptional(INPUT,'Plot_Label'     ,defaultPlot_Label);
addOptional(INPUT,'L_Index'        ,defaultL_Index);

parse(INPUT,GUI_Inputs_C{:});

Plot_Atoms     = INPUT.Results.Plot_Atoms;
Plot_Bonds     = INPUT.Results.Plot_Bonds;
Plot_Axis      = INPUT.Results.Plot_Axis;
Plot_SideChain = INPUT.Results.Plot_SideChain;
Plot_Label     = INPUT.Results.Plot_Label;
L_Index        = INPUT.Results.L_Index;

%% Main
XYZ      = SData.XYZ;
AtomName = SData.AtomName;
Center   = SData.LocCenter;
CoM      = SData.CoM;
AmideIAtomSerNo = SData.Extra.AmideIAtomSerNo;

%% Position info
C_Ind = AmideIAtomSerNo(:,1);
O_Ind = AmideIAtomSerNo(:,2);
N_Ind = AmideIAtomSerNo(:,3);

% Add C_Alpha atom to complelet the backbone
Index_All = 1:length(AtomName);
CA_Ind = Index_All(strcmp(AtomName,'CA'))';
BB_Ind = [C_Ind;O_Ind;N_Ind;CA_Ind];

XYZ_C = XYZ(C_Ind,:);
XYZ_O = XYZ(O_Ind,:);
XYZ_N = XYZ(N_Ind,:);


% Prep hAx 
if ~ishandle(hAx)
    hF = figure; 
    hAx = axes('Parent',hF);
    disp('Draw in new figure')
end

hold(hAx,'on')

    %% draw bonds
    if Plot_Bonds
        XYZ_bond = XYZ(BB_Ind,:);
        Atom_bond = AtomName(BB_Ind);
        
        Conn = Connectivity(Atom_bond,XYZ_bond);
        gplot3(Conn,XYZ_bond,'LineWidth',1,'Color',[0,0,0],'Parent',hAx);
    end
    
    if Plot_SideChain
        XYZ_Side = XYZ;
        Atom_Side = AtomName;
        
        Conn = Connectivity(Atom_Side,XYZ_Side);
        gplot3(Conn,XYZ_Side,'Parent',hAx);
    end
    %% Draw atoms
    if Plot_Atoms
        plot3(hAx,Center(:,1)  ,Center(:,2)  ,Center(:,3)  ,'LineStyle','none','Marker','d','MarkerFaceColor','w')
        
        plot3(hAx,XYZ_C(:,1),XYZ_C(:,2),XYZ_C(:,3),'LineStyle','none','Marker','o','MarkerFaceColor',[0,0,0],'MarkerSize',10)
        plot3(hAx,XYZ_O(:,1),XYZ_O(:,2),XYZ_O(:,3),'LineStyle','none','Marker','o','MarkerFaceColor',[1,0,0],'MarkerSize',10)
        plot3(hAx,XYZ_N(:,1),XYZ_N(:,2),XYZ_N(:,3),'LineStyle','none','Marker','o','MarkerFaceColor',[0,0,1],'MarkerSize',10)        
    end
    
    %% Draw molecular and Lab frame
    if Plot_Axis
        hAx = findobj(hF,'type','axes');
        Lab_Frame = [1,0,0;
                     0,1,0;
                     0,0,1 ];
        
        PlotRotMolFrame(hAx,Lab_Frame,Lab_Frame,CoM)
    end
    
    %% Draw labeled atoms
    if Plot_Label
        %L_Index = GUI_Inputs.L_Index;
        %L_Center = Center(L_Index,:);
        L_C = XYZ_C(L_Index,:);
        L_O = XYZ_O(L_Index,:);
        L_N = XYZ_N(L_Index,:);

        %plot3(L_Center(:,1),L_Center(:,2),L_Center(:,3),'LineStyle','none','Marker','o','MarkerFaceColor','g','MarkerSize',11)
        plot3(hAx,L_C(:,1),L_C(:,2),L_C(:,3),'LineStyle','none','Marker','o','MarkerFaceColor',[0,1,0],'MarkerSize',10)
        plot3(hAx,L_O(:,1),L_O(:,2),L_O(:,3),'LineStyle','none','Marker','o','MarkerFaceColor',[0,1,0],'MarkerSize',10)
        plot3(hAx,L_N(:,1),L_N(:,2),L_N(:,3),'LineStyle','none','Marker','o','MarkerFaceColor',[0,1,0],'MarkerSize',10)    
%         MarkerSize = 150;
%         s_C = scatter3(L_C(:,1),L_C(:,2),L_C(:,3),MarkerSize,'MarkerFaceColor',[0,1,0],'MarkerEdgeColor','none');
%         s_O = scatter3(L_O(:,1),L_O(:,2),L_O(:,3),MarkerSize,'MarkerFaceColor',[0,1,0],'MarkerEdgeColor','none');
%         s_N = scatter3(L_N(:,1),L_N(:,2),L_N(:,3),MarkerSize,'MarkerFaceColor',[0,1,0],'MarkerEdgeColor','none');
%         alpha([s_C,s_O,s_N],0.5)
    end
hold(hAx,'off')

%% figure setting
hAx.XLabel.String = 'X';
hAx.YLabel.String = 'Y';
axis(hAx,'image');
rotate3d(hAx,'on')