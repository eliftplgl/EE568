%% EE568 PROJECT 1 - ANALYTICAL MODELING
% Writer: Elif Topaloğlu
% Date: 09.04.2026
% Refer to link for the full core dimentions: https://github.com/odtu/EE568/tree/master/Project1

clc; clear;
%% Parameters

number_of_turns = 300;    % Total number of turns in the coil
coil_current = 2.5;       % Coil current DC, A
depth_of_core = 25e-3;    % Core depth, m
air_gap = 0.5e-3;         % Air gap clearance, m
coil_area_width = 10e-3;  % Coil area short length, m
coil_area_height = 30e-3; % Coil area long length, m
mu0 = 4*pi*1e-7;          % Permeability of air, H/m
 
%% Part A

% Assumptions: 
% Core is infinitealy permeable and thus reluctance of the core is zero.
% Sinusoidal variation of the inductance is assumed.
% Fringing flux is neglected.
% Magnetic system is linear.
% Flux distribution is uniform across cross-section area.

min_path_length = 2*air_gap;            % Minimum path length, m
max_path_length = 2*air_gap + 2*2e-3;   % Maximum path length, m
core_area = 15e-3*depth_of_core;        % Core cross section area, m^2

min_reluctance = min_path_length/mu0/core_area; % Minimum reluctance, 1/H
max_reluctance = max_path_length/mu0/core_area; % Maximum reluctance, 1/H

fprintf('Max Reluctance: %.2d 1/H\n', max_reluctance);
fprintf('Min Reluctance: %.2d 1/H\n', min_reluctance);

min_inductance = number_of_turns^2/max_reluctance; % Minimum inductance, H
max_inductance = number_of_turns^2/min_reluctance; % Maximum inductance, H

fprintf('Max Inductance: %.2f mH\n', max_inductance * 1000);
fprintf('Min Inductance: %.2f mH\n', min_inductance * 1000);

% Inductance variation plot
theta_deg = linspace(0, 360, 1000); % Rotor position in mechanical degrees
theta_rad = deg2rad(theta_deg);     % Convert to radians
L_average = (max_inductance + min_inductance) / 2; % Average inducatance, H
L_difference = (max_inductance - min_inductance) / 2; % Inductance difference, H
L_theta = (L_average + L_difference * cos(2*theta_rad))*1e3; % Inductance with respect to position, mH 

figure;
plot(theta_deg, L_theta, 'LineWidth', 2);
title('Inductance Variation');
xlabel('Rotor Position (Degrees)');
ylabel('Inductance (mH)');
grid on;
xlim([0, 360]);

%% Part B

dL_theta = -2*L_difference * sin(2*theta_rad); % Derivative of the inductance with respect to position
torque = 1/2*coil_current^2*dL_theta;          % Torque, Nm

figure;
plot(theta_deg, torque, 'LineWidth', 2);
title('Torque vs. Position');
xlabel('Rotor Position (Degrees)');
ylabel('Torque (Nm)');
grid on;
xlim([0, 360]);

fprintf('Max Torque: %.4f Nm\n', max(torque));
fprintf('Min Torque: %.4f Nm\n', min(torque));

