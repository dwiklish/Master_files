function [total_flux] = OF_flux(flux_OF_filename)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
data_flux = readtable(flux_OF_filename,'NumHeaderLines',1);
flux = data_flux{:,2}; 
t = data_flux{:,1};
total_flux = mean(flux);

end