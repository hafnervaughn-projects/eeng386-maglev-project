% Illustrative two-gap EMS model. NOT Shanghai train specifications.
% Run: lift_sweep
% Geometry/derivation: ../analysis/LIFT_MODEL.md
clear; close all; clc;
mu0 = 4*pi*1e-7;     % H/m, classroom approximation
mass = 100;          % kg, supported by ONE modeled suspension unit
area = 0.010;        % m^2, EACH of two pole faces
turns = 500;
gap0 = 0.010;        % m, EACH of two series air gaps
gravity = 9.81;      % m/s^2
weight = mass*gravity;
current0 = (2*gap0/turns)*sqrt(weight/(mu0*area));
force = @(gap,current) mu0*turns^2*area.*current.^2./(4*gap.^2);
field = @(gap,current) mu0*turns.*current./(2*gap);

% Independent pressure and coenergy formulations must agree at equilibrium.
assert(abs(force(gap0,current0)/weight-1) < 1e-12);
assert(abs(field(gap0,current0)^2*area/mu0/weight-1) < 1e-12);
step = gap0*1e-5;
inductance = @(gap) mu0*turns^2*area./(2*gap);
forceFromCoenergy = -0.5*current0^2* ...
    (inductance(gap0+step)-inductance(gap0-step))/(2*step);
assert(abs(forceFromCoenergy/weight-1) < 1e-8);
assert(abs(force(2*gap0,current0)/weight-0.25) < 1e-12);
assert(abs(force(gap0,2*current0)/weight-4) < 1e-12);

gaps = linspace(0.005,0.020,301)';
currents = current0*[0.8 1 1.2];
forces = force(gaps,currents);
requiredCurrent = (2*gaps/turns)*sqrt(weight/(mu0*area));
scriptDir = fileparts(mfilename('fullpath'));
outDir = fullfile(scriptDir,'..','figures','lift-sweep');
if ~exist(outDir,'dir'), mkdir(outDir); end

fig = figure('Visible','off','Color','w');
tiledlayout(1,2);
nexttile;
plot(gaps*1000,forces,'LineWidth',1.5); hold on;
yline(weight,'k--'); plot(gap0*1000,weight,'ko','MarkerFaceColor','k');
xlabel('Each air gap (mm)'); ylabel('Total attractive lift (N)'); grid on;
legend([compose('I = %.2f A',currents), "Weight", "Nominal equilibrium"], ...
    'Location','northeast');
title('Fixed-current gap sensitivity');
nexttile;
plot(gaps*1000,requiredCurrent,'LineWidth',1.5);
xlabel('Each air gap (mm)'); ylabel('Equilibrium current (A)'); grid on;
title('Current needed to support 100 kg');
sgtitle('ILLUSTRATIVE ideal two-gap EMS model - not train data');
set(fig,'Position',[100 100 1200 500]);
% Explicit colors keep exports readable regardless of the desktop theme.
set(findall(fig,'Type','axes'),'Color','w','XColor','k','YColor','k');
set(findall(fig,'Type','text'),'Color','k');
set(findall(fig,'Type','legend'),'Color','w','TextColor','k','EdgeColor','k');
exportgraphics(fig,fullfile(outDir,'lift_sweep.png'),'Resolution',180);
writetable(table(gaps*1000,forces(:,1),forces(:,2),forces(:,3),requiredCurrent, ...
    'VariableNames',{'gap_mm','force_N_at_0p8I0','force_N_at_I0', ...
    'force_N_at_1p2I0','equilibrium_current_A'}),fullfile(outDir,'lift_sweep.csv'));
fprintf('Checks passed. I0 = %.6f A, B0 = %.6f T, F0 = %.3f N\n', ...
    current0,field(gap0,current0),force(gap0,current0));
fprintf('Saved plot and CSV to %s\n',outDir);
