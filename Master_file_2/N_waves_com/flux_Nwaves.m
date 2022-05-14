load('flux_BL_Nwaves.mat');

axis_size = 27;
fontSize1 = 30;
fontSize2 = 22;
fontSize3 = 22;
ss =3;

eps = [0.18, 0.18, 0.18, 0.28, 0.28, 0.28, 0.37, 0.37, 0.37, 0.46, 0.46, 0.46];

eps_OF = [0.18, 0.28, 0.37, 0.46];

mean_flux = [mean(flux(1:3,2)), mean(flux(4:6,2)), mean(flux(7:9,2)), mean(flux(10:12,2))]*10^4; %in cm^2/s
err = [std(flux(1:3,2)), std(flux(4:6,2)), std(flux(7:9,2)), std(flux(10:12,2))]*10^4;%in cm^2/s

[p,S] = polyfit(eps(1:12),flux(1:12,2),1); 
x1 = linspace(0,1,1000);
y1 = polyval(p,x1);
[y_fit,delta] = polyval(p,x1,S);



figure(1)
l(11) = plot(eps(1:12),flux(1:12,2)*10^4,'ko','DisplayName','Experiment','LineWidth',ss);
hold on
l(12) = plot(eps_OF,flux_OF_use*10^4,'+-r','DisplayName','OpenFOAM','LineWidth',ss-1);
hold on
yline(0)

set(gca,'fontsize',axis_size);
set(gcf, 'Position',  [300, 300, 800, 550])
xlabel('$\epsilon$ H/h','interpreter','latex','FontSize', fontSize1);
ylabel('$\bar{Q}$[cm$^2$/s]','interpreter','latex','FontSize', fontSize1);
legend(l(11:12),'FontSize',fontSize3)
grid minor
hold off

%ERROR
figure(3)
l(17) = errorbar(eps_OF(1:4),mean_flux,err,'.b','DisplayName','2\sigma_x(mean exp)','LineWidth',ss-1);
hold on
l(18) = plot(eps_OF,flux_OF_use*10^4,'+r','DisplayName','OpenFoam','LineWidth',ss-1);
hold on
l(19) = plot(x1,y_fit*10^4,'k-','DisplayName','linear regression','LineWidth',ss-1);
hold on
l(20)= plot(x1,(y_fit+2*delta)*10^4,'m--','DisplayName','95% Prediction Interval','LineWidth',ss-1);
hold on
l(21)= plot(x1,(y_fit-2*delta)*10^4,'m--','LineWidth',ss-1);

set(gca,'fontsize',axis_size);
set(gcf, 'Position',  [300, 300, 800, 550])
xlabel('$\epsilon H/h$','interpreter','latex','FontSize', fontSize1);
ylabel('$\bar{Q}$[cm$^2$/s]','interpreter','latex','FontSize', fontSize1);
legend(l(17:20),'FontSize',fontSize3)
grid minor
hold off

