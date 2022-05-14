addpath('/Users/kadekjensen/Desktop/Master_files/Master_file_1/etatest_run/')
addpath('/Users/kadekjensen/Desktop/Master_files/Master_file_1/eta_lab/')
addpath('/Users/kadekjensen/Desktop/Master_files/Master_file_1/')

run = [97, 98, 99, 100, 101, 102, 103, 104, 105];


run_OF =[97, 97, 97, 100, 100, 100, 103, 103, 103];


trigger = [18.15, 18.15, 18.15, 18.44, 18.44, 18.44, 11.16, 11.16, 11.16];

shift = [0, 0, 0, 0, 0, 0, 0, 0, 0];

name = ["Cnoidal wave, T = 1.55s", "Cnoidal wave, T = 1.8s", "Cnoidal wave, T = 2.5s"];


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

