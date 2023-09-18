function [foldname]=readfile(fl)
foldname = cell(1,length(fl)-2); 
a = 0;
for n = 1 : length(fl)
    if strcmp(fl(n).name, '.') || strcmp(fl(n).name, '..')
        continue;
    else
        a = a + 1;
        foldname{a} = fl(n).name;
    end
end

end