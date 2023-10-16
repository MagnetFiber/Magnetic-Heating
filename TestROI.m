
[fname, dir2]=uigetfile('*.png', 'Open Datafile - ');
cd(dir2);
I = imread(fname);
figure
imshow(I)
roi = images.roi.Circle(gca,'Center',[100 100],'Radius',50,'Color','r','LineWidth',0.2,'FaceAlpha',0);

addlistener(roi,'ROIMoved',@allevents);

function allevents(src,evt)
evname = evt.EventName;
    switch(evname)
        case{'MovingROI'}
            
            
        case{'ROIMoved'}
            disp(['ROI moved Current Center: ' mat2str(evt.CurrentCenter)]);
            disp(['ROI moved Current Radius: ' mat2str(evt.CurrentRadius)]);
    end
end