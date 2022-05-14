
N = 12;

t_OF = cell(1,N);
eta_OF_ = cell(1,N);
for j = 1:N
    eta_OF_file = sprintf('eta_gr%d',j);
    [t_OF{j},eta_OF_{j}] = eta_OF(eta_OF_file);
    
end


axis_size = 27;
fontSize1 = 20;
fontSize2 = 22;
fontSize3 = 22;
pltsize = 2;
width = 0.75;


figure(1)
% Create plots.
t = tiledlayout(5,1);
ax2 = nexttile;
plot(ax2,t_OF{2},eta_OF_{2}*100)
ax2.XAxis.FontSize = fontSize1;
ax2.YAxis.FontSize = fontSize1;
ax3 = nexttile;
plot(ax3,t_OF{3},eta_OF_{3}*100)
ax3.XAxis.FontSize = fontSize1;
ax3.YAxis.FontSize = fontSize1;
ax4 = nexttile;
plot(ax4,t_OF{4},eta_OF_{4}*100)
ax4.XAxis.FontSize = fontSize1;
ax4.YAxis.FontSize = fontSize1;
ax5 = nexttile;
plot(ax5,t_OF{5},eta_OF_{5}*100)
ax5.XAxis.FontSize = fontSize1;
ax5.YAxis.FontSize = fontSize1;
ax6 = nexttile;
plot(ax6,t_OF{6},eta_OF_{6}*100)
ax6.XAxis.FontSize = fontSize1;
ax6.YAxis.FontSize = fontSize1;

title(t,'Surface elevation','FontSize', 22)
xlabel(t,'time$[s]$','interpreter','latex','FontSize', fontSize1);
ylabel(t,'$\eta$[cm]','interpreter','latex','FontSize', fontSize1);


set(gcf, 'Position',  [300, 300, 800, 550])