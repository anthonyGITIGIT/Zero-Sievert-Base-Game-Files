function file_copy_dir(arg0, arg1, arg2 = 16)
{
    if (!directory_exists(argument1))
        directory_create(argument1);
    
    var files = 0;
    var fname = file_find_first(argument0 + "/*.*", argument2);
    var file;
    
    while (fname != "")
    {
        if (fname == ".")
        {
        }
        else if (fname == "..")
        {
        }
        else
        {
            file[files] = fname;
            files += 1;
        }
        
        fname = file_find_next();
    }
    
    file_find_close();
    var i = 0;
    
    repeat (files)
    {
        fname = file[i];
        i += 1;
        var from = argument0 + "/" + fname;
        var to = argument1 + "/" + fname;
        
        if (file_attributes(from, 16))
            file_copy_dir(from, to, argument2);
        else
            file_copy(from, to);
    }
}
