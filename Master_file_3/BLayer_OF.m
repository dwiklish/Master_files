function [ux_BL,y_delta] = BLayer_OF(BL_OF_filename,delta)
% extrac the data BL from openfoam

data_BL = readtable(BL_OF_filename,'NumHeaderLines',1);
ux_BL_ = data_BL{:,4}*100; %in cm/s
y_OF = data_BL{:,3}*100; %in cm



indx_delta = find(y_OF(:) <= delta);
y_delta = y_OF(indx_delta);
ux_BL = ux_BL_(indx_delta);

end