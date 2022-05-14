function [Ux_,y_delta] = plot_BL_PIV(filename_PIV,step,delta)
% plot BL from experiment

load(filename_PIV)

clear UX

sz = size(Uw);
Nn = sz(2);

UX = cell(1,Nn);
for i = 1:Nn
    u_field = Uw{1,i};
    M_Uw = round(length(u_field(1,:))/2); % middle of velocity field index x-dir
    area_mean = round(M_Uw*6/100);

    UW = Uw{1,i}(:,M_Uw-area_mean:M_Uw+area_mean);
    nn = length(UW(1,:));
    ttl = zeros(length(UW(:,1)),1);
    for j = 1:nn
        ttl = ttl + UW(:,j);
    end
    UX{i}= ttl*100/nn;
end




N_UX = length(UX);
indx_delta = find(y(:,1) <= delta);
y_delta = y(indx_delta);

n = round(1:step:N_UX);
Ux_ = cell(length(n),1);

for j = 1:length(n)
   i = n(j);
   Ux = smooth(UX{i},0.1,'loess');
   Ux(end) = 0;
   Ux_{j} = Ux(indx_delta);
   
end