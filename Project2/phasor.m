N = 15;
num_sequence = [1, 14, 12, 10, 8, 6, 4, 2, 15, 13, 11, 9, 7, 5, 3];
negative_slots = [5, 7, 15, 2, 10, 12];

angles_deg_fundamental = linspace(0, 360, N+1);
angles_deg_fundamental(end) = [];

limit_val = 5 * 1.6;

% =========================================================================
% FUNDAMENTAL HARMONIC (n = 1)
% =========================================================================
angles_rad = deg2rad(angles_deg_fundamental * 1);

figure('Color', 'w');
hold on; grid on; ax = gca; ax.GridLineStyle = ':'; ax.GridAlpha = 0.3; axis equal;
V_magnitudes = 5 * ones(1, N);
for i = 1:N
    x_tip = V_magnitudes(i) * cos(angles_rad(i));
    y_tip = V_magnitudes(i) * sin(angles_rad(i));
    plot([0, x_tip], [0, y_tip], 'k-', 'LineWidth', 2, 'Marker', '*', 'MarkerSize', 6);
    x_offset = 5 * 1.15 * cos(angles_rad(i)); 
    y_offset = 5 * 1.15 * sin(angles_rad(i));
    text(x_offset, y_offset, sprintf('$%d$', num_sequence(i)), 'Interpreter', 'latex', 'FontSize', 14, 'FontWeight', 'bold', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
end
xlim([-limit_val, limit_val]); ylim([-limit_val, limit_val]);
title('Phase Angles of Induced Voltages (n = 1)', 'FontSize', 12); xlabel('Real Axis', 'FontSize', 10); ylabel('Imaginary Axis', 'FontSize', 10); hold off;

figure('Color', 'w');
hold on; grid on; ax = gca; ax.GridLineStyle = ':'; ax.GridAlpha = 0.3; axis equal;
V_magnitudes = 5 * ones(1, N);
for k = 1:length(negative_slots)
    idx = find(num_sequence == negative_slots(k));
    if ~isempty(idx)
        V_magnitudes(idx) = -5;
    end
end
for i = 1:N
    x_tip = V_magnitudes(i) * cos(angles_rad(i));
    y_tip = V_magnitudes(i) * sin(angles_rad(i));
    plot([0, x_tip], [0, y_tip], 'k-', 'LineWidth', 2, 'Marker', '*', 'MarkerSize', 6);
    phase_factor = sign(V_magnitudes(i));
    x_offset = 5 * 1.15 * phase_factor * cos(angles_rad(i)); 
    y_offset = 5 * 1.15 * phase_factor * sin(angles_rad(i));
    text(x_offset, y_offset, sprintf('$%d$', num_sequence(i)), 'Interpreter', 'latex', 'FontSize', 14, 'FontWeight', 'bold', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    if num_sequence(i) == 1
        text(5 * 1.55 * phase_factor * cos(angles_rad(i)), 5 * 1.55 * phase_factor * sin(angles_rad(i)), 'Phase A', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'r', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    elseif num_sequence(i) == 6
        text(5 * 1.50 * phase_factor * cos(angles_rad(i)), 5 * 1.50 * phase_factor * sin(angles_rad(i)), 'Phase B', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'r', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    elseif num_sequence(i) == 11
        text(5 * 1.50 * phase_factor * cos(angles_rad(i)), 5 * 1.50 * phase_factor * sin(angles_rad(i)), 'Phase C', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'r', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    end
end
xlim([-limit_val, limit_val]); ylim([-limit_val, limit_val]);
title('Phasor Diagram for Phases (n = 1)', 'FontSize', 12); xlabel('Real Axis', 'FontSize', 10); ylabel('Imaginary Axis', 'FontSize', 10); hold off;


% =========================================================================
% 3rd HARMONIC (n = 3)
% =========================================================================
angles_rad = deg2rad(angles_deg_fundamental * 3);

figure('Color', 'w');
hold on; grid on; ax = gca; ax.GridLineStyle = ':'; ax.GridAlpha = 0.3; axis equal;
V_magnitudes = 5 * ones(1, N);
for i = 1:N
    x_tip = V_magnitudes(i) * cos(angles_rad(i));
    y_tip = V_magnitudes(i) * sin(angles_rad(i));
    plot([0, x_tip], [0, y_tip], 'k-', 'LineWidth', 2, 'Marker', '*', 'MarkerSize', 6);
    x_offset = 5 * 1.15 * cos(angles_rad(i)); 
    y_offset = 5 * 1.15 * sin(angles_rad(i));
    text(x_offset, y_offset, sprintf('$%d$', num_sequence(i)), 'Interpreter', 'latex', 'FontSize', 14, 'FontWeight', 'bold', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
end
xlim([-limit_val, limit_val]); ylim([-limit_val, limit_val]);
title('Phase Angles of Induced Voltages (n = 3)', 'FontSize', 12); xlabel('Real Axis', 'FontSize', 10); ylabel('Imaginary Axis', 'FontSize', 10); hold off;

figure('Color', 'w');
hold on; grid on; ax = gca; ax.GridLineStyle = ':'; ax.GridAlpha = 0.3; axis equal;
V_magnitudes = 5 * ones(1, N);
for k = 1:length(negative_slots)
    idx = find(num_sequence == negative_slots(k));
    if ~isempty(idx)
        V_magnitudes(idx) = -5;
    end
end
for i = 1:N
    x_tip = V_magnitudes(i) * cos(angles_rad(i));
    y_tip = V_magnitudes(i) * sin(angles_rad(i));
    plot([0, x_tip], [0, y_tip], 'k-', 'LineWidth', 2, 'Marker', '*', 'MarkerSize', 6);
    phase_factor = sign(V_magnitudes(i));
    x_offset = 5 * 1.15 * phase_factor * cos(angles_rad(i)); 
    y_offset = 5 * 1.15 * phase_factor * sin(angles_rad(i));
    text(x_offset, y_offset, sprintf('$%d$', num_sequence(i)), 'Interpreter', 'latex', 'FontSize', 14, 'FontWeight', 'bold', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    if num_sequence(i) == 1
        text(5 * 1.55 * phase_factor * cos(angles_rad(i)), 5 * 1.55 * phase_factor * sin(angles_rad(i)), 'Phase A', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'r', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    elseif num_sequence(i) == 6
        text(5 * 1.50 * phase_factor * cos(angles_rad(i)), 5 * 1.50 * phase_factor * sin(angles_rad(i)), 'Phase B', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'r', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    elseif num_sequence(i) == 11
        text(5 * 1.50 * phase_factor * cos(angles_rad(i)), 5 * 1.50 * phase_factor * sin(angles_rad(i)), 'Phase C', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'r', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    end
end
xlim([-limit_val, limit_val]); ylim([-limit_val, limit_val]);
title('Phasor Diagram for Phases (n = 3)', 'FontSize', 12); xlabel('Real Axis', 'FontSize', 10); ylabel('Imaginary Axis', 'FontSize', 10); hold off;


% =========================================================================
% 5th HARMONIC (n = 5)
% =========================================================================
angles_rad = deg2rad(angles_deg_fundamental * 5);

figure('Color', 'w');
hold on; grid on; ax = gca; ax.GridLineStyle = ':'; ax.GridAlpha = 0.3; axis equal;
V_magnitudes = 5 * ones(1, N);
for i = 1:N
    x_tip = V_magnitudes(i) * cos(angles_rad(i));
    y_tip = V_magnitudes(i) * sin(angles_rad(i));
    plot([0, x_tip], [0, y_tip], 'k-', 'LineWidth', 2, 'Marker', '*', 'MarkerSize', 6);
    x_offset = 5 * 1.15 * cos(angles_rad(i)); 
    y_offset = 5 * 1.15 * sin(angles_rad(i));
    text(x_offset, y_offset, sprintf('$%d$', num_sequence(i)), 'Interpreter', 'latex', 'FontSize', 14, 'FontWeight', 'bold', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
end
xlim([-limit_val, limit_val]); ylim([-limit_val, limit_val]);
title('Phase Angles of Induced Voltages (n = 5)', 'FontSize', 12); xlabel('Real Axis', 'FontSize', 10); ylabel('Imaginary Axis', 'FontSize', 10); hold off;

figure('Color', 'w');
hold on; grid on; ax = gca; ax.GridLineStyle = ':'; ax.GridAlpha = 0.3; axis equal;
V_magnitudes = 5 * ones(1, N);
for k = 1:length(negative_slots)
    idx = find(num_sequence == negative_slots(k));
    if ~isempty(idx)
        V_magnitudes(idx) = -5;
    end
end
for i = 1:N
    x_tip = V_magnitudes(i) * cos(angles_rad(i));
    y_tip = V_magnitudes(i) * sin(angles_rad(i));
    plot([0, x_tip], [0, y_tip], 'k-', 'LineWidth', 2, 'Marker', '*', 'MarkerSize', 6);
    phase_factor = sign(V_magnitudes(i));
    x_offset = 5 * 1.15 * phase_factor * cos(angles_rad(i)); 
    y_offset = 5 * 1.15 * phase_factor * sin(angles_rad(i));
    text(x_offset, y_offset, sprintf('$%d$', num_sequence(i)), 'Interpreter', 'latex', 'FontSize', 14, 'FontWeight', 'bold', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    if num_sequence(i) == 1
        text(5 * 1.55 * phase_factor * cos(angles_rad(i)), 5 * 1.55 * phase_factor * sin(angles_rad(i)), 'Phase A', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'r', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    elseif num_sequence(i) == 6
        text(5 * 1.50 * phase_factor * cos(angles_rad(i)), 5 * 1.50 * phase_factor * sin(angles_rad(i)), 'Phase B', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'r', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    elseif num_sequence(i) == 11
        text(5 * 1.50 * phase_factor * cos(angles_rad(i)), 5 * 1.50 * phase_factor * sin(angles_rad(i)), 'Phase C', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'r', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    end
end
xlim([-limit_val, limit_val]); ylim([-limit_val, limit_val]);
title('Phasor Diagram for Phases (n = 5)', 'FontSize', 12); xlabel('Real Axis', 'FontSize', 10); ylabel('Imaginary Axis', 'FontSize', 10); hold off;