addpath('/Users/kadekjensen/Desktop/Master_files/Master_file_3/etatest_run/')
addpath('/Users/kadekjensen/Desktop/Master_files/Master_file_3/eta_lab/')
addpath('/Users/kadekjensen/Desktop/Master_files/Master_file_3/')

run = [43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60];


run_OF =[43, 43, 43, 46, 46, 46, 49, 49, 49, 52, 52, 52, 55, 55, 55, 58, 58, 58];


trigger = [10.6, 10.6, 10.6, 10.1, 10.1, 10.1, 10.5, 10.5, 10.5, 10.8,...
           10.8, 10.8, 10.2, 10.2, 10.2, 10.8, 10.8, 10.8];

shift = [-0.21, -0.21, -0.21, -0.41, -0.41, -0.41, -0.55, -0.55, -0.55,...
         -0.25, -0.25, -0.25, -0.39, -0.39, -0.39, -0.54, -0.54, -0.54];

name = ["Wave group, T1 = 1.11s, T2 = 1.33s","Wave group,  T1 = 1.43s, T2 = 1.72s",...
        "Wave group, T1 = 2s, T2 = 2.4s", "Wave group, T1 = 1.11s, T2 = 1.33s","Wave group, T1 = 1.43s, T2 = 1.72s",...
        "Wave group, T1 = 2s, T2 = 2.4s"];


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

