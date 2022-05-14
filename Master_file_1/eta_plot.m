function [eta_lab_s,t_lab,eta_OF_,t_OF] = eta_plot(test_file,eta_lab_file,eta_OF_file,shift_time,trigger_start)
%function to compute surface elevation


run_test = readtable(test_file,'Range','B:F');
eta_test = run_test{:,1:4};

run_lab = readtable(eta_lab_file,'Range','B:F');
eta_lab = run_lab{:,1:4};
M = length(eta_lab);
t_lab = linspace(trigger_start,60,M);
%eta_lab_ = -(eta_lab(:,4) - eta_test(1,4)-0.0014268);
eta_lab_ = -(eta_lab(:,4) - eta_test(1,4));
eta_lab_s = smooth(eta_lab_,0.008,'loess');

dataeta = readtable(eta_OF_file,'NumHeaderLines',1);
t_OF = dataeta{:,1}+shift_time;
eta_OF = dataeta{:,2};%smooth(dataeta{:,2},0.008,'loess');
eta_OF_ = eta_OF-eta_OF(1);
