clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables.

Ax = gca;
figureSize = [0 0 9.1 7]; 

M=cd; %saves the current directory

Nmeas=48; % Number of measurements
twait=30; % time in seconds waited inbetween measurements

% sets up matrixes to save temperature values
time=[0:Nmeas-1];% in seconds
time=(time'.*twait./60); %change to min
Taver=[]; % average temperature
Tmax=[]; % maximal temperature 
Tmin=[]; % minimal temperature
Temp1=[];
Temp2=[];
Temp3=[];
Temp4=[];

% % Open a csv file to save the coordinates of interest
[fname, dir2]=uigetfile('*.csv', 'Open Datafile - ');
cd(dir2);
data = readmatrix(fname);
pos=[];%zeros(3250,12); %position matrix
index1=1;
index2=1;
index3=1;
index4=1;
index5=1;
index6=1;
index7=1;
[Y,X] = size(data);
% 
% % saves x and y coordinates in pos that are inside a circle (x-mx)^2
% % +(y-my)^2 < r^2 extract mx, my and r from the .png images using ImageJ
% 
mx1=351.36;
my1=252.73;
r=20.75;

mx2=382.51;
my2=200.18;

mx3=351.49;
my3=144.75;

mx4=290.33;
my4=146.14; 

mx5=260.32;
my5=199.20;

mx6=288.18;
my6=254.30;

mx7=320.97;
my7=200.10;


for i=2:X
    for j=2:Y
        if ((i-mx1)^2 + (j-my1)^2) < r^2 
            pos(index1,1)=j; 
            pos(index1,2)=i;
            index1=index1+1;
        elseif ((i-mx2)^2 + (j-my2)^2) < r^2 
            pos(index2,4)=j;
            pos(index2,5)=i;
            index2=index2+1;
        elseif ((i-mx3)^2 + (j-my3)^2) < r^2 
            pos(index3,7)=j;
            pos(index3,8)=i;
            index3=index3+1;
        elseif ((i-mx4)^2 + (j-my4)^2) < r^2 
            pos(index4,10)=j;
            pos(index4,11)=i;
            index4=index4+1;
        elseif ((i-mx5)^2 + (j-my5)^2) < r^2 
            pos(index5,13)=j;
            pos(index5,14)=i;
            index5=index5+1;
        elseif ((i-mx6)^2 + (j-my6)^2) < r^2 
            pos(index6,16)=j;
            pos(index6,17)=i;
            index6=index6+1;
        elseif ((i-mx7)^2 + (j-my7)^2) < r^2 
            pos(index7,19)=j;
            pos(index7,20)=i;
            index7=index7+1;
        end
    end
end


[M,N] = size(pos);
% 
% open the first .csv file of the series to analyze
% [fname, dir2]=uigetfile('*.csv', 'Open First Datafile - ');
% opens direction of file and changes the ending by deleting to numbers at the end and .csv
% of the file name to later open the following files
cd(dir2);
fname(1:length(fname)-8);
fnml=length(fname);
FFN=str2num(fname(fnml-8:fnml-4));

for n=1:Nmeas
%     increases the number of the file name by one and adds .csv again 
    FN=10000+FFN+n-1;
    FN=num2str(FN);
    FN=FN(2:5);
    asc='.csv';
    fname=[fname(1:length(fname)-8), FN, asc];
    data = readmatrix(fname); % opens the new file
    for ii=1:M
        if pos(ii,1)>0
            pos(ii,3)=data(pos(ii,1),pos(ii,2)); % temporarily saves the relevant temperatures in the 3rd column of pos
        end
        if pos(ii,4)>0
            pos(ii,6)=data(pos(ii,4),pos(ii,5)); % temporarily saves the relevant temperatures in the 3rd column of pos
        end
        if pos(ii,7)>0
            pos(ii,9)=data(pos(ii,7),pos(ii,8)); % temporarily saves the relevant temperatures in the 3rd column of pos
        end
        if pos(ii,10)>0
            pos(ii,12)=data(pos(ii,10),pos(ii,11)); % temporarily saves the relevant temperatures in the 3rd column of pos
        end
        if pos(ii,13)>0
            pos(ii,15)=data(pos(ii,13),pos(ii,14)); % temporarily saves the relevant temperatures in the 3rd column of pos
        end
        if pos(ii,16)>0
            pos(ii,18)=data(pos(ii,16),pos(ii,17)); % temporarily saves the relevant temperatures in the 3rd column of pos
        end
        if pos(ii,19)>0
            pos(ii,21)=data(pos(ii,19),pos(ii,20)); % temporarily saves the relevant temperatures in the 3rd column of pos
        end
    end
    Taver(n,1)=mean(pos(:,3));
    Tmax(n,1)=max(pos(:,3));
    Tmin(n,1)=min(pos(1:(end),3));
    Temp1(:,n)=pos(1:(end),3);
    
    Taver(n,2)=mean(pos(:,6));
    Tmax(n,2)=max(pos(:,6));
    Tmin(n,2)=min(pos(1:(end),6));
    Temp2(:,n)=pos(1:(end),6);
    
    Taver(n,3)=mean(pos(:,9));
    Tmax(n,3)=max(max(pos(:,9)));
    Tmin(n,3)=min(min(pos(1:(end),9)));
    Temp3(:,n)=pos(1:(end),9);
    
    Taver(n,4)=mean(pos(:,12));
    Tmax(n,4)=max(max(pos(:,12)));
    Tmin(n,4)=min(min(pos(1:(end),12)));
    Temp4(:,n)=pos(1:(end),12);

    Taver(n,5)=mean(pos(:,15));
    Tmax(n,5)=max(max(pos(:,15)));
    Tmin(n,5)=min(min(pos(1:(end),15)));
    Temp5(:,n)=pos(1:(end),15);

    Taver(n,6)=mean(pos(:,18));
    Tmax(n,6)=max(max(pos(:,18)));
    Tmin(n,6)=min(min(pos(1:(end),18)));
    Temp6(:,n)=pos(1:(end),18);
    
    Taver(n,7)=mean(pos(:,21));
    Tmax(n,7)=max(max(pos(:,21)));
    Tmin(n,7)=min(min(pos(1:(end),21)));
    Temp7(:,n)=pos(1:(end),21);
end


% Preparing the matrixes/vectors for plotting
% lay6=[];
% lay4=[];
% lay2=[];
% for i=1:Nmeas
%     lay6(i,1)=mean(Taver(i,1:4));
%     lay6(i,2)=std(Taver(i,1:4));
%     lay4(i,1)=mean(Taver(i,1:4));
%     lay4(i,2)=std(Taver(i,1:4));
%     lay2(i,1)=mean(Taver(i,1:4));
%     lay2(i,2)=std(Taver(i,1:4));
% end
% time = time(:)+5;
% creates a plot of the temperature
figure (1)
hold on
box on

% errorbar(time(:),lay6(:,1),lay6(:,2),'-o')
% errorbar(time(:),lay4(:,1),lay4(:,2),'-s')
% errorbar(time(:),lay2(:,1),lay2(:,2),'-^')

plot(time(:),Taver(:,1),'-o')
plot(time(:),Taver(:,2),'-s')
plot(time(:),Taver(:,3),'-^')
plot(time(:),Taver(:,4),'-*')
plot(time(:),Taver(:,5),'-x')
plot(time(:),Taver(:,6),'-d')
plot(time(:),Taver(:,7),'-v')

% plot(time(:),Taver(:,1),'-o')
% plot(time(:),Tmax(:,1),'-s')
% plot(time(:),Tmin(:,1),'-^')

% plot(time(:),Taver(:,2),'-o')
% plot(time(:),Tmax(:,2),'-s')
% plot(time(:),Tmin(:,2),'-^')

% plot(time(:),Taver(:,3),'-o')
% plot(time(:),Tmax(:,3),'-s')
% plot(time(:),Tmin(:,3),'-^')

% plot(time(:),Taver(:,4),'-o')
% plot(time(:),Tmax(:,4),'-s')
% plot(time(:),Tmin(:,4),'-^')

% plot(time(:),Taver(:,5),'-o')
% plot(time(:),Tmax(:,5),'-s')
% plot(time(:),Tmin(:,5),'-^')

% plot(time(:),Taver(:,6),'-o')
% plot(time(:),Tmax(:,6),'-s')
% plot(time(:),Tmin(:,6),'-^')

% plot(time(:),Taver(:,7),'-o')
% plot(time(:),Tmax(:,7),'-s')
% plot(time(:),Tmin(:,7),'-^')

% boxchart(Temp3)


% deltaT=mean(Taver(33:39,1))-mean(Taver(11:19,1));
% plot(time,Taver(:,1),'dr')
% plot(time,Tmax(:),'r-','LineWidth',1)
% plot(time,Taver(:,10),'b-','LineWidth',1)

% plot(time,Taver(:,2),'r-','LineWidth',1)
% 
% plot([5,5], [34,50], '--','Color',[0.6 0.6 0.6],'LineWidth',0.5)
% text(4,41.5,'AMF on','Interpreter','Latex','FontSize',8,'Color',[0.6 0.6 0.6],'Rotation',90)
% 
% plot([15,15], [34,50], '--','Color',[0.6 0.6 0.6],'LineWidth',0.5)
% text(16.5,41.5,'AMF off','Interpreter','Latex','FontSize',8,'Color',[0.6 0.6 0.6],'Rotation',90)
% 
% plot([40,40], [30,45], '--k')
% text(41,44,'AMF off','Interpreter','Latex','FontSize',6)
% 
% blub=strcat('deltaT=',num2str(deltaT,'%.1f'),'°C');
% plot([0,50], [37,37], '--k')
% text(1,37.5,'T=37','Interpreter','Latex','FontSize',6)
% text(20,50,blub,'Interpreter','Latex','FontSize',6)
% 
% plot([0,50], [45,45], '--k')
% text(0.5,45.5,'T=45','Interpreter','Latex','FontSize',6)
% plot(time,Tmin(:),'b-','LineWidth',1)

% m=max(Tmax(5:end));
% leg1=sprintf('T max = %.5g',m);
% leg={leg1,'Taver','Tmin'};
xlabel('Time [min]','Interpreter','latex')
ylabel('Temperature [$^{\circ}$C]','Interpreter','latex')
% % legend(leg,'location','northwest','box','off','FontSize',6,'Interpreter','latex')
% legend('6 Layers','4 Layers','2 Layers','location','northwest','box','off','FontSize',7,'Interpreter','latex')
% 
% % annotation('textarrow',[0.126 0.163],...
% %     [0.33 0.235],'String',{'AMF on'},'HeadWidth',4,...
% %     'HeadLength',4,'FontSize',6,...
% %     'FontName','Times New Roman');
% 
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
axis([0 24 20 70]);

% save the graph
path = 'C:\Users\domig\Documents\Thesis\MagneTherm\231012';
figureName = '231012_04';
print(fullfile(path,figureName),'-dpng','-r350')

samp1 = mean(Taver(15:44,1))
samp2 = mean(Taver(15:44,2))
samp3 = mean(Taver(15:44,3))
samp4 = mean(Taver(15:44,4))
samp5 = mean(Taver(15:44,5))
samp6 = mean(Taver(15:44,6))
samp7 = mean(Taver(15:44,7))

