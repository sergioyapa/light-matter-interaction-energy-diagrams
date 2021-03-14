%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Energy level diagram: light-matter photon-electron interaction diagrams
% Developed by: Sergio Yanez-Pagans
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Fresh start

clear % clears the workspace and all the variables
clc % clears the command window
close all % close all opened windows and figures

%% Introduce your photon energies here

photon1 = 10; % photon energy 1  
photon2 = 6.5; % photon energy 2    
photon3 = 3.5; % photon energy 3  
FWM = photon1 + photon2 + photon3; % Four-wave mixing (FWM) photon energy

%% Define colors for each photon coupling between states

% Try the Google Color Picker to choose your colors easily!
color1 = '#7000D8'; % color for photon 1, I prefer HEX colors, but any format should work (e.g. RGB)
color2 = '#FF4500'; % color for photon 2
color3 = '#64B900'; % color for photon 3
color4 = '#C900D8'; % color for photon 4/FWM

%% Control the photon coupling (arrow) apperance, spacing between plot elements

label_size = 20; % label size
arrow_scale = 0.2; % arrow scaling/size
wsl = .04; % width of states
sbc = .12; % space between photon "columns". In this example, I use a single column that I call A below, you can include as many as you want
sblc = .01; % space between labels and colums
upper_limit = 23; % upper energy limit for plot
lower_limit = 0; % lower energy limit for plot, 0 would typically be the ground state

x_pos = 0.05; % initial x position (for further left photon)
x_end = 0; % 0 if photons are collinear
initial_energy = 0; % 0 if the system is initially in its ground state

head_shape = [0.14,10,10,0.08]; % controls the shape of the arrow head
lwa = 4; % linewidth arrow
lws = 3; % linewidth state

%% Plotting and creating the diagram

% Energy levels
fig = figure('WindowState','Maximized'); % creates a maximized window
left_color = [0 0 0];  % color for left axis (default: black)
right_color = [0 0 0]; % color for right axis (default: black)
set(fig,'defaultAxesColorOrder',[left_color; right_color])

%%% Column A %%%
a1 = photon1; % a1
la1 = '\mid1\rangle';
a2 = photon1+photon2; % a2
la2 = '\mid2\rangle';
a3 = photon1+photon2+photon3; % a3
la3 = '\mid3\rangle';

% States: here we draw horizontal lines for each of the states
plot([x_pos-wsl x_pos+wsl], [a1 a1],'Color','k','LineWidth',lws) 
text(x_pos-wsl-sblc,a1,la1,'Color','k','FontSize', label_size, 'FontName', 'Times New Roman','FontWeight','Bold')
hold on;
plot([x_pos-wsl x_pos+wsl], [a2 a2],'Color','k','LineWidth',lws) 
text(x_pos-wsl-sblc,a2,la2,'Color','k','FontSize', label_size, 'FontName', 'Times New Roman','FontWeight','Bold')
plot([x_pos-wsl x_pos+wsl], [a3 a3],'Color','k','LineWidth',lws) 
text(x_pos-wsl-sblc,a3,la3,'Color','k','FontSize', label_size, 'FontName', 'Times New Roman','FontWeight','Bold')

% Photon A1: we plot arrow for photon1 
p1_start = [x_pos-(wsl/2) lower_limit]; % to start from border of plot
p1_end = [x_pos-(wsl/2) photon1];
p1_dist = p1_end - p1_start;         
leg1 = arrows(p1_start(1),p1_start(2),p1_dist(1),p1_dist(2),head_shape,'Cartesian','FaceColor',color1,'LineWidth',lwa,'Ref',arrow_scale)

% Photon A2: we plot arrow for photon2 
p2_start = [x_pos-(wsl/2) photon1];
p2_end = [x_pos-(wsl/2) photon1+photon2];
p2_dist = p2_end - p2_start;         
leg2 = arrows(p2_start(1),p2_start(2),p2_dist(1),p2_dist(2),head_shape,'Cartesian','FaceColor',color2,'LineWidth',lwa,'Ref',arrow_scale)

% Photon A3: we plot arrow for photon3
p3_start = [x_pos-(wsl/2) photon1+photon2];
p3_end = [x_pos-(wsl/2) photon1+photon2+photon3];
p3_dist = p3_end - p3_start;         
leg3 = arrows(p3_start(1),p3_start(2),p3_dist(1),p3_dist(2),head_shape,'Cartesian','FaceColor',color3,'LineWidth',lwa,'Ref',arrow_scale)

% Photon AFWM: we plot arrow for photon4/FWM
p3_start = [x_pos+(wsl/2) photon1+photon2+photon3];
p3_end = [x_pos+(wsl/2) lower_limit];
p3_dist = p3_end - p3_start;         
leg4 = arrows(p3_start(1),p3_start(2),p3_dist(1),p3_dist(2),head_shape,'Cartesian','FaceColor',color4,'LineWidth',lwa,'Ref',arrow_scale)


% We improve the apperance of our plot by changing some properties and we
% also add a legend coresponding to each photon
hold on;
box on; % box around plot
title('') % title for diagram
xticks([]) % removing x-axis ticks
yticks([]) % removing y-axis ticks
xlabel({}) % x-axis label
yyaxis left % controlling left y axis separate from right y-axis
ylabel('Energy') % left y-axis label
ylim([lower_limit upper_limit]); % setting y-range for plot
xlim([x_pos-0.045-sblc x_pos+0.045])
lgd = legend([leg1 leg2 leg3 leg4],{' \omega_{XUV}',' \omega_{1}',' \omega_{2}',' \omega_{FWM}'},'NumColumns',4,'Location','North');
lgd.FontSize = 24; % font size legend
lgd.LineWidth = 2; % legend linewidth
set(gca,'fontsize',32);  % control font size for plot
set(gca, 'FontName', 'Times New Roman') % control font type for plot
set(gca, 'Layer', 'top') % making sure axis are on top layer
set(gca,'linewidth',4.5) % width of plot axes
set(gcf,'color','w'); % background color set to white
pbaspect([0.6 1 1]); % control the ratio of x and y axes
yyaxis right % controlling right y-axis
yticks([]); % removing y-axis ticks


%%% end of code %%%