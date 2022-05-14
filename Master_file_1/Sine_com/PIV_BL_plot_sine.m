addpath('/Users/kadekjensen/Desktop/Master_files/Master_file_1/Sine_com/Result_PIV_sine/')

run = [25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42];

name = ["Sine wave, H/h = 0.15, T = 2s","Sine wave, H/h = 0.15, T = 1.43s", "Sine wave, H/h = 0.15, T = 1.11s",...
        "Sine wave, H/h = 0.28, T = 1.11s", "Sine wave, H/h = 0.28, T = 1.43s", "Sine wave, H/h = 0.28, T = 2s"];

step = 1;

axis_size = 27;
fontSize1 = 37;
fontSize2 = 22;
fontSize3 = 22;
pltsize = 0.5;
width = 0.75;

M = length(run);
n = round(3:3:M);
l = round(1:3:M);
p = round(2:3:M);

count = 1;

for i = 1:M
    filename_PIV = sprintf('resultrun%d_new',run(i));
    delta = 0.75;
    [ux,y] = plot_BL_PIV(filename_PIV,step,delta);
    N = length(ux);

    for k = 1:length(l)
        if i == l(k)
            plot_name = name(count);
            figure(i)
            count = count + 1;
        end 
    end
   
    for k = 1:length(l) 
    if i == l(k)
        hold on
        for j = 1:N
            h(1)= plot(ux{j},y-50,'.-r','DisplayName','run 1','LineWidth',pltsize);
        end 
    end
    end
    
    for k = 1:length(p)
    if i == p(k)
        hold on
        for j = 1:N
            h(2)=plot(ux{j},y-50,'.-g','DisplayName','run 2','LineWidth',pltsize);
        end 
    end
    end
    
    for k = 1:length(n)
    if i == n(k)
        hold on
        for j = 1:N
            h(3)=plot(ux{j},y-50,'.-b','DisplayName','run 3','LineWidth',pltsize);
        end
        
        set(gca,'fontsize',axis_size);
        set(gcf, 'Position',  [300, 300, 800, 550])
        xlabel('$u_x[cm/s]$','interpreter','latex','FontSize', fontSize1);
        ylabel('$z[cm]$','interpreter','latex','FontSize', fontSize1);
        title(plot_name,'interpreter','latex','FontSize', 32)
        legend(h(1:3),'FontSize', fontSize3)
        grid minor
        axis tight
        hold off
    end
    end
end