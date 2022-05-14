addpath('/Users/kadekjensen/Desktop/Master_files/Master_file_1/');

nm = [300, 600, 750];
M = length(nm);
axis_size = 27;
fontSize1 = 30;
fontSize2 = 22;
fontSize3 = 22;
pltsize = 2;
width = 0.75;

for i = 1:M
    OF_run_eta = sprintf('eta_%d',nm(i));
    OF_BL = sprintf('BL_%d',nm(i));
    [t_OF{i}, eta_OF_{i}, y_BL{i}, ux{i}] = eta_BL(OF_run_eta,OF_BL);
    
end

for i = 1:M
    filename_OF_flux = sprintf('flux_%d',nm(i));
    flux_OF{i} = (OF_flux(filename_OF_flux))*10^4;
end


figure(1)
h(1)= plot(t_OF{i},eta_OF_{1}*100,'g','DisplayName','no.cells = 300000','LineWidth',pltsize);
hold on
h(2)= plot(t_OF{i},eta_OF_{2}*100,'r','DisplayName','no.cells = 600000','LineWidth',pltsize);
hold on
h(3)= plot(t_OF{i},eta_OF_{3}*100,'--b','DisplayName','no.cells = 750000','LineWidth',pltsize);
set(gca,'fontsize',axis_size);
set(gcf, 'Position',  [300, 300, 800, 550])
xlabel('time$[s]$','interpreter','latex','FontSize', fontSize1);
ylabel('$\eta[cm]$','interpreter','latex','FontSize', fontSize1);
%title(plot_name,'interpreter','latex','FontSize', 32)
legend(h(1:3),'FontSize', fontSize3)
grid on%minor
axis tight
hold off

figure(2)
h(4)= plot(ux{1}*100,(y_BL{i}*100)-50,'g','DisplayName','no.cells = 300000','LineWidth',pltsize);
hold on
h(5)= plot(ux{2}*100,(y_BL{i}*100)-50,'r','DisplayName','no.cells = 600000','LineWidth',pltsize);
hold on
h(6)= plot(ux{3}*100,(y_BL{i}*100)-50,'b','DisplayName','no.cells = 750000','LineWidth',pltsize);
set(gca,'fontsize',axis_size);
set(gcf, 'Position',  [300, 300, 800, 550])
xlabel('$u_x$[cm/s]','interpreter','latex','FontSize', fontSize1);
ylabel('$y$[cm]','interpreter','latex','FontSize', fontSize1);
legend(h(4:6),'FontSize', fontSize3)
grid on
axis tight
hold off