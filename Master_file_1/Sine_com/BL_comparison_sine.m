addpath('/Users/kadekjensen/Desktop/Master_files/Master_file_1/Sine_com/Result_PIV_sine/')
addpath('/Users/kadekjensen/Desktop/Master_files/Master_file_1/OF_BL_flux')
addpath('/Users/kadekjensen/Desktop/Master_files/Master_file_1/Sine_com/sine_BL_theory/')


run = [25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42];


run_OF =[25, 25, 25, 28, 28, 28, 31, 31, 31, 34, 34, 34, 37, 37, 37, 40, 40, 40];

delt = [0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8,...
        0.8, 0.8, 0.8, 0.8];

name = ["Sine wave, H/h = 0.15", "Sine wave, H/h = 0.28"];

N = length(run);

width = 0.75;

axis_size = 27;
fontSize1 = 37;
fontSize2 = 22;
fontSize3 = 22;
pltsize = 2;

n = round(3:3:N);
q = round(1:3:N);
p = round(2:3:N);
step = 2;
flux = zeros(N,2);
u_BL = cell(N,1);
max_u_BL = zeros(N,2);
idx_max_u_BL = zeros(N,3);
y = cell(1,N);

for i = 1:N
    filename_PIV = sprintf('resultrun%d_new',run(i));
    height = delt(i);           % use for flux calculation
    %height = 1.8;              % use for plotting
    flux(i,1) = run(i);
    [flux(i,2),u_BL{i},y{i}]= flux_PIV(filename_PIV,height,step);
    max_u_BL(i,1) = run(i);
    max_u_BL(i,2) = max(max(u_BL{i}));
    [l,m] = find(u_BL{i,1} == max_u_BL(i,2));
    idx_max_u_BL(i,1) = run(i);
    idx_max_u_BL(i,3) = l;
    idx_max_u_BL(i,2) = m;
end

nm = [0, 9, 18];
M = length(nm);
Bl_use = cell(1,N);

count = 0;

for j = 2:M
figure(j-1)
plot_name = name(j-1);

for i = nm(j-1)+1:nm(j)
    Bl_use{i} = u_BL{i,1}(:,idx_max_u_BL(i,2))*100; %in cm/s
   
    for k = 1:length(q) 
    if i == q(k)
        filename_OF = sprintf('BL_run%d',run_OF(i));
        filename_BL_theory = sprintf('BL_theory_%d',run_OF(i));
        [u_BL_theory,y_theory] = BL_theory_extract(filename_BL_theory);
        [ux_BL,y_OF] = BLayer_OF(filename_OF,2);
        h(1)= plot(Bl_use{i},y{i}-50,'.-r','DisplayName','run 1','LineWidth',pltsize);
        hold on
        h(4)= plot(ux_BL,y_OF-50,'.k','DisplayName','OF','LineWidth',pltsize);
        hold on
        h(5)= plot(u_BL_theory,y_theory-50,'-m','DisplayName','Theory','LineWidth',pltsize);
        hold on
        grid minor
    end
    end
    
    for k = 1:length(p)
    if i == p(k)
        h(2)=plot(Bl_use{i},y{i}-50,'.-g','DisplayName','run 2','LineWidth',pltsize);
        hold on
        grid minor
    end
    end
    
    for k = 1:length(n)
    if i == n(k)
        h(3)=plot(Bl_use{i},y{i}-50,'.-b','DisplayName','run 3','LineWidth',pltsize);
        
        set(gca,'fontsize',axis_size);
        set(gcf, 'Position',  [300, 300, 800, 550])
        xlabel('$u_x[cm/s]$','interpreter','latex','FontSize', fontSize1);
        ylabel('$y[cm]$','interpreter','latex','FontSize', fontSize1);
        title(plot_name,'interpreter','latex','FontSize', 32)
        legend(h(1:4))
        grid minor
        axis tight
        
    end
    end
    if count == nm(j)
        grid minor
        hold off
    end
    count = count + 1;
    
end
end

addpath('/Users/kadekjensen/Desktop/Master_files/Master_file_1/Sine_com/OF_sine_flux')
N = 31;
flux_OF_extend_sin = [];
for j = 1:N
    filename_OF_flux = sprintf('OF_flux_bf_%d',j);
    flx_OF = OF_flux(filename_OF_flux);
    flux_OF_extend_sin = [flux_OF_extend_sin, flx_OF];

end