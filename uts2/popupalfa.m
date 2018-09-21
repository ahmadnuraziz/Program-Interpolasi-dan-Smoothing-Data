menualfa=get(alfametode,'Value');
switch menualfa
    case 1
        set(alfa,'visible','off');
        set(ket3,'visible','off');
        set(btn_save,'visible','off');
    case 2
        set(alfa,'visible','on');
        set(ket3,'visible','on');
        set(btn_save,'visible','on');
        
end