function GUI = GUI_TCO(fig) 
%% Add base layout
MainLayout = uix.VBoxFlex(...
    'Parent',fig,...
    'Spacing',1,...
    'Padding',5);

%% Individule Chromophore Rotation 
uicontrol('Parent',MainLayout,...
    'Style','text',...
    'String','Individule Rotation',...
    'BackgroundColor',[0,1,1]);

% oreintation inputs

Rot_HBox1 = uix.HBoxFlex(...
    'Parent',MainLayout,...
    'Spacing',3);

    uicontrol('Parent',Rot_HBox1,...
        'Style','text',...
        'String','Phi1');
    
    uicontrol('Parent',Rot_HBox1,...
        'Style','edit',...
        'String','0',...
        'Tag','Phi1',...
        'Callback',@(hObject,eventdata)Model_TCO('UpdateStructure',hObject,eventdata,guidata(hObject)));

    uicontrol('Parent',Rot_HBox1,...
        'Style','text',...
        'String','Psi1');
    
    uicontrol('Parent',Rot_HBox1,...
        'Style','edit',...
        'String','0',...
        'Tag','Psi1',...
        'Callback',@(hObject,eventdata)Model_TCO('UpdateStructure',hObject,eventdata,guidata(hObject)));

    uicontrol('Parent',Rot_HBox1,...
        'Style','text',...
        'String','Theta1');

    uicontrol('Parent',Rot_HBox1,...
        'Style','edit',...
        'String','0',...
        'Tag','Theta1',...
        'Callback',@(hObject,eventdata)Model_TCO('UpdateStructure',hObject,eventdata,guidata(hObject)));


Rot_HBox2 = uix.HBoxFlex(...
    'Parent',MainLayout,...
    'Spacing',3);

    uicontrol('Parent',Rot_HBox2,...
        'Style','text',...
        'String','Phi2');
    
    uicontrol('Parent',Rot_HBox2,...
        'Style','edit',...
        'String','0',...
        'Tag','Phi2',...
        'Callback',@(hObject,eventdata)Model_TCO('UpdateStructure',hObject,eventdata,guidata(hObject)));

    uicontrol('Parent',Rot_HBox2,...
        'Style','text',...
        'String','Psi2');
    
    uicontrol('Parent',Rot_HBox2,...
        'Style','edit',...
        'String','0',...
        'Tag','Psi2',...
        'Callback',@(hObject,eventdata)Model_TCO('UpdateStructure',hObject,eventdata,guidata(hObject)));

    uicontrol('Parent',Rot_HBox2,...
        'Style','text',...
        'String','Theta2');

    uicontrol('Parent',Rot_HBox2,...
        'Style','edit',...
        'String','0',...
        'Tag','Theta2',...
        'Callback',@(hObject,eventdata)Model_TCO('UpdateStructure',hObject,eventdata,guidata(hObject)));

%% Translation inputs for the second chromophore

uicontrol('Parent',MainLayout,...
    'Style','text',...
    'String','Translation vector',...
    'BackgroundColor',[0,1,1]);

uicontrol('Parent',MainLayout,...
    'Style','edit',...
    'String','5,0,0',...
    'Tag','Trans',...
    'Callback',@(hObject,eventdata)Model_TCO('UpdateStructure',hObject,eventdata,guidata(hObject)));

%% Rotation of the whole two-chromophore system
uicontrol('Parent',MainLayout,...
    'Style','text',...
    'String','Overall Rotation',...
    'BackgroundColor',[0,1,1]);

% oreintation inputs

RotAll_HBox1 = uix.HBoxFlex(...
    'Parent',MainLayout,...
    'Spacing',3);

    uicontrol('Parent',RotAll_HBox1,...
        'Style','text',...
        'String','X');
    
    uicontrol('Parent',RotAll_HBox1,...
        'Style','edit',...
        'String','0',...
        'Tag','Rot_X',...
        'Callback',@(hObject,eventdata)Model_TCO('UpdateStructure',hObject,eventdata,guidata(hObject)));

    uicontrol('Parent',RotAll_HBox1,...
        'Style','text',...
        'String','Y');
    
    uicontrol('Parent',RotAll_HBox1,...
        'Style','edit',...
        'String','0',...
        'Tag','Rot_Y',...
        'Callback',@(hObject,eventdata)Model_TCO('UpdateStructure',hObject,eventdata,guidata(hObject)));

    uicontrol('Parent',RotAll_HBox1,...
        'Style','text',...
        'String','Z');

    uicontrol('Parent',RotAll_HBox1,...
        'Style','edit',...
        'String','0',...
        'Tag','Rot_Z',...
        'Callback',@(hObject,eventdata)Model_TCO('UpdateStructure',hObject,eventdata,guidata(hObject)));
%% Button
uicontrol( 'Parent', MainLayout, ...
'String', 'Generate',...
'Callback',@(hObject,eventdata)Model_TCO('UpdateStructure',hObject,eventdata,guidata(hObject)));

uicontrol( 'Parent', MainLayout, ...
'String', 'Plot Molecule',...
'Callback',@(hObject,eventdata)Model_TCO('PlotMolecule',hObject,eventdata,guidata(hObject)));

%% set sizes
set(MainLayout,'Heights',[15,25,25,15,25,15,25,-1,-1])

%% output handles
GUI = guihandles(fig);

    