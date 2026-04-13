%% EE568 Project - M-19 Steel B-H Curve Analysis

filename = 'BH_curve_of_M-19_steel.tab';

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

% Static Relative Permeability (mu_r = B / (mu_0 * H))
% Using the first non-zero point for the linear region
mu_r_linear = B(5) / (H(5) * mu_0);

% Differential Permeability (mu_diff = dB/dH) - crucial for non-linear solver
dB = diff(B);
dH = diff(H);
mu_diff = dB ./ dH;

fprintf('--- M-19 Material Analysis ---\n');
fprintf('Linear Region Relative Permeability (mu_r): %.2f\n', mu_r_linear);
fprintf('Max Flux Density in data: %.2f T\n', max(B));

%% 3. Visualization
figure('Color', 'w', 'Units', 'normalized', 'Position', [0.2 0.2 0.6 0.4]);

% Subplot 1: B-H Curve
subplot(1,2,1);
plot(H, B, 'b', 'LineWidth', 1.5);
grid on; hold on;
yline(1.4, 'r--', 'Knee Region');
xlabel('H (A/m)'); ylabel('B (T)');
title('B-H Magnetization Curve');
legend('M-19 Data', 'Saturation Knee', 'Location', 'southeast');

% Subplot 2: Relative Permeability vs. B
% (How permeability drops as you saturate)
subplot(1,2,2);
mu_r_dynamic = (B(2:end) ./ H(2:end)) ./ mu_0;
plot(B(2:end), mu_r_dynamic, 'g', 'LineWidth', 1.5);
grid on;
xlabel('B (T)'); ylabel('\mu_r (Relative Permeability)');
title('Permeability vs. Flux Density');

sgtitle('M-19 Electrical Steel Characteristics for VRM Design');