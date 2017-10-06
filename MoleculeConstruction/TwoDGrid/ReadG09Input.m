function S_G09_MF = ReadG09Input(FName)
% 
% Given a input file name "FName", this script can parse XYZ, mu and alpha
% variables and generate parsed input structure "P"
% 

% ------- Version log ----------------------------------------------------
% 
% V2.1  161103  Move out the rotation action to XYZ, TDV, Raman; only read 
%               and report the molecular frame axis definition 
% 
% V2.0  161103  Move molecule frame ratation transform out of ReadG09Input 
% 
% V1.1  150426  Copy from 2DSFG_Ester project
%               Update debug part
% 
% V1.0  140903  Modified from ReadDNAInput v1.6
%               Add Conn(3,13) = 1 for connection S-C bond
% 
% ------------------------------------------------------------------------ 
% Copyright Jia-Jung Ho, 2013-2016

% ----[Debug] ------------------------------
% clear all
% close all
% clc
% FName = '131029_MBA.txt';
% ------------------------------------------


%% Start to read inputs
fid = fopen(FName);

% Predefined Variables
Atom_Num = cell2mat(textscan(fid,'[Atom_Num] %f',1,'commentStyle','%'));
Mode_Num = cell2mat(textscan(fid,'[Mode_Num] %d',1,'commentStyle','%'));

% XYZ part
Atom = textscan(fid,'[Atom] %s %f %f %f',Atom_Num,'CollectOutput',1,'commentStyle','%');

% Read Definition of molecule frame axis
Orientation = textscan(fid,'[Orientation] %f %f %f %f %f',1,'commentStyle','%','CollectOutput',1);

% Mu Vector Part
TDV = textscan(fid,'[TDV] %s %f %f %f',Mode_Num,'CollectOutput',1,'commentStyle','%');

% Alpha Vector Part
Raman_Vector = textscan(fid,'[Raman] %s %f %f %f %f %f %f %f %f %f',Mode_Num,'CollectOutput',1,'commentStyle','%');

% Intensity scaling of IR and Raman
Int_Harm.IR      = textscan(fid,'[Int_Harm]   IR    %s %f',Mode_Num,'commentStyle','%');
Int_Harm.Raman   = textscan(fid,'[Int_Harm]   Raman %s %f',Mode_Num,'commentStyle','%');
Int_AnHarm.IR    = textscan(fid,'[Int_AnHarm] IR    %s %f',Mode_Num,'commentStyle','%');
Int_AnHarm.Raman = textscan(fid,'[Int_AnHarm] Raman %s %f',Mode_Num,'commentStyle','%');

% Frequency Part
% Toggle of Anharmonic correction
AnharmCorrect   = textscan(fid,'[AnharmCorrect] %s %f',1,'commentStyle','%');
FreqScaleFactor = textscan(fid,'[FreqScaleFactor] %f',1,'commentStyle','%'); 

if strcmp(AnharmCorrect{1},'no')
    Anharm = AnharmCorrect{2};
    Freq_tmp = textscan(fid,'[Freq] %s %f',Mode_Num,'commentStyle','%');
    Fundamental = Freq_tmp{2};
    Overtone = 2*Fundamental-Anharm;
    
    % Create index to calculate combination band
    [I2,I1] = ndgrid(1:Mode_Num,1:Mode_Num);
    Ind_1 = I1(logical(tril(ones(3,3),-1)));
    Ind_2 = I2(logical(tril(ones(3,3),-1)));
    Combination = Fundamental(Ind_1)+Fundamental(Ind_2)-Anharm;
    
elseif strcmp(AnharmCorrect{1},'yes')
    Fundamental = textscan(fid,'[Freq] %s %f',Mode_Num,'commentStyle','%');
    Overtone    = textscan(fid,'[Freq] %s %f',Mode_Num,'commentStyle','%');
    Combination = textscan(fid,'[Freq] %s %f',Mode_Num*(Mode_Num-1)/2,'commentStyle','%');
    
    Fundamental = Fundamental{2};
    Overtone    = Overtone{2};
    Combination = Combination{2};
    
else 
    disp('Please provide correct "[AnharmCorrect]" option [yes|no]...')
end

fclose(fid);

%% Formating raw data
Atom_Name = Atom{1}; % Atom symbel
XYZ       = Atom{2};  % Unrotated molecule xyz. Already a array since 'CollectOutput'

% [Orientation]  Center Z_I Z_F XZ_I XZ_F
Orientation = cell2mat(Orientation);
Center_Ind  = Orientation(1);
Z_i_Ind     = Orientation(2);
Z_f_Ind     = Orientation(3);
XZ_i_Ind    = Orientation(4);
XZ_f_Ind    = Orientation(5);

% Unrotated Transition Dipole Vector (mu)
TDV = (TDV{2}); % [Vx, Vy, Vz] size = [Nmodes,3]

% Unrotated Raman Tensor (alpha) in simulation frame
Raman_Vector = (Raman_Vector{2}); % [Aixx Aixy Aixz Aiyx Aiyy Aiyz Aizx Aizy Aizz] , size = [Nmodes,9]

% Frequency Part
FreqScaleFactor  = cell2mat(FreqScaleFactor);
Freq.Fundamental = FreqScaleFactor*Fundamental;
Freq.Overtone    = FreqScaleFactor*Overtone;
Freq.Combination = FreqScaleFactor*Combination;

%% Construct Structure Data of the molecule
S_G09 = StructureData;
S_G09.XYZ       = XYZ;
S_G09.AtomName  = Atom_Name;
S_G09.LocCenter = S_G09.CoM; % put the mode at center of mass
S_G09.LocFreq   = Freq.Fundamental;
S_G09.LocAnharm = 2*Freq.Fundamental - Freq.Overtone;
S_G09.LocMu     = TDV;
S_G09.LocAlpha  = Raman_Vector; % raman tensor vector form [N x 9]
S_G09.FilesName = FName;

%% Set the Assigned center to zero and rotated the molecule with [Orientation] info
Z_Ind  = [ Z_i_Ind, Z_f_Ind];
XZ_Ind = [XZ_i_Ind,XZ_f_Ind];
S_G09_MF = SD_SetFrame(S_G09,Center_Ind,Z_Ind,XZ_Ind);

%% Extra infomation
Int_Harm.IR     = Int_Harm.IR{2}   ;
Int_Harm.Raman  = Int_Harm.Raman{2};

Int_AnHarm.IR   = Int_AnHarm.IR{2}   ;
Int_AnHarm.Raman= Int_AnHarm.Raman{2};

Mol_Frame.Center_Ind = Center_Ind;
Mol_Frame.Z_i_Ind    = Z_i_Ind;
Mol_Frame.Z_f_Ind    = Z_f_Ind;
Mol_Frame.XZ_i_Ind   = XZ_i_Ind;
Mol_Frame.XZ_f_Ind   = XZ_f_Ind;
Mol_Frame.Frame_Type = 'XZ'; % move the frame type switch to R_GF2LF

Extra.Int_Harm   = Int_Harm;
Extra.Int_AnHarm = Int_AnHarm;
Extra.Mol_Frame  = Mol_Frame;

S_G09_MF.Extra   = Extra;

