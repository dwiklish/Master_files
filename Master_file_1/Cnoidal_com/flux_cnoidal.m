load('flux_BL_cnoidal_.mat');
axis_size = 27;
fontSize1 = 30;
fontSize2 = 22;
fontSize3 = 22;
ss =3;

f = [0.65, 0.65, 0.65, 0.56, 0.56, 0.56, 0.4, 0.4, 0.4];


%CNOIDAL WAVE H/h = 0.26

mean_flux = [mean(flux(1:3,2)), mean(flux(4:6,2)), mean(flux(7:9,2))]*10^4;
err = [std(flux(1:3,2)), std(flux(4:6,2)), std(flux(7:9,2))]*10^4;
f_OF = [0.65, 0.56, 0.4];

[p,S] = polyfit(f(1:9),flux(1:9,2),1);
x1 = linspace(0,1,1000);
y1 = polyval(p,x1);
[y_fit,delta] = polyval(p,x1,S);

figure(1)
l(1) = plot(f(1:9),flux(1:9,2)*10^4,'ro','DisplayName','H/h = 0.26(exp)','LineWidth',ss);
hold on
l(2) = plot(f_OF,flux_OF_use*10^4,'+-k','DisplayName','H/h = 0.26(OF)','LineWidth',ss-1);
yline(0)
set(gca,'fontsize',axis_size);
set(gcf, 'Position',  [300, 300, 800, 550])
xlabel('$f$[Hz]','interpreter','latex','FontSize', fontSize1);
ylabel('$\bar{Q}$[cm$^2$/s]','interpreter','latex','FontSize', fontSize1);
legend(l(1:2),'FontSize',fontSize3)
grid minor
hold off

%ERROR
figure(3)
l(17) = errorbar(f_OF,mean_flux,err,'.b','DisplayName','2\sigma_x(mean exp)','LineWidth',ss-1);
hold on
l(18) = plot(f_OF,flux_OF_use*10^4,'+r','DisplayName','OpenFOAM','LineWidth',ss-1);
hold on
l(19) = plot(x1,y_fit*10^4,'k-','DisplayName','linear regression','LineWidth',ss-1);
hold on
l(20)= plot(x1,(y_fit+2*delta)*10^4,'m--','DisplayName','95% Prediction Interval','LineWidth',ss-1);
hold on
l(21)= plot(x1,(y_fit-2*delta)*10^4,'m--','LineWidth',ss-1);
yline(0)
set(gca,'fontsize',axis_size);
set(gcf, 'Position',  [300, 300, 800, 550])
xlabel('$f$[Hz]','interpreter','latex','FontSize', fontSize1);
ylabel('$\bar{Q}$[cm$^2$/s]','interpreter','latex','FontSize', fontSize1);
legend(l(17:20),'FontSize',fontSize3)
grid minor
hold off

