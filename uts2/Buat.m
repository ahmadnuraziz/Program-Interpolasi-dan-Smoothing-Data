dataku=get(win,'Userdata');
x=dataku(:,1);
y=dataku(:,2);
xi =[ min(x) :.25:max(x)];

pilihan=get(menu_metode,'Value');
switch pilihan
    case 1
        yi = interp1(x,y,xi,'nearest');
    case 2
        yi = interp1(x,y,xi,'linear');
    case 3
        yi = interp1(x,y,xi,'cubic');
    case 4
        yi = interp1(x,y,xi,'spline');
end;
set(win,'CurrentAxes',...
    grafik);
a=plot(x,y,'or');
set(a,'LineWidth',3);
set(grafik,'Color',[1 0.96 0.9],...
                   'Xgrid','on',...
                   'Ygrid','on',...
                   'NextPlot','add');
a=plot(xi,yi,'-b');
set(a,'LineWidth',2);
set(grafik,'Color',[1 0.96 0.9],...
                   'Xgrid','on',...
                   'Ygrid','on',...
                   'NextPlot','replace');
dataxy=[ xi' yi'];
set(grafik,'Userdata',dataxy);