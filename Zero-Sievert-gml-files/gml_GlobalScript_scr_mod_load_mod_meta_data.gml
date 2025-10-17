function scr_mod_load_mod_meta_data(arg0)
{
    var _folder_path = variable_struct_get(global.Mods_Data, arg0).file_path;
    var _meta_file = _folder_path + "\\" + "meta.ini";
    
    if (!directory_exists(_folder_path))
    {
        show_debug_message("Mod Error: Folder didnt exist to load meta data.");
        variable_struct_set(global.Mods_Meta, arg0, 
        {
            name: "No Data",
            description: "No Data",
            version: "No Data",
            author: "No Data",
            tags: "No Data"
        });
        return false;
    }
    
    if (!file_exists(_meta_file))
    {
        show_debug_message("Mod Error: File didnt exist to load meta data.");
        variable_struct_set(global.Mods_Meta, arg0, 
        {
            name: "No Data",
            description: "No Data",
            version: "No Data",
            author: "No Data",
            tags: "No Data"
        });
        return false;
    }
    
    ini_open(_meta_file);
    variable_struct_set(global.Mods_Meta, arg0, 
    {
        name: ini_read_string("mod", "name", "Not Loaded"),
        description: ini_read_string("mod", "description", "Not Loaded"),
        version: ini_read_string("mod", "version", "Not Loaded"),
        author: ini_read_string("mod", "author", "Not Loaded"),
        tags: ini_read_string("mod", "tags", "Not Loaded")
    });
    ini_close();
}
