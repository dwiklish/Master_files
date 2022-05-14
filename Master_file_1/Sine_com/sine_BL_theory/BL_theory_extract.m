function [u_BL,z] = BL_theory_extract(filename_BL_theory)
%extract theory boundary layer.
data_BL = readtable(filename_BL_theory);
u_BL = data_BL{:,1}*100; %in cm
z = data_BL{:,2}*100; %in cm
end