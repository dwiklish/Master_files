function [flux_mean,u_BL_,y_delta] = flux_PIV(filename_PIV,delta,step)
%Function for calculate flux

load(filename_PIV)

clear UX

sz = size(Uw);
Nn = sz(2);

UX_PIV = cell(1,Nn);% No of PIV calculation in one period
for i = 1:Nn
    u_field = Uw{1,i};
    M_Uw = round(length(u_field(1,:))/2); % middle of PIV index x-dir
    area_mean = round(M_Uw*6/100); %index to move right and left from midle PIV index in x dir

    UW = Uw{1,i}(:,M_Uw-area_mean:M_Uw+area_mean);
    nn = length(UW(1,:));

    ttl = zeros(length(UW(:,1)),1);
    for j = 1:nn
        ttl = ttl + UW(:,j);
    end
    UX_PIV{i}= ttl*100/nn; %convert to cm
end

N_UX = length(UX_PIV);
indx_delta = find(y(:,1) <= delta);
u_BL = zeros(length(indx_delta),N_UX);
dy = (y(indx_delta(1),1) - y(indx_delta(2),1))/100; % in m
y_delta = y(indx_delta);


for i = 1:N_UX
   Ux = smooth(UX_PIV{i},0.1,'loess');
   Ux(end) = 0;
   Ux_{i} = Ux;
   u_BL(:,i) = Ux(indx_delta)/100;% in m/s
end
   
N_UX_ = (1:step:N_UX);

u_BL_l = u_BL(:,N_UX_); %point in one period for flux computation.
flux_sum = zeros(length(N_UX_),1);

for i = 1:length(N_UX_)
    flux_sum(i,1) = sum(u_BL_l(:,i))*dy;
end
flux_mean = mean(flux_sum);
u_BL_ = u_BL;
