addpath('/Users/kadekjensen/Desktop/Master_files/Master_file_1/etatest_run/')
addpath('/Users/kadekjensen/Desktop/Master_files/Master_file_1/eta_lab/')
addpath('/Users/kadekjensen/Desktop/Master_files/Master_file_1/')

run = [25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42];


run_OF =[25, 25, 25, 28, 28, 28, 31, 31, 31, 34, 34, 34, 37, 37, 37, 40, 40, 40];


trigger = [13.8, 13.8, 13.8, 24.2, 24.2, 24.2, 15.9, 15.9, 15.9, 15.9, 15.9, 15.9,...
           15.6, 15.6, 15.6, 13.8, 13.8, 13.8];

shift = [0, 0, 0, 0, 0, 0, 0.09, 0.09, 0.09, 0.49, 0.49, 0.49, 0, 0, 0, 0, 0, 0];

name = ["Sine wave, H/h = 0.15, T = 2s","Sine wave, H/h = 0.15, T = 1.43s", "Sine wave, H/h = 0.15, T = 1.11s",...
        "Sine wave, H/h = 0.28, T = 1.11s", "Sine wave, H/h = 0.28, T = 1.43s", "Sine wave, H/h = 0.28, T = 2s"];


axis_size = 27;
fontSize1 = 37;
fontSize2 = 22;
fontSize3 = 22;
pltsize = 2;
width = 0.75;

M = length(run);
n = round(3:3:M);
l = round(1:3:M);
p = round(2:3:M);

ii = 0;
for i = 1:M
    run_ = sprintf('run%d',run(i));
    test_run = sprintf('test_run%d',run_OF(i));
    OF_run = sprintf('OF_run%d',run_OF(i));
    [eta_lab{i}, t_lab{i}, eta_OF{i}, t_OF{i}] = eta_plot(test_run,run_,OF_run,shift(i),trigger(i));

    for k = 1:length(l)
        if i == l(k)
            ii = ii + 1;
            plot_name = name(ii);
            figure(i) 
            h(1)= plot(t_OF{i},eta_OF{i}*100,'k','DisplayName','OF','LineWidth',pltsize);
            hold on
            h(2)= plot(t_lab{i},eta_lab{i}*100,'r','DisplayName','run 1','LineWidth',pltsize);
            hold on
        end 
    end

    for k = 1:length(p)
    if i == p(k)
        h(3)= plot(t_lab{i},eta_lab{i}*100,'g','DisplayName','run 2','LineWidth',pltsize);
        hold on
    end
    end
    
    for k = 1:length(n)
    if i == n(k)
        h(4)= plot(t_lab{i},eta_lab{i}*100,'b','DisplayName','run 3','LineWidth',pltsize);
        
        set(gca,'fontsize',axis_size);
        set(gcf, 'Position',  [300, 300, 800, 550])
        xlabel('time$[s]$','interpreter','latex','FontSize', fontSize1);
        ylabel('$\eta[cm]$','interpreter','latex','FontSize', fontSize1);
        title(plot_name,'interpreter','latex','FontSize', 32)
        legend(h(1:4),'FontSize', fontSize3)
        grid on
        axis tight
        hold off
    end
    end
end

