function GUI = GUI_TwoDGrid(fig)
%% Add base layout
MainLayout = uix.VBoxFlex(...
    'Parent',fig,...
    'Spacing',1,...
    'Padding',5);

MonomerPanel = uix.BoxPanel( ...
    'Parent',MainLayout,...
    'Title','Monomer Parameters','FontSize',14);

TwoDGridPanel = uix.BoxPanel( ...
    'Parent',MainLayout,...
    'Title','2D Grid Parameters','FontSize',14);

LabelPanel = uix.BoxPanel( ...
    'Parent',MainLayout,...
    'Title','Local Mode Frequency','FontSize',14);

FigurePanel = uix.BoxPanel( ...
    'Parent',MainLayout,...
    'Title','Molecule figure options','FontSize',14);

ButtonBox = uix.VBoxFlex( ...
    'Parent', MainLayout,...
    'Padding', 2);

set(MainLayout,'Heights',[-1,-1,120,50,-1])

%% Monomer panel
MonomerPanelLayout = uix.HBox('Parent',MonomerPanel,...
    'Padding', 3, 'Spacing', 3);

    VtextBox = uix.VBox('Parent',MonomerPanelLayout,...
    'Padding', 3, 'Spacing', 3);
        uicontrol('Parent',VtextBox,...
        'Style','text',...
        'String','Deg.',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',VtextBox,...
        'Style','text',...
        'String','Angles',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);

        uicontrol('Parent',VtextBox,...
        'Style','text',...
        'String','Delta',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
    PhiBox = uix.VBox('Parent',MonomerPanelLayout,...
    'Padding', 3, 'Spacing', 3);
        uicontrol('Parent',PhiBox,...
        'Style','text',...
        'String','Phi',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',PhiBox,...
        'Style','edit',...
        'Tag','Ang_Phi',...
        'String','0',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);

        uicontrol('Parent',PhiBox,...
        'Style','edit',...
        'Tag','Delta_Phi',...
        'String','0',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
    PsiBox = uix.VBox('Parent',MonomerPanelLayout,...
    'Padding', 3, 'Spacing', 3);
        uicontrol('Parent',PsiBox,...
        'Style','text',...
        'String','Psi',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',PsiBox,...
        'Style','edit',...
        'Tag','Ang_Psi',...
        'String','0',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);

        uicontrol('Parent',PsiBox,...
        'Style','edit',...
        'Tag','Delta_Psi',...
        'String','0',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
    ThetaBox = uix.VBox('Parent',MonomerPanelLayout,...
    'Padding', 3, 'Spacing', 3);
        uicontrol('Parent',ThetaBox,...
        'Style','text',...
        'String','Theta',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',ThetaBox,...
        'Style','edit',...
        'Tag','Ang_Theta',...
        'String','0',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);

        uicontrol('Parent',ThetaBox,...
        'Style','edit',...
        'Tag','Delta_Theta',...
        'String','0',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
set(MonomerPanelLayout,'Widths',[60,-1,-1,-1])
    
%% Grid Panel
TwoDGridPanelLayout = uix.HBox('Parent',TwoDGridPanel,...
    'Padding', 3, 'Spacing', 3);

    VtextBox = uix.VBox('Parent',TwoDGridPanelLayout,...
    'Padding', 3, 'Spacing', 3);
        uicontrol('Parent',VtextBox,...
        'Style','text',...
        'String','',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',VtextBox,...
        'Style','text',...
        'String','Vec 1',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);

        uicontrol('Parent',VtextBox,...
        'Style','text',...
        'String','Vec 2',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
    VecBox = uix.VBox('Parent',TwoDGridPanelLayout,...
    'Padding', 3, 'Spacing', 3);
        uicontrol('Parent',VecBox,...
        'Style','text',...
        'String','Vector',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',VecBox,...
        'Style','edit',...
        'Tag','Vec_1',...
        'String','7,0,0',...
        'HorizontalAlignment','right',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);

        uicontrol('Parent',VecBox,...
        'Style','edit',...
        'Tag','Vec_2',...
        'String','0,4,0',...
        'HorizontalAlignment','right',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
    NumberBox = uix.VBox('Parent',TwoDGridPanelLayout,...
    'Padding', 3, 'Spacing', 3);
        uicontrol('Parent',NumberBox,...
        'Style','text',...
        'String','# Mol.',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',NumberBox,...
        'Style','edit',...
        'Tag','N_1',...
        'String','2',...
        'HorizontalAlignment','right',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);

        uicontrol('Parent',NumberBox,...
        'Style','edit',...
        'Tag','N_2',...
        'String','3',...
        'HorizontalAlignment','right',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
    
set(TwoDGridPanelLayout,'Widths',[60,-2,-2])

%% Labeling panel
LabelPanelLayout = uix.HBoxFlex('Parent',LabelPanel,...
    'Padding', 5, 'Spacing', 5);

    Freq_TextBox = uix.VBox('Parent',LabelPanelLayout);
        uicontrol('Parent',Freq_TextBox,...
        'Style','text',...
        'String','Non-Labeled Freq:',...
        'HorizontalAlignment','right',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',Freq_TextBox,...
        'Style','text',...
        'String','Labeled Freq:',...
        'HorizontalAlignment','right',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',Freq_TextBox,...
        'Style','text',...
        'String','Anharmonicty:',...
        'HorizontalAlignment','right',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',Freq_TextBox,...
        'Style','text',...
        'String','Index of modes:',...
        'HorizontalAlignment','right',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
    

    Freq_EditBox = uix.VBox('Parent',LabelPanelLayout);
        uicontrol('Parent',Freq_EditBox,...
        'Style','edit',...
        'String','1700',...
        'Tag','NLFreq',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',Freq_EditBox,...
        'Style','edit',...
        'String','1680',...
        'Tag','LFreq',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',Freq_EditBox,...
        'Style','edit',...
        'String','20',...
        'Tag','Anharm',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);   
        
        uicontrol('Parent',Freq_EditBox,...
        'Style','edit',...
        'String','None',...
        'Tag','L_Index',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);

set(LabelPanelLayout,'Widths',[140,-1])

%% Plot molecule options
FigurePanelLayout = uix.HBox('Parent',FigurePanel,...
    'Padding', 5, 'Spacing', 5);

        uicontrol('Parent',FigurePanelLayout,...
                  'Style','checkbox',...
                  'String','Atoms,',...
                  'Value',1,...
                  'Tag','Plot_Atoms',...
                  'HorizontalAlignment','left',...
                  'units', 'normalized',...
                  'fontunits', 'point', 'fontsize', 14);     
        uicontrol('Parent',FigurePanelLayout,...
                  'Style','checkbox',...
                  'String','Bonds.',...
                  'Value',1,...
                  'Tag','Plot_Bonds',...
                  'HorizontalAlignment','left',...
                  'units', 'normalized',...
                  'fontunits', 'point', 'fontsize', 14);
        uix.Empty('Parent',FigurePanelLayout)
    set(FigurePanelLayout,'Widths',[80,80,-1])

%% Buttons
uicontrol( 'Parent', ButtonBox, ...
    'String', 'Load G09 Input',...
    'fontunits', 'point', 'fontsize', 14,...
    'Callback',@(hObject,eventdata)Model_TwoDGrid('LoadG09',hObject,eventdata,guidata(hObject)));

uicontrol( 'Parent', ButtonBox, ...
    'String', 'Update Molecule',...
    'fontunits', 'point', 'fontsize', 14,...
    'Callback',@(hObject,eventdata)Model_TwoDGrid('UpdateStructure',hObject,eventdata,guidata(hObject)));

uicontrol( 'Parent', ButtonBox, ...
    'String', 'Plot Molecule',...
    'fontunits', 'point', 'fontsize', 14,...
    'Callback',@(hObject,eventdata)Model_TwoDGrid('PlotMolecule',hObject,eventdata,guidata(hObject)));

uicontrol( 'Parent', ButtonBox, ...
    'String', 'Plot Modes',...
    'fontunits', 'point', 'fontsize', 14,...
    'Callback',@(hObject,eventdata)Model_TwoDGrid('PlotModes',hObject,eventdata,guidata(hObject)));

uicontrol( 'Parent', ButtonBox, ...
    'String', 'Export handles',...
    'fontunits', 'point', 'fontsize', 14,...
    'Callback',@(hObject,eventdata)Model_TwoDGrid('Export_Handle_Callback',hObject,eventdata,guidata(hObject)));

%% output handles
GUI = guihandles(fig);