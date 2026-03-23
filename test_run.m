% 运行测试脚本
fid = fopen('C:\Users\zhangchun\Documents\MATLAB\run_result.txt','w');
fprintf(fid,'Starting GUI test...\n');
try
    six_source_localization_gui_new;
    fprintf(fid,'SUCCESS: GUI launched\n');
catch ME
    fprintf(fid,'ERROR: %s\n',ME.message);
    for i=1:min(10,length(ME.stack))
        fprintf(fid,'Stack %d: %s line %d\n',i,ME.stack(i).name,ME.stack(i).line);
    end
end
fclose(fid);
exit
