function ugc_pre_check(arg0)
{
    var _folder_path = ugc_get_folder() + "\\" + arg0;
    
    if (!directory_exists(_folder_path))
    {
        return 
        {
            value: UnknownEnum.Value_1,
            error: "Directory does not exist"
        };
    }
    
    var _init_file = _folder_path + "\\" + "init.script";
    
    if (!file_exists(_init_file))
    {
        return 
        {
            value: UnknownEnum.Value_2,
            error: "'init.script' is a mandatory file"
        };
    }
    
    var _meta_file = _folder_path + "\\" + "meta.ini";
    
    if (!file_exists(_meta_file))
    {
        return 
        {
            value: UnknownEnum.Value_3,
            error: "'metadata.ini' is a mandatory file"
        };
    }
    
    ini_open(_meta_file);
    var _meta_exists_name = ini_key_exists("mod", "name");
    var _meta_exists_desc = ini_key_exists("mod", "description");
    var _meta_exists_version = ini_key_exists("mod", "version");
    var _meta_exists_author = ini_key_exists("mod", "author");
    ini_close();
    
    if (!_meta_exists_name)
    {
        return 
        {
            value: UnknownEnum.Value_4,
            error: "Missing 'name' in metadata.ini"
        };
    }
    
    if (!_meta_exists_desc)
    {
        return 
        {
            value: UnknownEnum.Value_5,
            error: "Missing 'description' in metadata.ini"
        };
    }
    
    if (!_meta_exists_version)
    {
        return 
        {
            value: UnknownEnum.Value_6,
            error: "Missing 'version' in metadata.ini"
        };
    }
    
    if (!_meta_exists_author)
    {
        return 
        {
            value: UnknownEnum.Value_7,
            error: "Missing 'author' in metadata.ini"
        };
    }
    
    var _icon_file = _folder_path + "\\" + "icon.png";
    
    if (!file_exists(_icon_file))
    {
        return 
        {
            value: UnknownEnum.Value_8,
            error: "'icon.png' is required in mod folder"
        };
    }
    
    return 
    {
        value: UnknownEnum.Value_0,
        error: ""
    };
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8
}
