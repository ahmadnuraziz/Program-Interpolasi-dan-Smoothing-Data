[filename, pathname] = ...
     uigetfile('*.txt','Select your data');
 
if isequal(filename,0)
   disp('User selected Cancel')
else
   disp(['User selected ', fullfile(pathname, filename)])
end

set(data,'string',fullfile(pathname,filename));
