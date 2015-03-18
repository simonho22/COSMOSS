function PlotOneDSFG(OneDSFG,varargin)
%% PlotOneDSFG
%  
% Given the Stuctural infomation that generated by GetAmideI.m this
% function can plot the molecule and its' amide I modes.
% 
% ------- Version log -----------------------------------------------------
%
% Ver. 1.2  140922  Substitute GUI read-in with Input parser
% 
% Ver. 1.1  140717  Add Frequency axis GUI read in part
% 
% Ver. 1.0  140605  Start Log.
% 
% ------------------------------------------------------------------------
% Copyright Jia-Jung Ho, 2014

%% Debug
% clear all
% varargin = {'LineShape','KK'};
% 
% Structure_Data = GetAcid;
% OneDSFG = OneDSFG_Main(Structure_Data);

%% Inputs parser
INPUT = inputParser;

% Default values
defaultPlotStick   = 1;
defaultF_Min       = 1600;
defaultF_Max       = 1800;
defaultLineWidth   = 5;
defaultSignal_Type = 1;
defaultLineShape   = 'G';

% add Optional inputs / Parameters
addOptional(INPUT,'PlotStick'  ,defaultPlotStick);
addOptional(INPUT,'F_Min'      ,defaultF_Min);
addOptional(INPUT,'F_Max'      ,defaultF_Max);
addOptional(INPUT,'LineWidth'  ,defaultLineWidth);
addOptional(INPUT,'Signal_Type',defaultSignal_Type);
addOptional(INPUT,'LineShape'  ,defaultLineShape);

parse(INPUT,varargin{:});

% Re-assign variable names
PlotStick   = INPUT.Results.PlotStick;
F_Min       = INPUT.Results.F_Min;
F_Max       = INPUT.Results.F_Max;
LineWidth   = INPUT.Results.LineWidth;
Signal_Type = INPUT.Results.Signal_Type;
LineShape   = INPUT.Results.LineShape;

%% Plot 1DSFG spectra  
Num_Modes = OneDSFG.Num_Modes;
PlotResponse = OneDSFG.EJLabFrame;

Res_1DSFG_Freq = PlotResponse(:,1);

figure;
hold on

Response1DSFG = PlotResponse(:,2);


if eq(PlotStick,1)
    line([Res_1DSFG_Freq';Res_1DSFG_Freq'],[zeros(1,Num_Modes);Response1DSFG']);
    %plot(Res_1DSFG_Freq,Response1DSFG,'rx')
end

% Get Frequency axis range 
spec_range = F_Min:F_Max;

% plot baseline
line([spec_range(1);spec_range(end)],[0;0],'Color',[1,0,0])

spec_array1 = bsxfun(@times,ones(Num_Modes,length(spec_range)),spec_range);
spec_array2 = bsxfun(@minus,spec_array1,Res_1DSFG_Freq);

switch LineShape 
    case 'G' % Gaussian
        LineShape = 1i*exp(-(spec_array2.^2)./(LineWidth^2));
        CVL = bsxfun(@times,LineShape,Response1DSFG); 
        CVL_Total = sum(CVL,1);
    case 'L' % Loretizain 
        LineWidth = LineWidth/2;
        LineShape = spec_array2./((spec_array2.^2)+(LineWidth^2)) + 1i*LineWidth./(spec_array2.^2+LineWidth^2);
        CVL = bsxfun(@times,LineShape,Response1DSFG); 
        CVL_Total = sum(CVL,1);
    case 'KK' % K-K use K-K relation to generate Re part
        LineWidth = LineWidth/2;
        LineShape = (1/pi)*(LineWidth)./(spec_array2.^2+(LineWidth)^2);
        Im = bsxfun(@times,LineShape,Response1DSFG); 
        Im_Total = sum(Im,1);
        
        Re = kkimbook2(spec_range,Im_Total,1);

        CVL_Total = 1i*Im_Total + Re;
        
end

% CVL = bsxfun(@times,LineShape,Response1DSFG); 
% CVL_Toatl = sum(CVL,1);

switch Signal_Type
    case 1 % heterodyne
        PlotY = imag(CVL_Total);
        Stick = Response1DSFG;
    case 2 % homodyne
        PlotY = abs(CVL_Total).^2;
        Stick = Response1DSFG.^2;
end


plot(spec_range,PlotY,'-','LineWidth',2)

hold off

% integrate the curve area
Area = trapz(spec_range,abs(PlotY));
StickSum = sum(Stick);

Title = ['Area sum: ' num2str(Area), ',  Stick sum: ', num2str(StickSum)];
title(Title,'FontSize',16);
set(gca,'XLim',[spec_range(1),spec_range(end)])
