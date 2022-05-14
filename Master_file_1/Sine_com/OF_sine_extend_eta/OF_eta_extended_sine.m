addpath('/Users/kadekjensen/Desktop/Master_files/Master_file_1/')

M = 11;

axis_size = 27;
fontSize1 = 20;
fontSize2 = 22;
fontSize3 = 22;
pltsize = 2;
width = 0.75;

for i = 1:M
    OF_run_eta = sprintf('OF_eta%d',i);
    OF_BL = sprintf('OF_BL%d',i);
    [t_OF{i}, eta_OF_{i}, y_BL{i}, ux{i}] = eta_BL(OF_run_eta,OF_BL);
    
end

%{
%H014
figure(1)
% Create plots.
t = tiledlayout(5,1);
%ax1 = nexttile;
%plot(ax1,t_OF{7},eta_OF_{7})
ax2 = nexttile;
plot(ax2,t_OF{27},eta_OF_{27}*100)
ax2.XAxis.FontSize = fontSize1;
ax2.YAxis.FontSize = fontSize1;
ax3 = nexttile;
plot(ax3,t_OF{28},eta_OF_{28}*100)
ax3.XAxis.FontSize = fontSize1;
ax3.YAxis.FontSize = fontSize1;
ax4 = nexttile;
plot(ax4,t_OF{29},eta_OF_{29}*100)
ax4.XAxis.FontSize = fontSize1;
ax4.YAxis.FontSize = fontSize1;
ax5 = nexttile;
plot(ax5,t_OF{30},eta_OF_{30}*100)
ax5.XAxis.FontSize = fontSize1;
ax5.YAxis.FontSize = fontSize1;
ax6 = nexttile;
plot(ax6,t_OF{31},eta_OF_{31}*100)
ax6.XAxis.FontSize = fontSize1;
ax6.YAxis.FontSize = fontSize1;

title(t,'Surface elevation','FontSize', 22)
xlabel(t,'time$[s]$','interpreter','latex','FontSize', fontSize1);
ylabel(t,'$\eta$[cm]','interpreter','latex','FontSize', fontSize1);


set(gcf, 'Position',  [300, 300, 800, 550])
%}


%H005
figure(1)
% Create plots.
t = tiledlayout(6,1);
ax1 = nexttile;
plot(ax1,t_OF{1},eta_OF_{1}*100)
ax1.XAxis.FontSize = fontSize1;
ax1.YAxis.FontSize = fontSize1;
ax2 = nexttile;
plot(ax2,t_OF{3},eta_OF_{3}*100)
ax2.XAxis.FontSize = fontSize1;
ax2.YAxis.FontSize = fontSize1;
ax3 = nexttile;
plot(ax3,t_OF{5},eta_OF_{5}*100)
ax3.XAxis.FontSize = fontSize1;
ax3.YAxis.FontSize = fontSize1;
ax4 = nexttile;
plot(ax4,t_OF{7},eta_OF_{7}*100)
ax4.XAxis.FontSize = fontSize1;
ax4.YAxis.FontSize = fontSize1;
ax5 = nexttile;
plot(ax5,t_OF{9},eta_OF_{9}*100)
ax5.XAxis.FontSize = fontSize1;
ax5.YAxis.FontSize = fontSize1;
ax6 = nexttile;
plot(ax6,t_OF{11},eta_OF_{11}*100)
ax6.XAxis.FontSize = fontSize1;
ax6.YAxis.FontSize = fontSize1;

title(t,'Surface elevation','FontSize', 22)
xlabel(t,'time$[s]$','interpreter','latex','FontSize', fontSize1);
ylabel(t,'$\eta$[cm]','interpreter','latex','FontSize', fontSize1);


set(gcf, 'Position',  [300, 300, 800, 550])


%{
%H0075
figure(1)
% Create plots.
t = tiledlayout(5,1);
%ax1 = nexttile;
%plot(ax1,t_OF{7},eta_OF_{7})
ax2 = nexttile;
plot(ax2,t_OF{12},eta_OF_{12}*100)
ax2.XAxis.FontSize = fontSize1;
ax2.YAxis.FontSize = fontSize1;
ax3 = nexttile;
plot(ax3,t_OF{17},eta_OF_{17}*100)
ax3.XAxis.FontSize = fontSize1;
ax3.YAxis.FontSize = fontSize1;
ax4 = nexttile;
plot(ax4,t_OF{19},eta_OF_{19}*100)
ax4.XAxis.FontSize = fontSize1;
ax4.YAxis.FontSize = fontSize1;
ax5 = nexttile;
plot(ax5,t_OF{21},eta_OF_{21}*100)
ax5.XAxis.FontSize = fontSize1;
ax5.YAxis.FontSize = fontSize1;
ax6 = nexttile;
plot(ax6,t_OF{22},eta_OF_{22}*100)
ax6.XAxis.FontSize = fontSize1;
ax6.YAxis.FontSize = fontSize1;

title(t,'Surface elevation','FontSize', 22)
xlabel(t,'time$[s]$','interpreter','latex','FontSize', fontSize1);
ylabel(t,'$\eta$[cm]','interpreter','latex','FontSize', fontSize1);


set(gcf, 'Position',  [300, 300, 800, 550])
%}