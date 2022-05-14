addpath('/Users/kadekjensen/Desktop/Master_files/Master_file_2/etatest_run/')
addpath('/Users/kadekjensen/Desktop/Master_files/Master_file_2/eta_lab/')
addpath('/Users/kadekjensen/Desktop/Master_files/Master_file_2/')

run = [118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129];

run_OF =[118, 118, 118, 121, 121, 121, 124, 124, 124, 127, 127, 127];


trigger = [8.44, 8.44, 8.44, 10.36, 10.36, 10.36, 9.57, 11.38, 11.38,...
           12.86, 12.86, 12.86];

shift = [1.81, 1.81, 1.81, 3.72, 3.72, 3.72, 2.52, 2.52, 2.52, 2.84, 2.84, 2.84 ]; 

name = ["N-wave, $\epsilon$H/h = 0.18", "N-wave, $\epsilon$H/h = 0.28",...
        "N-wave, $\epsilon$H/h = 0.37","N-wave, $\epsilon$H/h = 0.46"];


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

