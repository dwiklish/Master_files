addpath('/Users/kadekjensen/Desktop/Master_files/Master_file_3/OF_BL_flux')
addpath('/Users/kadekjensen/Desktop/Master_files/Master_file_3/Group_com/OF_extend_group/')
load('flux_BL_group.mat');

axis_size = 27;
fontSize1 = 30;
fontSize2 = 22;
fontSize3 = 22;
ss =3;

N = 12;
flux_group_extend = zeros(1,N);
for i = 1:N
    filename_OF_flux = sprintf('flux_gr%d',i);
    flux_group_extend(i) = OF_flux(filename_OF_flux);
end


flux_OF_gr004 = horzcat(transpose(flux_OF_use(4:6,1)),flux_group_extend(1,1:6));
flux_OF_gr007 = horzcat(transpose(flux_OF_use(1:3,1)),flux_group_extend(1,7:12));
f_group = [0.83, 0.64, 0.46, 0.32, 0.23, 0.18, 0.11, 0.09, 0.06];
f = [0.83, 0.83, 0.83, 0.64, 0.64, 0.64, 0.46, 0.46, 0.46 ]; %frequency exp


figure(1)
l(1) = plot(f(1:9),flux(1:9,2)*10^4,'ko','DisplayName','H/h = 0.14(exp)','LineWidth',ss);
hold on
l(2) = plot(f(1:9),flux(10:18,2)*10^4,'go','DisplayName','H/h = 0.08(exp)','LineWidth',ss);
hold on
l(3) = plot(f_group,flux_OF_gr007*10^4,'+-k','DisplayName','H/h = 0.14(OF)','LineWidth',ss-1);
hold on
l(4) = plot(f_group,flux_OF_gr004*10^4,'+-g','DisplayName','H/h = 0.08(OF)','LineWidth',ss-1);
hold on
yline(0)

set(gca,'fontsize',axis_size);
set(gcf, 'Position',  [300, 300, 800, 550])
xlabel('$f_p$[Hz]','interpreter','latex','FontSize', fontSize1);
ylabel('$\bar{Q}$[cm$^2$/s]','interpreter','latex','FontSize', fontSize1);
legend(l(1:4),'FontSize',fontSize3)
grid minor
hold off

%ERROR H = 0.04

mean_flux_H004  = [mean(flux(10:12,2)), mean(flux(13:15,2)), mean(flux(16:18,2))]*10^4;
err = [std(flux(10:12,2)), std(flux(13:15,2)), std(flux(16:18,2))]*10^4;
f_OF = [0.83 , 0.64, 0.46];

[p,S] = polyfit(f(1:9),flux(10:18,2),1);
x1 = linspace(0,1,1000);
y1 = polyval(p,x1);
[y_fit,delta] = polyval(p,x1,S);

figure(3)
l(17) = errorbar(f_OF,mean_flux_H004,err,'.b','DisplayName','2\sigma_x(mean exp)','LineWidth',ss-1);
hold on
l(18) = plot(f_OF,flux_OF_gr004(1:3)*10^4,'+r','DisplayName','OpenFoam','LineWidth',ss-1);
hold on
l(19) = plot(x1,y_fit*10^4,'k-','DisplayName','linear regression','LineWidth',ss-1);
hold on
l(20)= plot(x1,(y_fit+2*delta)*10^4,'m--','DisplayName','95% Prediction Interval','LineWidth',ss-1);
hold on
l(21)= plot(x1,(y_fit-2*delta)*10^4,'m--','LineWidth',ss-1);

set(gca,'fontsize',axis_size);
set(gcf, 'Position',  [300, 300, 800, 550])
xlabel('$f$[Hz]','interpreter','latex','FontSize', fontSize1);
ylabel('$\bar{Q}$[cm$^2$/s]','interpreter','latex','FontSize', fontSize1);
legend(l(17:20),'FontSize',fontSize3)
grid minor
hold off



%ERROR H = 0.07

mean_flux_H007  = [mean(flux(1:3,2)), mean(flux(4:6,2)), mean(flux(7:9,2))]*10^4;
err = [std(flux(1:3,2)), std(flux(4:6,2)), std(flux(7:9,2))]*10^4;
f_OF = [0.83 , 0.64, 0.46];

[p,S] = polyfit(f(1:9),flux(1:9,2),1);
x1 = linspace(0,1,1000);
y1 = polyval(p,x1);
[y_fit,delta] = polyval(p,x1,S);

figure(4)
l(17) = errorbar(f_OF,mean_flux_H007,err,'.b','DisplayName','2\sigma_x(mean exp)','LineWidth',ss-1);
hold on
l(18) = plot(f_OF,flux_OF_gr007(1:3)*10^4,'+r','DisplayName','OpenFoam','LineWidth',ss-1);
hold on
l(19) = plot(x1,y_fit*10^4,'k-','DisplayName','linear regression','LineWidth',ss-1);
hold on
l(20)= plot(x1,(y_fit+2*delta)*10^4,'m--','DisplayName','95% Prediction Interval','LineWidth',ss-1);
hold on
l(21)= plot(x1,(y_fit-2*delta)*10^4,'m--','LineWidth',ss-1);

set(gca,'fontsize',axis_size);
set(gcf, 'Position',  [300, 300, 800, 550])
xlabel('$f$[Hz]','interpreter','latex','FontSize', fontSize1);
ylabel('$\bar{Q}$[cm$^2$/s]','interpreter','latex','FontSize', fontSize1);
legend(l(17:20),'FontSize',fontSize3)
grid minor
hold off

