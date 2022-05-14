addpath('/Users/kadekjensen/Desktop/Master_files/Master_file_3/Group_com/Result_PIV_groups/')
addpath('/Users/kadekjensen/Desktop/Master_files/Master_file_3/OF_BL_flux')

run = [43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60];


run_OF =[43, 43, 43, 46, 46, 46, 49, 49, 49, 52, 52, 52, 55, 55, 55, 58, 58, 58];

delt = [0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.8, 0.8, 0.8, 0.6, 0.6, 0.6, 0.6, 0.6,...
        0.6, 0.8, 0.8, 0.8]; % Boundary layer thickness

name = ["Wave group, $H=0.07$m ", "Wave group, $H = 0.04$m"];

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
step = 1;
flux = zeros(N,2);
u_BL = cell(N,1);
max_u_BL = zeros(N,2);
idx_max_u_BL = zeros(N,3);
y = cell(1,N);

for i = 1:N
    filename_PIV = sprintf('resultrun%d_new',run(i));
    height = delt(i);               % use to compute flux in the boundary layer
    %height = 1.8;                  %just for visualitation
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
        [ux_BL,y_OF] = BLayer_OF(filename_OF,2);
        h(1)= plot(Bl_use{i},y{i}-50,'.-r','DisplayName','run 1','LineWidth',pltsize);
        hold on
        h(4)= plot(ux_BL,y_OF-50,'.k','DisplayName','OF','LineWidth',pltsize);
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

flux_OF = zeros(N,1);
for i = 1:N
    filename_OF_flux = sprintf('flux_run%d',run_OF(i));
    flux_OF(i) = OF_flux(filename_OF_flux);
end

OF_indx_flux = (1:3:N);
flux_OF_use = flux_OF(OF_indx_flux);
