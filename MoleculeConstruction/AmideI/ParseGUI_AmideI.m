function O = ParseGUI_AmideI(hGUI)

% Orientation -------------------------------------------------------------
O.Phi_D   =  str2double(get(hGUI.Phi_D     ,'String'));
O.Psi_D   =  str2double(get(hGUI.Psi_D     ,'String'));
O.Theta_D =  str2double(get(hGUI.Theta_D   ,'String'));

% For Local Mode frequencies ----------------------------------------------
O.NLFreq  = str2double(get(hGUI.NLFreq ,'String'));
O.LFreq   = str2double(get(hGUI.LFreq  ,'String'));
O.Anharm  = str2double(get(hGUI.Anharm ,'String'));
O.L_Index =    str2num(get(hGUI.L_Index,'String'));

% For molecule ploting ----------------------------------------------------
O.Plot_Atoms      = get(hGUI.Plot_Atoms ,'Value' );
O.Plot_Bonds      = get(hGUI.Plot_Bonds ,'Value' );
O.Plot_Axis       = get(hGUI.Plot_Axis  ,'Value' );
O.Plot_SideChain  = get(hGUI.Plot_SideChain ,'Value' );
