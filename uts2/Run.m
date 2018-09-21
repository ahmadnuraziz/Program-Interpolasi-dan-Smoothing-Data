
set(win,'CurrentAxes',grafik);
a=plot(x,y,'or');
set(a,'LineWidth',1);
set(grafik,'color',[1 1 1],...
    'XGrid','on',...
    'YGrid','on',...
    'NextPlot','add');
set(win,'Userdata',dataku);

dataku=get(win,'Userdata');
x=dataku(:,1);
y=dataku(:,2);
xi =[ min(x) :.25:max(x)]; 


pilihan=get(menu_metode,'Value');
n = str2num(get(orde,'string'));
switch pilihan
    case 1
        set(grafik,'Color',[1 1 1],...
            'Xgrid','on',...
            'Ygrid','on',...
            'NextPlot','replace');
        
        yi = interp1(x,y,xi,'linear');
        set(win,'CurrentAxes',...
            grafik);
        a=plot(x,y,'r.');
        set(a,'LineWidth',1.8);
        set(grafik,'Color',[1 1 1],...
            'Xgrid','on',...
            'Ygrid','on',...
            'NextPlot','add');
        
        a=plot(xi,yi,'b');
        set(a,'LineWidth',1.3);
        set(grafik,'Color',[1 1 1],...
            'Xgrid','on',...
            'Ygrid','on',...
            'NextPlot','replace');
        
        dataxy=[ xi' yi'];
        xlabel('Input x');
        ylabel('Output y');
        title('Chirp Linear Interpolation');
        set(grafik,'Userdata',dataxy);

    case 2
        set(grafik,'Color',[1 1 1],...
            'Xgrid','on',...
            'Ygrid','on',...
            'NextPlot','replace');
        
        yi = interp1(x,y,xi,'nearest');
        
        set(win,'CurrentAxes',...
            grafik);
        a=plot(x,y,'r.');
        set(a,'LineWidth',1.5);
        set(grafik,'Color',[1 1 1],...
            'Xgrid','on',...
            'Ygrid','on',...
            'NextPlot','add');
        a=plot(xi,yi,'-b');
        set(a,'LineWidth',1.3);
        set(grafik,'Color',[1 1 1],...
            'Xgrid','on',...
            'Ygrid','on',...
            'NextPlot','replace');
        dataxy=[ xi' yi'];
        xlabel('Input x');
        ylabel('Output y');
        title('Chirp Nearest Neighbor Interpolation');
        set(grafik,'Userdata',dataxy);

    case 3
        set(grafik,'Color',[1 1 1],...
            'Xgrid','on',...
            'Ygrid','on',...
            'NextPlot','replace');
        
        const=polyfit(x,y,n);
        yi=polyval(const,xi);
        
        set(win,'CurrentAxes',grafik);
        a=plot(x,y,'r.');
        set(a,'LineWidth',1.8);
        set(grafik,'Color',[1 1 1],...
            'Xgrid','on',...
            'Ygrid','on',...
            'NextPlot','add');
        a=plot(xi,yi,'b');
        set(a,'LineWidth',1.3);
        set(grafik,'Color',[1 1 1],...
            'Xgrid','on',...
            'Ygrid','on',...
            'NextPlot','replace');
        dataxy=[ xi' yi'];
        xlabel('Input x');
        ylabel('Output y');
        title('Chirp Polynomial Interpolation');
        
        set(grafik,'Userdata',dataxy);
    case 4
        set(grafik,'Color',[1 1 1],...
            'Xgrid','on',...
            'Ygrid','on',...
            'NextPlot','replace');
        
        yi = interp1(x,y,xi,'spline');
        set(win,'CurrentAxes',...
            grafik);
        a=plot(x,y,'r.');
        set(a,'LineWidth',1.5);
        set(grafik,'Color',[1 1 1],...
            'Xgrid','on',...
            'Ygrid','on',...
            'NextPlot','add');
        a=plot(xi,yi,'b');
        set(a,'LineWidth',1.3);
        set(grafik,'Color',[1 1 1],...
            'Xgrid','on',...
            'Ygrid','on',...
            'NextPlot','replace');
        dataxy=[ xi' yi'];
        xlabel('Input x');
        ylabel('Output y');
        title('Chirp Cubic Spline Interpolation');
        
        set(grafik,'Userdata',dataxy);
    case 5
        yi= interp1(x,y,xi,'spline');
        yj= interp1(x,y,xi,'linear');
        yk= interp1(x,y,xi,'nearest');
        const=polyfit(x,y,n);
        yl=polyval(const,xi);
        
        set(win,'CurrentAxes',...
            grafik);
        a=plot(x,y,'r.');
        set(a,'LineWidth',1);
        set(grafik,'Color',[1 1 1],...
            'Xgrid','on',...
            'Ygrid','on',...
            'NextPlot','add');
        
        a=plot(xi,yi,'-b');
        set(a,'LineWidth',1);
        set(grafik,'Color',[1 1 1],...
            'Xgrid','on',...
            'Ygrid','on',...
            'NextPlot','replace');
        
        dataxy=[ xi' yi'];
        a=plot(xi,yi,'-r');
        hold on
        set(a,'LineWidth',1);
        set(grafik,'Color',[1 1 1],...
            'Xgrid','on',...
            'Ygrid','on',...
            'NextPlot','add');
        a=plot(xi,yl,'-b');
        hold on
        set(a,'LineWidth',1);
        
        a=plot(xi,yj,'-g');
        hold on
        set(a,'LineWidth',1);
        
        a=plot(xi,yk,'-c');
        hold on
        set(a,'LineWidth',1);
        
        legend('Spline','Polynomial','Linear','Nearest',4);
        
        set(grafik,'Userdata',dataxy);
        xlabel('Input x');
        ylabel('Output y');
        title('All Analytical Interpolation');
end;


