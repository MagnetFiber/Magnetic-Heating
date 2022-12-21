% clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
% clear;  % Erase all existing variables.

Ax = gca;
figureSize = [0 0 9.1 7]; 

M=cd; %saves the current directory

% Nmeas=60; % Number of measurements
% twait=30; % time in seconds waited inbetween measurements
% 
% % sets up matrixes to save temperature values
% time=[0:Nmeas-1];% in seconds
% time=(time'.*twait./60); %change to min
% Taver=[]; % average temperature
% Tmax=[]; % maximal temperature
% Tmin=[]; % minimal temperature

% Open a csv file to save the coordinates of interest
% [fname, dir2]=uigetfile('*.csv', 'Open Datafile - ');
% cd(dir2);
% data = readmatrix(fname);
% pos=[]; %position matrix
% index=1;
% [Y,X] = size(data);
% % 
% % saves x and y coordinates in pos that are inside a circle (x-mx)^2
% % +(y-my)^2 < r^2 extract mx, my and r from the .png images using ImageJ
% 
% mx=337;
% my=230;
% r=(363-311)/2;
% 
% 
% for i=2:X
%     for j=2:Y
%         if ((i-mx)^2 + (j-my)^2) < r^2 
%             pos(index,1)=j;
%             pos(index,2)=i;
%             index=index+1;
%         end
%     end
% end
% % 
% % 
% [M,N] = size(pos);
% % 
% % open the first .csv file of the series to analyze
% [fname, dir2]=uigetfile('*.csv', 'Open First Datafile - ');
% % opens direction of file and changes the ending by deleting to numbers at the end and .csv
% % of the file name to later open the following files
% cd(dir2);
% fname(1:length(fname)-8);
% fnml=length(fname);
% FFN=str2num(fname(fnml-8:fnml-4));
% 
% for i=1:Nmeas
%     % increases the number of the file name by one and adds .csv again 
%     FN=10000+FFN+i-1;
%     FN=num2str(FN);
%     FN=FN(2:5);
%     asc='.csv';
%     fname=[fname(1:length(fname)-8), FN, asc];
%     data = readmatrix(fname); % opens the new file
%     for ii=1:M
%         pos(ii,3)=data(pos(ii,1),pos(ii,2)); % temporarily saves the relevant temperatures in the 3rd column of pos
%     end
%     Taver(i,10)=mean(pos(:,3));
%     Tmax(i,10)=max(max(pos(:,3)));
%     Tmin(i,10)=min(min(pos(:,3)));
% end
% 
% % Second curve
% mx=316;
% my=240;
% r=31;
% 
% pos=[]; %position matrix
% index=1;
% 
% for i=2:X
%     for j=2:Y
%         if ((i-mx)^2 + (j-my)^2) < r^2 
%             pos(index,1)=j;
%             pos(index,2)=i;
%             index=index+1;
%         end
%     end
% end
% 
% 
% [M,N] = size(pos());
% 
% % open the first .csv file of the series to analyze
% [fname, dir2]=uigetfile('*.csv', 'Open First Datafile - ');
% % opens direction of file and changes the ending by deleting to numbers at the end and .csv
% % of the file name to later open the following files
% cd(dir2);
% fname(1:length(fname)-8);
% fnml=length(fname);
% FFN=str2num(fname(fnml-8:fnml-4));
% 
% for i=1:Nmeas
%     % increases the number of the file name by one and adds .csv again 
%     FN=10000+FFN+i-1;
%     FN=num2str(FN);
%     FN=FN(2:5);
%     asc='.csv';
%     fname=[fname(1:length(fname)-8), FN, asc];
%     data = readmatrix(fname); % opens the new file
%     for ii=1:M
%         pos(ii,3)=data(pos(ii,1),pos(ii,2)); % temporarily saves the relevant temperatures in the 3rd column of pos
%     end
%     Taver(i,2)=mean(pos(:,3));
%     Tmax(i,2)=max(max(pos(:,3)));
%     Tmin(i,2)=min(min(pos(:,3)));
% end

% Preparing the matrixes/vectors for plotting
% lay6=[];
% lay4=[];
% lay2=[];
% for i=1:Nmeas
%     lay6(i,1)=mean(Taver(i,1:2));
%     lay6(i,2)=std(Taver(i,1:2));
%     lay4(i,1)=mean(Taver(i,4:6));
%     lay4(i,2)=std(Taver(i,4:6));
%     lay2(i,1)=mean(Taver(i,8:9));
%     lay2(i,2)=std(Taver(i,8:9));
% end
% time = time(:)+5;
% creates a plot of the temperature
figure (1)
hold on
box on

errorbar(time(:),lay6(:,1),lay6(:,2),'-o')
errorbar(time(:),lay4(:,1),lay4(:,2),'-s')
errorbar(time(:),lay2(:,1),lay2(:,2),'-^')

plot(time(:),Taver(:,10),'-d')
% plot(time,Taver(:,1),'dr')
% plot(time,Tmax(:),'r-','LineWidth',1)
% plot(time,Taver(:,10),'b-','LineWidth',1)

% plot(time,Taver(:,2),'r-','LineWidth',1)

plot([5,5], [34,50], '--','Color',[0.6 0.6 0.6],'LineWidth',0.5)
text(4,41.5,'AMF on','Interpreter','Latex','FontSize',8,'Color',[0.6 0.6 0.6],'Rotation',90)

plot([15,15], [34,50], '--','Color',[0.6 0.6 0.6],'LineWidth',0.5)
text(16.5,41.5,'AMF off','Interpreter','Latex','FontSize',8,'Color',[0.6 0.6 0.6],'Rotation',90)
% 
% plot([40,40], [30,45], '--k')
% text(41,44,'AMF off','Interpreter','Latex','FontSize',6)
% 
% plot([0,50], [37,37], '--k')
% text(1,37.5,'T=37','Interpreter','Latex','FontSize',6)
% 
% plot([0,50], [42,42], '--k')
% text(1,42.5,'T=42','Interpreter','Latex','FontSize',6)
% plot(time,Tmin(:),'b-','LineWidth',1)

% m=max(Tmax(5:end));
% leg1=sprintf('T max = %.5g',m);
% leg={leg1,'Taver','Tmin'};
xlabel('Time [min]','Interpreter','latex')
ylabel('Temperature [$^{\circ}$C]','Interpreter','latex')
% legend(leg,'location','northwest','box','off','FontSize',6,'Interpreter','latex')
legend('6 Layers','4 layers','2 layers','PMMA fibers','location','northeast','box','off','FontSize',7,'Interpreter','latex')

% annotation('textarrow',[0.126 0.163],...
%     [0.33 0.235],'String',{'AMF on'},'HeadWidth',4,...
%     'HeadLength',4,'FontSize',6,...
%     'FontName','Times New Roman');

% minimize the white frame around the saved image
outerpos = Ax.OuterPosition;
ti = Ax.TightInset; 
left = outerpos(1) + ti(1)*1.6;
bottom = outerpos(2) + ti(2)*1.5;
ax_width = outerpos(3) - ti(1)*1.7 - ti(3)*1.7;
ax_height = outerpos(4) - ti(2)*1.5 - ti(4)*1.5;
Ax.Position = [left bottom ax_width ax_height];

plotStyleNameValuePairs = {};
tickStyleNameValuePairs = {};

plotStyleNameValuePairs = cat(2,plotStyleNameValuePairs,{'Interpreter','Latex'});
tickStyleNameValuePairs = cat(2,tickStyleNameValuePairs,{'TickLabelInterpreter','Latex'});

% cosmetics for the graph
set(Ax,'FontSize',10)
set(Ax,'TickLabelInterpreter','latex')
set(Ax,'XMinorTick','off','YMinorTick','on')

set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', figureSize); 
a = gca;
% set box property to off and remove background color
set(a,'box','off','color','none')
% create new, empty axes with box but without ticks
b = axes('Position',get(a,'Position'),'box','on','xtick',[],'ytick',[]);
% set original axes as active
axes(a)
% link axes in case of zooming
linkaxes([a b])
% set the limits of the axis
axis([0 25 33 50]);

% save the graph
path = 'C:\Users\domig\polybox\MSc\Thesis\MagneTherm\';
figureName = 'Tcurve_221215_masterPlot_bl';
print(fullfile(path,figureName),'-dpng','-r350')
