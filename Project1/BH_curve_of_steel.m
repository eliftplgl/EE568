%% EE568 Project - M-19 Steel B-H Curve Analysis

filename = 'PC40,25C BH curve.tab';

% Set import options - skipping the source/header line
opts = delimitedTextImportOptions("NumVariables", 2);
opts.DataLines = [2, Inf]; % Start from line 2 to skip header
opts.Delimiter = "\t";
opts.VariableNames = ["H", "B"];
opts.VariableTypes = ["double", "double"];

% Read the table
data = readtable(filename, opts);
H = data.H; 
B = data.B;

%% Permeability Calculations
mu_0 = 4*pi*1e-7; % Vacuum permeability [H/m]

% Differential Permeability (mu_diff = dB/dH) - crucial for non-linear solver
dB = diff(B);
dH = diff(H);
mu_diff = dB ./ dH;

%% 3. Visualization

plot(H, B, 'LineWidth', 1.5);
grid on; hold on;
xlabel('H (A/m)'); ylabel('B (T)');
title('B-H Magnetization Curve for PC40 Core');
