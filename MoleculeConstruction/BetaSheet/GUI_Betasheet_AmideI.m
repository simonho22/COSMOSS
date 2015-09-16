function GUI = GUI_Betasheet_AmideI(fig) 
%% Add base layout
MainLayout = uix.VBoxFlex(...
    'Parent',fig,...
    'Spacing',1,...
    'Padding',5);

%% Title
uicontrol('Parent',MainLayout,...
    'Style','text',...
    'String','Betasheet generation',...
    'BackgroundColor',[0,1,1]);
%% Size of betasheet
BetasheetSizeLayout = uix.HBoxFlex('Parent',MainLayout,...
    'Padding', 5, 'Spacing', 5);

    TextBox = uix.VBox('Parent',BetasheetSizeLayout);
        uicontrol('Parent',TextBox,...
        'Style','text',...
        'String','# residues/strand:',...
        'HorizontalAlignment','right',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',TextBox,...
        'Style','text',...
        'String','# strands:',...
        'HorizontalAlignment','right',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    

    EditBox = uix.VBox('Parent',BetasheetSizeLayout);
        uicontrol('Parent',EditBox,...
        'Style','edit',...
        'String','10',...
        'Tag','N_Residue',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',EditBox,...
        'Style','edit',...
        'String','2',...
        'Tag','N_Strand',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
set(BetasheetSizeLayout,'Widths',[120,-1])

%% Relative Oreintation between strands inputs
OreintationLayout = uix.HBox('Parent',MainLayout,...
    'Padding', 3, 'Spacing', 3);

    VtextBox = uix.VBox('Parent',OreintationLayout,...
    'Padding', 3, 'Spacing', 3);
        uicontrol('Parent',VtextBox,...
        'Style','text',...
        'String','Ang/Deg',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',VtextBox,...
        'Style','text',...
        'String','Trans.',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);

        uicontrol('Parent',VtextBox,...
        'Style','text',...
        'String','Rot.',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
    
    XBox = uix.VBox('Parent',OreintationLayout,...
    'Padding', 3, 'Spacing', 3);
        uicontrol('Parent',XBox,...
        'Style','text',...
        'String','X',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',XBox,...
        'Style','edit',...
        'String','0',...
        'Tag','Trans_X',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',XBox,...
        'Style','edit',...
        'String','0',...
        'Tag','Rot_X',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);

    Vis_BeamBox1D = uix.VBox('Parent',OreintationLayout,...
    'Padding', 3, 'Spacing', 3);
        uicontrol('Parent',Vis_BeamBox1D,...
        'Style','text',...
        'String','Y',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',Vis_BeamBox1D,...
        'Style','edit',...
        'String','0',...
        'Tag','Trans_Y',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',Vis_BeamBox1D,...
        'Style','edit',...
        'String','0',...
        'Tag','Rot_Y',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
    Sig_BeamBox1D = uix.VBox('Parent',OreintationLayout,...
    'Padding', 3, 'Spacing', 3);
        uicontrol('Parent',Sig_BeamBox1D,...
        'Style','text',...
        'String','Z',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',Sig_BeamBox1D,...
        'Style','edit',...
        'String','0',...
        'Tag','Trans_Z',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',Sig_BeamBox1D,...
        'Style','edit',...
        'String','0',...
        'Tag','Rot_Z',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
set(OreintationLayout,'Widths',[-2,-1,-1,-1])

%% Button
uicontrol( 'Parent', MainLayout, ...
'String', 'Update Structure',...
'Callback',@(hObject,eventdata)Model_Betasheet_AmideI('UpdateStructure',hObject,eventdata,guidata(hObject)));

uicontrol( 'Parent', MainLayout, ...
'String', 'Plot Molecule',...
'Callback',@(hObject,eventdata)Model_Betasheet_AmideI('PlotMolecule',hObject,eventdata,guidata(hObject)));

%% set sizes
set(MainLayout,'Height',[20,50,100,-1,-1])

%% output handles
GUI = guihandles(fig);
    