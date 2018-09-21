xr = dataku(:,1); %Raw values
yr = dataku(:,2);  %Raw values

x = unique(xr);
y = zeros(size(x));
for cnt = 1:length(x),
    y(cnt) = mean(yr(xr==x(cnt)));
end;

N = size(dataku,1);          % No. data set points
xt = (-10:0.2:70)';
NT = length(xt);        % No. test points
NS = 3;                 % No. of different splines

yh = zeros(NT,NS);
yh(:,2) = csaps(x',y',0.8,xt)';
yh(:,4) = csaps(x',y',0.3,xt)';
yh(:,5) = csaps(x',y',0,xt)';
yh(:,3) = csaps(x',y',0.5,xt)';
yh(:,1) = csaps(x',y',1.0,xt)';

metod = get(alfametode,'Value');

switch metod
    
    case 1  
         set(win,'CurrentAxes',grafik2);
        %FigureSet(1,'LTX');
        h = plot(xt, yh,x,y,'k.');
        set(h,'MarkerSize',8);
        set(h,'LineWidth',1.2);
        xlabel('Input x');
        ylabel('Output y');
        title('Motorcycle Data Smoothing Spline Regression');
        set(gca, 'Box', 'Off');
        grid on;
        axis([-10 70 -150 90]);
        %AxisSet(8);
        legend('\alpha = 1.0','\alpha = 0.8','\alpha = 0.5','\alpha = 0.3','\alpha = 0.0',4);
        
        print -depsc SmoothingSplineEx;
        
    case 2
        set(win,'CurrentAxes',grafik2);
        alpha = str2num(get(alfa,'string'));
        
        yh = csaps(x',y',alpha,xt')';
        h=plot(x,y,'r.');
        set(h,'LineWidth',1.5);
        set(grafik2,'Color',[1 1 1],...
            'Xgrid','on',...
            'Ygrid','on',...
            'NextPlot','add');
        
        h = plot(xt,yh,'b');
        
        set(h,'LineWidth',1.3);
        set(grafik2,'Color',[1 1 1],...
            'Xgrid','on',...
            'Ygrid','on',...
            'NextPlot','replace');
        dataxy=[ xt' yh'];
        
        xlabel('Input x');
        ylabel('Output y');
        
        title(sprintf('Motorcycle Data Smoothing Spline Regression %6.4f',alpha)); 
        set(grafik2,'Userdata',dataxy);
        %eval(st);   
        
end
