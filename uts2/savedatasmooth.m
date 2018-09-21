[ filename, pathname] = uiputfile('*.txt',...
                      'Simpan Hasil Sebagai');
eval ([ 'cd ''' pathname ''';']);
filename=[ filename '.txt']
fout=fopen(filename, 'w');

datay=get(grafik2,'Userdata');
x=datay(:,1);
y=datay(:,2);
fprintf(fout,'-----Data Interpolation-----\n');
fprintf(fout,'%8s %8s\r\n','Data X','Data Y');
for i=1:length(x)
    fprintf(fout,'%8.2f %8.2f \r\n', x(i),y(i));
end;
fclose(fout);