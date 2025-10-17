function UiModGetSubHeaderColour(arg0)
{
    var _all_name = variable_struct_get_names(global.Mods_Data);
    var _this_mod = _all_name[arg0];
    
    if (variable_struct_get(global.Mods_Data, _this_mod).failed_to_compile)
        return 10592722;
    else
        return 16777215;
}
