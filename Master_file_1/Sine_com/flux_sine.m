load('flux_BL_sine.mat');
axis_size = 27;
fontSize1 = 30;
fontSize2 = 22;
fontSize3 = 22;
ss =3;

f = [0.5, 0.5, 0.5, 0.67, 0.67, 0.67, 0.9, 0.9, 0.9, 0.9, 0.9, 0.9,...
     0.67, 0.67, 0.67,0.5, 0.5, 0.5];

f_sin = [1.16, 1.0, 0.9, 0.67, 0.5, 0.4, 0.33, 0.25, 0.2, 0.13, 0.06,...
         1.16, 1.0, 0.9, 0.67, 0.5, 0.4, 0.33, 0.25, 0.2, 0.13, 0.06,...
          0.9, 0.67, 0.5, 0.4, 0.33, 0.25, 0.2, 0.13, 0.06];


%SINE WAVE H/h = 0.15

mean_flux_H015  = [mean(flux(1:3,2)), mean(flux(4:6,2)), mean(flux(7:9,2))]*10^4;
err = [std(flux(1:3,2)), std(flux(4:6,2)), std(flux(7:9,2))]*10^4;
f_OF = [0.5, 0.67, 0.9];


[p,S] = polyfit(f(1:9),flux(1:9,2),1);
x1 = linspace(0,1,1000);
y1 = polyval(p,x1);
[y_fit,delta] = polyval(p,x1,S);

figure(1)
l(1) = plot(f(1:9),flux(1:9,2)*10^4,'ro','DisplayName','H/h = 0.15(exp)','LineWidth',ss);
hold on
l(2) = plot(f(10:18),flux(10:18,2)*10^4,'bo','DisplayName','H/h = 0.28(exp)','LineWidth',ss);
hold on
l(3) = plot(f_sin(1:11),flux_OF_extend_sin(1:11)*10^4,'+-c','DisplayName','H/h = 0.10(OF)','LineWidth',ss-1);
hold on
l(4) = plot(f_sin(12:22),flux_OF_extend_sin(12:22)*10^4,'+-r','DisplayName','H/h = 0.15(OF)','LineWidth',ss-1);
hold on
l(5) = plot(f_sin(23:end),flux_OF_extend_sin(23:end)*10^4,'+-b','DisplayName','H/h = 0.28(OF)','LineWidth',ss-1);
yline(0)
set(gca,'fontsize',axis_size);
set(gcf, 'Position',  [300, 300, 800, 550])
xlabel('$f$[Hz]','interpreter','latex','FontSize', fontSize1);
ylabel('$\bar{Q}$[cm$^2$/s]','interpreter','latex','FontSize', fontSize1);
legend(l(1:5),'FontSize',fontSize3)
grid minor
hold off

%ERROR
figure(3)
l(17) = errorbar(f_OF,mean_flux_H015,err,'.b','DisplayName','2\sigma_x(mean exp)','LineWidth',ss-1);
hold on
l(18) = plot(f_sin(14:16),flux_OF_extend_sin(14:16)*10^4,'+r','DisplayName','Sine(OF)','LineWidth',ss-1);
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


%SINE WAVE H/h = 0.28

mean_flux_H028  = [mean(flux(16:18,2)), mean(flux(13:14,2)), mean(flux(10:12,2))]*10^4;
err_ = [std(flux(16:18,2)), std(flux(13:14,2)), std(flux(10:12,2))]*10^4;
f_OF = [0.5, 0.67, 0.9];

[p_,S_] = polyfit(f(10:18),flux(10:18,2),1);
x1_ = linspace(0,1,1000);
y1_ = polyval(p_,x1_);
[y_fit_,delta_] = polyval(p_,x1_,S_);

%ERROR
figure(4)
l(6) = errorbar(f_OF,mean_flux_H028,err_,'.b','DisplayName','2\sigma_x(mean exp)','LineWidth',ss-1);
hold on
l(7) = plot(f_sin(23:25),flux_OF_extend_sin(23:25)*10^4,'+r','DisplayName','Sine(OF)','LineWidth',ss-1);
hold on
l(8) = plot(x1_,y_fit_*10^4,'k-','DisplayName','linear regression','LineWidth',ss-1);
hold on
l(9)= plot(x1_,(y_fit_+2*delta_)*10^4,'m--','DisplayName','95% Prediction Interval','LineWidth',ss-1);
hold on
l(10)= plot(x1_,(y_fit_-2*delta_)*10^4,'m--','LineWidth',ss-1);

set(gca,'fontsize',axis_size);
set(gcf, 'Position',  [300, 300, 800, 550])
xlabel('$f$[Hz]','interpreter','latex','FontSize', fontSize1);
ylabel('$\bar{Q}$[cm$^2$/s]','interpreter','latex','FontSize', fontSize1);
legend(l(6:9),'FontSize',fontSize3)
grid minor
hold off


