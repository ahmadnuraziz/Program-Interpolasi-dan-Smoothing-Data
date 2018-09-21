menu=get(menu_metode,'Value');
switch menu
    case 1
        set(orde,'visible','off');
        set(ket3,'visible','off');
    case 2
        set(orde,'visible','off');
        set(ket3,'visible','off');
    case 3
        set(orde,'visible','on');
        set(ket3,'visible','on');
    case 4
        set(orde,'visible','off');
        set(ket3,'visible','off');
    case 5
        set(orde,'visible','on');
        set(ket3,'visible','on');
end
