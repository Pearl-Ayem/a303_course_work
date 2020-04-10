%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: C:\Users\Pearl\Desktop\Edumacation\ATSC 303\Lab 12\23March2011Sounding.xls
%    Worksheet: All Levels
%
% Auto-generated by MATLAB on 06-Apr-2020 22:36:51

%% Setup the Import Options
clc
close all
clear all

opts = spreadsheetImportOptions("NumVariables", 13);

% Specify sheet and range
opts.Sheet = "All Levels";
opts.DataRange = "A2:M4309";

% Specify column names and types
opts.VariableNames = ["Times", "PhPa", "Heightm", "TdegC", "TDdegC", "RH", "vms", "ums", "DDdegN", "FFms", "FFkmh", "LondegE", "LondegN"];
opts.SelectedVariableNames = ["Times", "PhPa", "Heightm", "TdegC", "TDdegC", "RH", "vms", "ums", "DDdegN", "FFms", "FFkmh", "LondegE", "LondegN"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Import the data
data1 = readtable("C:\Users\Pearl\Desktop\Edumacation\ATSC 303\Lab 12\23March2011Sounding.xls", opts, "UseExcel", false);


%% Clear temporary variables
clear opts

%% Problem 1 --> Plot original
figure;
plot(data1.TdegC,data1.PhPa);
hold on;
plot(data1.TDdegC,data1.PhPa);
set(gca,'Ydir','reverse');
xlabel("Temp");
ylabel("Pressure");
legend("T","TD");
title("Raw data");
hold off;

%% Import TD sig all and T sig all
opts = spreadsheetImportOptions("NumVariables", 13);

% Specify sheet and range
opts.Sheet = "Sheet1";
opts.DataRange = "A2:M45";

% Specify column names and types
opts.VariableNames = ["Times", "PhPa", "Heightm", "TdegC", "TDdegC", "RH", "vms", "ums", "DDdegN", "FFms", "FFkmh", "LondegE", "LondegN"];
opts.SelectedVariableNames = ["Times", "PhPa", "Heightm", "TdegC", "TDdegC", "RH", "vms", "ums", "DDdegN", "FFms", "FFkmh", "LondegE", "LondegN"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Import the data
TD_sig_all_points = readtable("C:\Users\Pearl\Desktop\Edumacation\ATSC 303\Lab 12\TD_SIG_ALL.xlsx", opts, "UseExcel", false);
clear opts;
TD_sig_all_points=table2array(TD_sig_all_points);


%======================================================================================

opts = spreadsheetImportOptions("NumVariables", 13);

% Specify sheet and range
opts.Sheet = "Sheet1";
opts.DataRange = "A2:M15";

% Specify column names and types
opts.VariableNames = ["Times", "PhPa", "Heightm", "TdegC", "TDdegC", "RH", "vms", "ums", "DDdegN", "FFms", "FFkmh", "LondegE", "LondegN"];
opts.SelectedVariableNames = ["Times", "PhPa", "Heightm", "TdegC", "TDdegC", "RH", "vms", "ums", "DDdegN", "FFms", "FFkmh", "LondegE", "LondegN"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Import the data
T_sig_all_points = readtable("C:\Users\Pearl\Desktop\Edumacation\ATSC 303\Lab 12\T_SIG_ALL.xlsx", opts, "UseExcel", false);
clear opts
T_sig_all_points=table2array(T_sig_all_points);

%%
% T_sig_points_indices = zeros(length(TD_sig));
% TD_sig_points_indices = zeros(length(T_sig));
% 
% for i = 1:length(T_sig)
%     T_sig_points_indices(i) = T_sig(i).DataIndex;
% end
% 
% 
% for i = 1:length(TD_sig)
%     TD_sig_points_indices(i) = TD_sig(i).DataIndex;
% end

%% Find vars at each index
% % P (hPa),Height (m),T (degC), TD (degC),v (m/s),u (m/s),DD (degN),FF
% % (m/s),FF (km/h);
% 
% 
% 
% 
% T_sig_all_points = zeros(length(T_sig_points_indices),width(data1));
% TD_sig_all_points = zeros(length(TD_sig_points_indices),width(data1));
% 
% for i = 1:length(T_sig_points_indices)
%     index = T_sig_points_indices(i);
%     T_sig_all_points(i,:) = table2array(data1(index,:));
%     
% end
% 
% for i = 1:length(TD_sig_points_indices)
%     index = TD_sig_points_indices(i);
%     TD_sig_all_points(i,:) = table2array(data1(index,:));
% end


%% Add mandatory points to sig points
mandatory_points_hpa=[100, 92.5, 85, 70, 50, 40, 30, 25, 20, 15, 10, 7, 5, 3, 2, 1, 0.7, 0.5, 0.3, 0.2, 0.1]*10;
% lT=length(T_sig_all_points);
% lTD=length(TD_sig_all_points);
% 
% 
% for i=1:length(mandatory_points_hpa)
%     for p =1:height(data1)
%         pressure=round(data1.PhPa(p));
%         if mandatory_points_hpa(i) == pressure
%             T_sig_all_points(lT+i,:) = table2array(data1(p,:));            
%         end
%     end
% end
% 
% for i=1:length(mandatory_points_hpa)
%     for p =1:height(data1)
%         pressure=round(data1.PhPa(p));
%         if mandatory_points_hpa(i) == pressure 
%             TD_sig_all_points(lTD+i,:) = table2array(data1(p,:));
%         end
%     end
% end
            
%%
% maskT=round(data1.PhPa) == 1000 | ...
%     round(data1.PhPa) == 925 | ...
%  round(data1.PhPa) == 850 | ...
%  round(data1.PhPa) == 700 | ...
%  round(data1.PhPa) == 500 | ...
%  round(data1.PhPa) == 400 | ...
%  round(data1.PhPa) == 300 | ...
%  round(data1.PhPa) == 250 | ...
%  round(data1.PhPa) == 200 | ...
%  round(data1.PhPa) == 150 | ...
%  round(data1.PhPa) == 100 | ...
%  round(data1.PhPa) == 70 | ...
%  round(data1.PhPa) == 50 | ...
%  round(data1.PhPa) == 30 | ...
%  round(data1.PhPa) == 20 | ...
%  round(data1.PhPa) == 10 | ...
%  round(data1.PhPa) == 7 | ...
%  round(data1.PhPa) == 5 | ...
%  round(data1.PhPa) == 3 | ...
%  round(data1.PhPa) == 2 | ...
%  round(data1.PhPa) == 1;\
% 
% mand_data=data1(maskT,:);


mand_data=zeros(length(mandatory_points_hpa),width(data1));
for i=1:length(mandatory_points_hpa)
    for p =1:height(data1)
        pressure=round(data1.PhPa(p));
        if mandatory_points_hpa(i) == pressure
            mand_data(i,:) = table2array(data1(p,:));  
        end
    end
end

mand_data( all(~mand_data,2), : ) = [];
%% Plot with new data SORTED
% xT=[T_sig_all_points;mand_data];
% xTD=[TD_sig_all_points;mand_data];
% xTnew=sort(xT);
% xTDnew=sort(xTD);
% 
% figure;
% h1=axes;
% plot(xTnew(:,4),xTnew(:,2),'b-','LineWidth',1);
% hold on;
% plot(xTnew(:,4),xTnew(:,2),'b.','MarkerSize',10);
% plot(mand_data(:,4),mand_data(:,2),'bo');
% plot(data1.TdegC,data1.PhPa,'b--','LineWidth',0.5);
% 
% 
% plot(xTDnew(:,5),xTDnew(:,2),'r-','LineWidth',1);
% plot(xTDnew(:,5),xTDnew(:,2),'r.','MarkerSize',10);
% plot(mand_data(:,5),mand_data(:,2),'ro');
% plot(data1.TDdegC,data1.PhPa,'r--','LineWidth',0.5);
% 
% 
% set(h1,'Ydir','reverse');
% xlabel("Temp (^{\circ}C)");
% ylabel("Pressure (hPa)");
% title("Significant Points Plot");
% % legend("T sig","T","mandatory points T","TD sig","TD","mandatory points TD");
% grid on;
% grid minor;
% hold off;


%% Plot with manually editted TD sig + man points and T sig + man points


figure;
h1=axes;
plot(T_sig_all_points(:,4),T_sig_all_points(:,2),'b.-','LineWidth',1,'MarkerSize',12);
hold on;
plot(data1.TdegC,data1.PhPa,'b--','LineWidth',0.5);
plot(mand_data(:,4),mand_data(:,2),'bo');


plot(TD_sig_all_points(:,5),TD_sig_all_points(:,2),'r.-','LineWidth',1,'MarkerSize',12);
plot(data1.TDdegC,data1.PhPa,'r--','LineWidth',0.5);
plot(mand_data(:,5),mand_data(:,2),'ro');


set(h1,'Ydir','reverse');
xlabel("Temp (^{\circ}C)");
ylabel("Pressure (hPa)");
title("Significant Points Plot");
legend("T sig points","T raw","T mandatory points","TD sig points","TD raw","TD mandatory points");
grid on;
grid minor;
hold off;
