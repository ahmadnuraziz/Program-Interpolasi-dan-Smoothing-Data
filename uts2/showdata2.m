set(win,'CurrentAxes',grafik2);
a=plot(x,y,'r.');
set(a,'LineWidth',1.5);
set(grafik2,'color',[1 1 1],...
    'XGrid','on',...
    'YGrid','on',...
    'NextPlot','add');
xlabel('Input x');
ylabel('Output y');
%title('MotorCycleData.txt');

set(win,'Userdata',dataku);