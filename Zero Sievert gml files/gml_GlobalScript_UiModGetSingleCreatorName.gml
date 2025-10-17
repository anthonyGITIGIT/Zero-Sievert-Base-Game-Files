function UiModGetSingleCreatorName(arg0)
{
    var _all_name = variable_struct_get_names(global.Mods_Data);
    var _this_mod = _all_name[arg0];
    
    if (!struct_exists(global.Mods_Meta, _this_mod))
        scr_mod_load_mod_meta_data(_this_mod);
    
    return variable_struct_get(global.Mods_Meta, _this_mod).author;
}
